package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"strconv"
	"time"

	"github.com/go-chi/chi"
	"github.com/maxpojchapol/poc_monbaree/pkg/models"
	"github.com/maxpojchapol/poc_monbaree/pkg/render"
	"github.com/maxpojchapol/poc_monbaree/pkg/util"
)

func (m *Repository) GetOrderTable(w http.ResponseWriter, r *http.Request) {
	_, orderdetail := m.DB.QueryOrderDetail()
	// Get all order
	// fromDate := time.Now().AddDate(0, 0, 0)
	fromDate := time.Now().AddDate(0, 0, -1)
	toDate := time.Now()
	_, orderlist := m.DB.QueryOrder(fromDate, toDate, "all")
	product_productoption_map := util.Order_OrderDetail_map(orderlist, orderdetail)
	data := make(map[string]interface{})
	data["fromDate"] = fromDate.AddDate(0, 0, 1).Format("2006-01-02")
	data["toDate"] = toDate.Format("2006-01-02")
	data["filterOption"] = "all"
	fmt.Println(data)
	render.RenderTemplate(w, r, "order_list.page.tmpl", &models.TemplateData{
		OrderData: product_productoption_map,
		Data:      data,
	})
}
func (m *Repository) GetUserTable(w http.ResponseWriter, r *http.Request) {
	_, userdetail := m.DB.QueryUserDetail()
	userCredit := []models.User_Credit{}
	data := make(map[string]int)
	data["creditredeemed"] = 0
	data["creditused"] = 0
	data["creditremain"] = 0
	data["totalpinto"] = 0
	data["totalspend"] = 0
	for _, userdetail := range userdetail {
		totalredeem, pintoredeem := m.DB.QueryTotalRedeem(userdetail.Lineuserid)
		totalSpend := m.DB.QueryTotalSpend(userdetail.Lineuserid)
		userCredit = append(userCredit, models.User_Credit{
			User:         userdetail,
			CreditRedeem: totalredeem,
			PintoRedeem:  pintoredeem,
			CreditUse:    totalredeem - userdetail.AmountRemain,
			TotalSpend:   totalSpend,
		})
		data["creditredeemed"] += totalredeem
		data["totalpinto"] += pintoredeem
		data["creditused"] += (totalredeem - userdetail.AmountRemain)
		data["totalspend"] += totalSpend
		data["creditremain"] += userdetail.AmountRemain
	}

	render.RenderTemplate(w, r, "user_list.page.tmpl", &models.TemplateData{
		UserData:     userCredit,
		StringIntMap: data,
	})
	fmt.Println(userdetail)
}

func (m *Repository) Admin(w http.ResponseWriter, r *http.Request) {

	render.RenderTemplate(w, r, "admin.page.tmpl", &models.TemplateData{})
}

func (m *Repository) AddPintoCodeForAdmin(w http.ResponseWriter, r *http.Request) {
	var lineUserDetails []map[string]interface{}

	// m.App.Session.Put(r.Context(), "User", user)
	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	tmplineuseradmin := user.Lineuserid
	_, userdetails := m.DB.QueryAllUserDetail()
	// fmt.Println(userdetails[0].Lineuserid)

	for _, userdetail := range userdetails {
		var lineUserDetail map[string]interface{}
		url := fmt.Sprintf("https://api.line.me/v2/bot/profile/%s", userdetail.Lineuserid)

		// Create a GET request
		req, err := http.NewRequest("GET", url, nil)
		if err != nil {
			http.Error(w, "Error creating request", http.StatusInternalServerError)
			return
		}

		// Add authorization header
		req.Header.Set("Authorization", "Bearer "+os.Getenv("LineAccessToken"))

		// Make the request
		client := &http.Client{}
		resp, err := client.Do(req)
		if err != nil {
			http.Error(w, "Error making request", http.StatusInternalServerError)
			return
		}
		defer resp.Body.Close() // Close response body at the correct place

		// Check if request succeeded
		if resp.StatusCode != http.StatusOK {
			http.Error(w, "Failed to get LINE user data", resp.StatusCode)
			return
		} else {
			// Decode the response
			err = json.NewDecoder(resp.Body).Decode(&lineUserDetail)
			if err != nil {
				http.Error(w, "Error parsing response", http.StatusInternalServerError)
				return
			}

			// Log and append details
			fmt.Printf("LINE User Details: %+v\n", lineUserDetail)
			fmt.Println("//////////////////////")
			lineUserDetails = append(lineUserDetails, lineUserDetail)
		}

	}
	fmt.Println("LINE User Details:", lineUserDetails)
	fmt.Println(tmplineuseradmin)
	fmt.Println(userdetails)
	userDetailsJSON, _ := json.Marshal(userdetails)
	render.RenderTemplate(w, r, "addpintocode.page.tmpl", &models.TemplateData{
		User:            user,
		LineUserDetails: lineUserDetails,
		Userjson:        string(userDetailsJSON),
	})
}

