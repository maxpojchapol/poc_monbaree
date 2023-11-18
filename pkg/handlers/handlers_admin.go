package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"strconv"
	"time"

	"bookings-udemy/pkg/models"
	"bookings-udemy/pkg/render"
	"bookings-udemy/pkg/util"
)

func (m *Repository) GetOrderTable(w http.ResponseWriter, r *http.Request) {
	_, orderdetail := m.DB.QueryOrderDetail()
	// Get all order
	fromDate := time.Now().AddDate(0, 0, -1)
	toDate := time.Now()
	_, orderlist := m.DB.QueryOrder(fromDate, toDate)
	product_productoption_map := util.Order_OrderDetail_map(orderlist, orderdetail)

	render.RenderTemplate(w, r, "order_list.page.tmpl", &models.TemplateData{
		OrderData: product_productoption_map,
	})
}
func (m *Repository) Admin(w http.ResponseWriter, r *http.Request) {

	render.RenderTemplate(w, r, "admin.page.tmpl", &models.TemplateData{})
}

func (m *Repository) UpdateOrderData(w http.ResponseWriter, r *http.Request) {
	formdata := r.Form.Get("form-data")

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
				message = fmt.Sprintf("Order %s  \n ขอบคุณที่สั่งกับทางร้านนะครับ \n หลังจากทางร้านจัดส่งจะแจ้งเลข Shipping ให้นะครับ", data.OrderId)
				fmt.Println(message)
				//Update chat to line
				test(data.IdUserOrder, message)
			}
		} else if data.SubmittedType == "shipping" {
			_, _ = m.DB.UpdateOrderShipping(data.ShippingId, data.OrderId)
			message = fmt.Sprintf("%s \nส่งสินค้าให้แล้วนะครับ  \nเช็คสถานะพัสดุได้ที่ลิ้งค์นี้\n%s ", data.ShippingId, "https://www.scgexpress.co.th/en/tracking/")
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
	http.Redirect(w, r, "/getorder", http.StatusSeeOther)
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
	fromDate, _ := time.Parse("2006-01-02", fromDateString)
	toDate, _ := time.Parse("2006-01-02", toDateString)
	toDate = toDate.AddDate(0, 0, 1)
	_, orderdetail := m.DB.QueryOrderDetail()
	// Get all order
	_, orderlist := m.DB.QueryOrder(fromDate, toDate)
	data := make(map[string]interface{})
	data["fromDate"] = fromDateString
	data["toDate"] = toDateString
	product_productoption_map := util.Order_OrderDetail_map(orderlist, orderdetail)
	data["haveFile"] = false
	//Check that this is the export button or not
	if r.URL.Query().Get("export_file") != "" {
		fmt.Println("test")
		util.GenerateFile(product_productoption_map)
		data["haveFile"] = true
	}

	render.RenderTemplate(w, r, "order_list.page.tmpl", &models.TemplateData{
		OrderData: product_productoption_map,
		Data:      data,
	})
}

func (m *Repository) ServeFile(w http.ResponseWriter, r *http.Request) {
	// Specify the path to the file you want to serve
	filePath := "../../static/file/data.xlsx" // Replace with the actual file path

	// Use http.ServeFile to serve the file
	http.ServeFile(w, r, filePath)
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