func (m *Repository) UpdateOrderData(w http.ResponseWriter, r *http.Request) {
	formdata := r.Form.Get("form-data")
	option := r.URL.Query().Get("filter_option")
	if option == "" {
		option = "all"
	}
	fmt.Println(formdata)
	var updatedOrder []models.UpdateOrder

	if err := json.Unmarshal([]byte(formdata), &updatedOrder); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return
	}

	message := ""
	for _, data := range updatedOrder {
		if data.SubmittedType == "status" {
			_, _ = m.DB.UpdateOrderStatus(data.Status, data.OrderId)
			if data.Status == "paid" {
				// message = fmt.Sprintf("Order %s  \n ขอบคุณที่สั่งกับทางร้านนะครับ \n หลังจากทางร้านจัดส่งจะแจ้งเลข Shipping ให้นะครับ", data.OrderId)
				message = fmt.Sprintf("ขอบคุณสำหรับคำสั่งซื้อ\n%s \nทางร้านจะแจ้งเลขติดตามพัสดุ\ntracking no. ให้ท่านทราบในวันถัดไป", data.OrderId)
				fmt.Println(message)
				//Update chat to line
				test(data.IdUserOrder, message)
			}
		} else if data.SubmittedType == "shipping" {
			_, _ = m.DB.UpdateOrderShipping(data.ShippingId, data.OrderId)
			message = fmt.Sprintf("tracking number \n%s \nส่งสินค้าให้แล้วนะครับ  \nเช็คสถานะพัสดุได้ที่ลิ้งค์นี้\n%s ", data.ShippingId, "https://www.scgexpress.co.th/en/tracking/")
			fmt.Println(message)
			//Update chat to line
			test(data.IdUserOrder, message)
		} else {
			fmt.Println("Date change")
			// Date string in the format "17-11-2023"
			dateString := data.Datestring

			// Define the date layout that matches the format of the date string
			layout := "02-01-2006"

			// Parse the date string into a time.Time value
			date, err := time.Parse(layout, dateString)
			if err != nil {
				fmt.Fprintf(w, "Error parsing date:")
				return
			}
			_, _ = m.DB.UpdateOrderDate(date, data.OrderId)

		}

	}

	// Query the date for user
	fromDateString := updatedOrder[0].FromDate
	toDateString := updatedOrder[0].ToDate
	fromDate, _ := time.Parse("2006-01-02", fromDateString)
	toDate, _ := time.Parse("2006-01-02", toDateString)
	if fromDateString == "" || toDateString == "" {
		fromDate = time.Now().AddDate(0, 0, -1)
		toDate = time.Now()
	}
	_, orderdetail := m.DB.QueryOrderDetail()
	// Get all order
	_, orderlist := m.DB.QueryOrder(fromDate, toDate, option)
	data := make(map[string]interface{})
	data["fromDate"] = fromDateString
	data["toDate"] = toDateString
	product_productoption_map := util.Order_OrderDetail_map(orderlist, orderdetail)
	render.RenderTemplate(w, r, "order_list.page.tmpl", &models.TemplateData{
		OrderData: product_productoption_map,
		Data:      data,
	})
}

func (m *Repository) ManageProduct(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		product_datachange := r.Form.Get("form-data")
		var datachange []models.DataChange

		if err := json.Unmarshal([]byte(product_datachange), &datachange); err != nil {
			fmt.Println("Error parsing JSON:", err)
			return
		}

		for _, data := range datachange {
			if data.ChangeDB == "product" {
				fmt.Println("Query product model")
				m.DB.UpdateProduct(data)
			} else {
				fmt.Println("Query product_option model")
				m.DB.UpdateProductDetail(data)
			}
		}
		fmt.Println(product_datachange)
	}
	_, list_product := m.DB.QueryProduct("", true)
	_, list_product_option := m.DB.QueryProductOption(true)
	product_productoption_map := util.Product_product_option_map(list_product, list_product_option)

	render.RenderTemplate(w, r, "manage_product.page.tmpl", &models.TemplateData{
		ProductData: product_productoption_map,
	})
}

func (m *Repository) FilterAdmin(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()
	filterValue := r.URL.Query().Get("filter")
	fmt.Println(filterValue)
	_, list_product := m.DB.QueryProduct(filterValue, false)
	_, list_product_option := m.DB.QueryProductOption(false)
	product_productoption_map := util.Product_product_option_map(list_product, list_product_option)

	render.RenderTemplate(w, r, "manage_product.page.tmpl", &models.TemplateData{
		ProductData: product_productoption_map,
	})
}
func (m *Repository) FilterOrder(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()
	fromDateString := r.URL.Query().Get("from_date")
	toDateString := r.URL.Query().Get("to_date")
	orderid := r.URL.Query().Get("orderid")
	fromDate, _ := time.Parse("2006-01-02", fromDateString)
	toDate, _ := time.Parse("2006-01-02", toDateString)
	// toDate = toDate.AddDate(0, 0, 1)
	option := r.URL.Query().Get("filter_option")
	_, orderdetail := m.DB.QueryOrderDetail()
	// Get all order
	var orderlist []models.Order
	data := make(map[string]interface{})
	data["fromDate"] = fromDateString
	data["toDate"] = toDateString
	if orderid == "" {
		_, orderlist = m.DB.QueryOrder(fromDate, toDate, option)

	} else {
		_, orderlist = m.DB.QueryOrderById(orderid)
		data["fromDate"] = ""
		data["toDate"] = ""
	}

	data["filterOption"] = option
	data["OrderId"] = orderid
	order_orderDetail_map := util.Order_OrderDetail_map(orderlist, orderdetail)
	_, list_product := m.DB.QueryProduct("", true)
	_, list_product_option := m.DB.QueryProductOption(true)
	product_productoption_map := util.Product_product_option_map(list_product, list_product_option)
	data["haveFile"] = false
	//Check that this is the export button or not
	if r.URL.Query().Get("export_file") == "true" {
		fmt.Println("generate file")
		util.GenerateFile(order_orderDetail_map, product_productoption_map)
		data["haveFile"] = true
	}
	// if r.URL.Query().Get("export_file_backup") != "" {
	if r.URL.Query().Get("export_file_backup") == "true" {
		fmt.Println("generate file db")
		m.GenerateFileBackup()
		data["haveFile_backup"] = true
	}

	// }

	render.RenderTemplate(w, r, "order_list.page.tmpl", &models.TemplateData{
		OrderData: order_orderDetail_map,
		Data:      data,
	})
}

func (m *Repository) ServeFile(w http.ResponseWriter, r *http.Request) {
	// Specify the path to the file you want to serve
	filePath := "../../static/file/data.xlsx" // Replace with the actual file path

	// Use http.ServeFile to serve the file
	http.ServeFile(w, r, filePath)
}
func (m *Repository) BackupFile(w http.ResponseWriter, r *http.Request) {
	// Specify the path to the file you want to serve
	filePath := "../../static/file/backup.sql" // Replace with the actual file path
	// Set the response header to indicate the content type
	// Open the file
	file, err := os.Open(filePath)
	if err != nil {
		http.Error(w, "File not found", http.StatusNotFound)
		return
	}
	defer file.Close()
	w.Header().Set("Content-Type", "application/octet-stream")

	// Set the attachment header to prompt the user to download the file
	w.Header().Set("Content-Disposition", "attachment; filename="+filePath)
	// Use http.ServeFile to serve the file
	_, err = io.Copy(w, file)
	if err != nil {
		http.Error(w, "Error serving file", http.StatusInternalServerError)
		return
	}
}

func (m *Repository) AddProduct(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()

	if r.Method == http.MethodPost {
		fmt.Println("Received post request")
		// Parse the form data with a maximum file size
		r.ParseMultipartForm(10 << 20) // 10 MB maximum file size

		// Retrieve form values
		productName := r.FormValue("productName")
		productDescription := r.FormValue("productDescription")
		productType := r.FormValue("productType")

		// Retrieve the uploaded file
		file, fileHeader, err := r.FormFile("productImage")
		if err != nil {
			http.Error(w, "Error retrieving image file", http.StatusInternalServerError)
			return
		}
		defer file.Close()

		// Save the uploaded file to a local directory
		saveFile, err := os.Create("../../static/image/" + fileHeader.Filename)
		if err != nil {
			http.Error(w, "Error saving file", http.StatusInternalServerError)
			return
		}
		defer saveFile.Close()
		_, err = io.Copy(saveFile, file)
		if err != nil {
			http.Error(w, "Error copying file", http.StatusInternalServerError)
			return
		}
		vat := r.FormValue("vat")
		var product_vat bool
		if vat == "yes" {
			product_vat = true
		} else {
			product_vat = false
		}

		// Retrieve product options
		optionNames := r.PostForm["optionName[]"]
		optionPrices := r.PostForm["optionPrice[]"]
		optionWeights := r.PostForm["optionWeight[]"]
		// Insert data to DB
		new_product := models.Product{
			ProductName:        productName,
			ProductDescription: productDescription,
			ProductType:        productType,
			ImageUrl:           fileHeader.Filename,
			Active:             true,
			Vat:                product_vat,
		}
		product_id, _ := m.DB.CreateProduct(new_product)
		fmt.Fprintf(w, "Product id is %d", product_id)
		// Respond to the user

		//Handle for create product option
		for i := range optionNames {
			price_int, _ := strconv.Atoi(optionPrices[i])
			weight_int, _ := strconv.Atoi(optionWeights[i])
			weight_float := float32(weight_int)
			new_product_option := models.ProductOption{
				ProductOptionName: optionNames[i],
				Price:             price_int,
				Active:            true,
				Weight:            weight_float,
			}
			m.DB.CreateProductOption(new_product_option, product_id)
			fmt.Fprintf(w, "- Name: %s, Price: %s, Weight: %s\n", optionNames[i], optionPrices[i], optionWeights[i])
		}
	} else {
		filterValue := r.URL.Query().Get("filter")
		fmt.Println(filterValue)
		_, list_product := m.DB.QueryProduct(filterValue, false)
		_, list_product_option := m.DB.QueryProductOption(false)
		product_productoption_map := util.Product_product_option_map(list_product, list_product_option)

		render.RenderTemplate(w, r, "addproduct.page.tmpl", &models.TemplateData{
			ProductData: product_productoption_map,
		})
	}
}

func (m *Repository) GenerateFileBackup() {
	username := os.Getenv("pguser")
	database := "monbaree"
	backupFilePath := "../../static/file/backup.sql"
	pgpassword := os.Getenv("pgpassword")
	// Prepare the pg_dump command to overwrite the existing file
	cmd := exec.Command("pg_dump", "-U", username, "-h", "localhost", "-d", database, "-f", backupFilePath)

	cmd.Env = append(os.Environ(), pgpassword)
	// Run the pg_dump command, which will overwrite the existing file
	err := cmd.Run()
	if err != nil {
		fmt.Println("Error running pg_dump:", err)
		return
	}

	fmt.Printf("Database backup saved to: %s\n", backupFilePath)
}

func (m *Repository) GetUserProfile(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()
	id := chi.URLParam(r, "id")
	_, orderlist := m.DB.QueryOrderByUser(id)
	_, orderdetail := m.DB.QueryOrderDetail()
	order_orderDetail_map := util.Order_OrderDetail_map(orderlist, orderdetail)
	render.RenderTemplate(w, r, "order_list_by_user.page.tmpl", &models.TemplateData{
		OrderData: order_orderDetail_map,
	})
	//Query total order
}

func (m *Repository) Postcode_admin(w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	code := r.Form.Get("promocode")
	fmt.Println((code))
	tmpuser := models.User{
		Lineuserid:  r.FormValue("lineuserid"), // Replace or modify this if it comes from another context
		FirstName:   r.FormValue("first_name"),
		LastName:    r.FormValue("last_name"),
		HouseNo:     r.FormValue("house_no"),
		Soi:         r.FormValue("soi"),
		Road:        r.FormValue("road"),
		SubDistrict: r.FormValue("sub_district"),
		County:      r.FormValue("county"),
		Country:     r.FormValue("country"),
		PostCode:    r.FormValue("post_code"),
		Phone:       r.FormValue("phone"),
		Address: "บ้านเลขที่ " + r.FormValue("house_no") +
			"ซอย " + r.Form.Get("soi") +
			"ถนน " + r.Form.Get("road") +
			"แขวง " + r.Form.Get("sub_district") +
			"เขต " + r.Form.Get("county") +
			"จังหวัด " + r.Form.Get("country") +
			r.Form.Get("post_code"),
		JoinAt: time.Now(), // Set the current time
		Admin:  false,      // Default value; update as needed
	}
	fmt.Println(tmpuser)
	m.App.Session.Put(r.Context(), "User", tmpuser)
	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	ok, promo_code := m.DB.QueryPromoCode(code)

	if !ok {
		data := make(map[string]interface{})
		data["error"] = true
		render.RenderTemplate(w, r, "addpintocode.page.tmpl", &models.TemplateData{
			User: user,
			Data: data,
		})
		return
	}
	var monthlist map[int]interface{}
	ok, pinto_code := m.DB.QueryPinto(promo_code.Pinto)
	if ok {
		data["Pinto_Redeem"] = pinto_code.Duration
		data["Ispinto"] = true
		fmt.Printf("This code has Pinto duration for %d months", pinto_code.Duration)
		m.App.Session.Put(r.Context(), "pinto", pinto_code)
		monthlist = util.Createmonthlist(pinto_code.Duration)
		intMapJSON, _ := json.Marshal(monthlist)
		data["IntMapJSON"] = string(intMapJSON)
	}
	fmt.Println("Amount in promocode is", promo_code.Amount)

	//add the amount of cash to user
	user.AmountRemain += promo_code.Amount
	// _, user = m.DB.CheckHaveUser(user.Lineuserid)
	fmt.Println("Amount in user is update to ", user.AmountRemain)
	fmt.Println("Update balance in DB")

	_, err := m.DB.UpdateUserAmount(user.AmountRemain, user.Lineuserid)
	if err != nil {
		fmt.Println("Cannot update DB")
	}
	fmt.Println("Update balance in DB successful")

	m.App.Session.Put(r.Context(), "User", user)

	//add data to display
	fmt.Println("Add Credit_redeem to interface")
	data["Credit_Redeem"] = promo_code.Amount
	if promo_code.Amount != 0 {
		data["Iscredit"] = true
	}
	fmt.Println("Add Code success")
	ok, _ = m.DB.MarkPromoCode(code, user)
	fmt.Println(monthlist)
	if !ok {
		data := make(map[string]interface{})
		data["error"] = true
		render.RenderTemplate(w, r, "addcode.page.tmpl", &models.TemplateData{
			User: user,
			Data: data,
		})
		return
	}
	render.RenderTemplate(w, r, "addcode_success.page.tmpl", &models.TemplateData{
		User:   user,
		Data:   data,
		IntMap: monthlist,
	})
}
