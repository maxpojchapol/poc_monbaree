package handlers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/maxpojchapol/poc_monbaree/driver"
	"github.com/maxpojchapol/poc_monbaree/pkg/config"
	"github.com/maxpojchapol/poc_monbaree/pkg/forms"
	"github.com/maxpojchapol/poc_monbaree/pkg/models"
	"github.com/maxpojchapol/poc_monbaree/pkg/render"
	"github.com/maxpojchapol/poc_monbaree/pkg/repository"
	"github.com/maxpojchapol/poc_monbaree/pkg/repository/dbrepo"
	"github.com/maxpojchapol/poc_monbaree/pkg/util"
)

// Repo the repository used by the handlers
var Repo *Repository

// Repository is the repository type
type Repository struct {
	App *config.AppConfig
	DB  repository.DatabaseRepo
}

// NewRepo creates a new repository
func NewRepo(a *config.AppConfig, db *driver.DB) *Repository {
	return &Repository{
		App: a,
		DB:  dbrepo.NewPostgresRepo(db.SQL, a),
	}
}

// NewHandlers sets the repository for the handlers
func NewHandlers(r *Repository) {
	Repo = r
}

// Home is the handler for the home page
func (m *Repository) Home(w http.ResponseWriter, r *http.Request) {
	// remoteIP := r.RemoteAddr
	// m.App.Session.Put(r.Context(), "remote_ip", remoteIP)

	render.RenderTemplate(w, r, "home.page.tmpl", &models.TemplateData{})
}
func (m *Repository) Ourfarm(w http.ResponseWriter, r *http.Request) {

	render.RenderTemplate(w, r, "ourfarm.page.tmpl", &models.TemplateData{})
}
func (m *Repository) About(w http.ResponseWriter, r *http.Request) {

	render.RenderTemplate(w, r, "about.page.tmpl", &models.TemplateData{})
}
func (m *Repository) Success(w http.ResponseWriter, r *http.Request) {

	render.RenderTemplate(w, r, "success.page.tmpl", &models.TemplateData{})
}
func (m *Repository) Product(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()
	_, list_product := m.DB.QueryProduct("", false)
	_, list_product_option := m.DB.QueryProductOption(false)
	product_productoption_map := util.Product_product_option_map(list_product, list_product_option)

	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	fmt.Println(user)
	data := make(map[string]interface{})
	data["Filter"] = "All"
	render.RenderTemplate(w, r, "fruit.page.tmpl", &models.TemplateData{
		ProductData: product_productoption_map,
		User:        user,
		Data:        data,
	})
}

func (m *Repository) Register(w http.ResponseWriter, r *http.Request) {
	var emptyUser models.User
	data := make(map[string]interface{})
	data["user"] = emptyUser
	render.RenderTemplate(w, r, "register.page.tmpl", &models.TemplateData{
		Form: forms.New(nil),
		Data: data,
	})
}
func (m *Repository) AddCode(w http.ResponseWriter, r *http.Request) {
	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	render.RenderTemplate(w, r, "addcode.page.tmpl", &models.TemplateData{
		User: user,
	})
}

func (m *Repository) PostCode(w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	code := r.Form.Get("promocode")
	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	ok, promo_code := m.DB.QueryPromoCode(code)

	if !ok {
		data := make(map[string]interface{})
		data["error"] = true
		render.RenderTemplate(w, r, "addcode.page.tmpl", &models.TemplateData{
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

func (m *Repository) PostRegister(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		log.Println((err))
		return
	}
	fmt.Print("Post the register")
	// At this point for post register it should be only the User session with string
	userID, _ := m.App.Session.Get(r.Context(), "User").(string)
	user := models.User{
		Lineuserid:  userID,
		FirstName:   r.Form.Get("firstname"),
		LastName:    r.Form.Get("lastname"),
		HouseNo:     r.Form.Get("house_no"),
		Soi:         r.Form.Get("soi"),
		Road:        r.Form.Get("road"),
		SubDistrict: r.Form.Get("sub_district"),
		County:      r.Form.Get("county"),
		Country:     r.Form.Get("country"),
		PostCode:    r.Form.Get("post_code"),
		Address: "บ้านเลขที่ " + r.Form.Get("house_no") +
			"ซอย " + r.Form.Get("soi") +
			"ถนน " + r.Form.Get("road") +
			"แขวง " + r.Form.Get("sub_district") +
			"เขต " + r.Form.Get("county") +
			"จังหวัด " + r.Form.Get("country") +
			r.Form.Get("post_code"),
		Phone:        r.Form.Get("phone"),
		AmountRemain: 0,
		JoinAt:       time.Now(),
	}
	err = m.DB.RegisterUser(user)
	if err != nil {
		// helpers.ServerError(w,err)
		fmt.Println((err))
		render.RenderTemplate(w, r, "register.page.tmpl", &models.TemplateData{})
		return
	}
	// After submit the form, user should be in session with type struct user
	m.App.Session.Put(r.Context(), "User", user)
	if r.Form.Get("promocode") != "" {
		//redirect to add code func
		m.PostCode(w, r)
	} else {
		http.Redirect(w, r, "/product", http.StatusSeeOther)
	}

}

func (m *Repository) Liff(w http.ResponseWriter, r *http.Request) {
	liffid := os.Getenv("Liff_id")
	liff_endpoint := os.Getenv("Liff_endpoint")
	data := map[string]interface{}{
		"liffid":        liffid,
		"Liff_endpoint": liff_endpoint,
	}

	render.RenderTemplate(w, r, "liff.page.tmpl", &models.TemplateData{
		Data: data,
	})
}

func (m *Repository) CheckUser(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Checking user")
	if r.Method == http.MethodPost {
		// Read the request body
		// listuserid := map[string]bool{
		// 	"U5e9dbb896a6685b53a8e03997fa18802xxxx": true,
		// }
		userID, _ := util.GetUserID(r)
		m.App.Session.Put(r.Context(), "User", userID)

		ok, user := m.DB.CheckHaveUser(userID)
		if ok {
			// UserID exists, return a success response (HTTP 200)
			fmt.Println("User exists")
			m.App.Session.Put(r.Context(), "User", user)
			// try to get new session
			res, ok := m.App.Session.Get(r.Context(), "User").(models.User)
			if !ok {
				fmt.Println("error to get session")
			} else {
				fmt.Println(res.FirstName)
			}
			w.WriteHeader(http.StatusOK)

		} else {
			// UserID doesn't exist, return an error response (HTTP 404)
			fmt.Println("User not exists")
			w.WriteHeader(201)
			fmt.Print()

		}
	}
}

func (m *Repository) PostOrder(w http.ResponseWriter, r *http.Request) {

	user, ok := m.App.Session.Get(r.Context(), "User").(models.User)
	phone := r.Form.Get("order_phone")
	name := r.Form.Get("order_name")
	address := "บ้านเลขที่ " + r.Form.Get("house_no") +
		"ซอย " + r.Form.Get("soi") +
		"ถนน " + r.Form.Get("road") +
		"แขวง " + r.Form.Get("sub_district") +
		"เขต " + r.Form.Get("county") +
		"จังหวัด " + r.Form.Get("country") +
		r.Form.Get("post_code")
	date := r.Form.Get("order_date")
	var orderdate time.Time
	if date != "" {
		orderdate, _ = time.Parse("2006-01-02", date)
	} else {
		orderdate = time.Now()
	}
	if !ok {
		fmt.Println("error get session")
		return
	}

	//get cart item from session
	listcartItem := []models.CartItem{}
	cartdata, _ := m.App.Session.Get(r.Context(), "Cart-data").(string)
	if err := json.Unmarshal([]byte(cartdata), &listcartItem); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return
	}
	fmt.Println(listcartItem)

	//update user amount
	product_cost := listcartItem[len(listcartItem)-1].Total
	total_weight := listcartItem[len(listcartItem)-1].TotalWeight
	shipping_data := m.ManageShippingPrice(total_weight)
	total_spend := product_cost + shipping_data.Total_cost
	amount_data := util.ManageAmountRemain(total_spend, user.AmountRemain)
	fmt.Println(amount_data["next_money_remain"])
	money_remain, ok := amount_data["next_money_remain"].(int)
	if !ok {
		money_remain = 0
	}
	_, err := m.DB.UpdateUserAmount(money_remain, user.Lineuserid)
	if err != nil {
		fmt.Println("Cannot update user amount")
		return
	}
	// post order to our database
	// status will be paid if the credit is reach
	status := "pending"
	if amount_data["bool_addmoney"] == false {
		status = "paid"
	}

	order_id, _ := m.DB.GetOrderId()
	fmt.Println("Order date", orderdate)
	_, _ = m.DB.CreateOrder(user, order_id, name, address, phone, orderdate, total_weight, shipping_data.Total_cost, product_cost, status)
	_, _ = m.DB.CreateOrderDetail(listcartItem, order_id)

	//build message for send line noti
	m.BuildOrderMessage(order_id, listcartItem, shipping_data, amount_data, r)
	m.NotifyMessage(w, r)

	user.AmountRemain = money_remain
	m.App.Session.Put(r.Context(), "User", user)
	render.RenderTemplate(w, r, "success.page.tmpl", &models.TemplateData{})
}

func (m *Repository) Summary(w http.ResponseWriter, r *http.Request) {

	//Get json cart data from form
	cart_data := r.Form.Get("cart-data")
	fmt.Println(cart_data)
	var cartItems []models.CartItem

	if err := json.Unmarshal([]byte(cart_data), &cartItems); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return
	}
	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	m.App.Session.Put(r.Context(), "Cart-data", cart_data)
	//Get the total of product price

	total := cartItems[len(cartItems)-1].Total
	total_weight := cartItems[len(cartItems)-1].TotalWeight
	data := make(map[string]interface{})
	data["procuct_total_price"] = total

	//Calculate the shipping price
	shipping_data := m.ManageShippingPrice(total_weight)
	data["total_price"] = total + shipping_data.Total_cost

	messageAmount := util.ManageAmountRemain(total+shipping_data.Total_cost, user.AmountRemain)
	messageamount_json, _ := json.Marshal(messageAmount)
	m.App.Session.Put(r.Context(), "amount-remain", messageamount_json)
	render.RenderTemplate(w, r, "summary.page.tmpl", &models.TemplateData{
		CartItems:     cartItems,
		User:          user,
		Data:          data,
		ShippingData:  shipping_data,
		MessageAmount: messageAmount,
	})
}

func (m *Repository) RequireLogin(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		_, ok := m.App.Session.Get(r.Context(), "User").(models.User)
		if !ok {
			fmt.Println("didn't have session yet")
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return
		}
		next.ServeHTTP(w, r)
	})
}
func (m *Repository) RequireAdmin(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		user, ok := m.App.Session.Get(r.Context(), "User").(models.User)
		if !ok {
			fmt.Println("didn't have session yet")
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return
		}
		if !user.Admin {
			fmt.Println("didn't have admin right")
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func (m *Repository) Filter(w http.ResponseWriter, r *http.Request) {
	// _, _ = m.DB.QueryProduct()
	filterValue := r.URL.Query().Get("filter")
	fmt.Println(filterValue)
	_, list_product := m.DB.QueryProduct(filterValue, false)
	_, list_product_option := m.DB.QueryProductOption(false)
	product_productoption_map := util.Product_product_option_map(list_product, list_product_option)

	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	data := make(map[string]interface{})
	data["Filter"] = filterValue
	render.RenderTemplate(w, r, "fruit.page.tmpl", &models.TemplateData{
		ProductData: product_productoption_map,
		User:        user,
		Data:        data,
	})
}

func (m *Repository) ManageShippingPrice(total_weight int) models.ShippingCost {
	box_list, _ := m.DB.QueryShippingBox()
	total_ship_cost := 0
	description := []string{}
	lastboxprice := box_list[0].BoxPrice
	lastboxcap := box_list[0].MaxCapacity
	lastboxquan := 0
	lastboxoptionname := box_list[0].OptionName
	for _, box := range box_list {
		fmt.Println(total_weight)
		box_quan := int((total_weight / 1000) / box.MaxCapacity)
		fmt.Println(box.MaxCapacity)
		if lastboxcap > (total_weight/1000) && box.MaxCapacity < (total_weight/1000) {
			if len(description) != 0 {
				description[len(description)-1] = fmt.Sprintf("%s จำนวน %d กล่อง", lastboxoptionname, lastboxquan+1)
			} else {
				description = append(description, fmt.Sprintf("%s จำนวน %d กล่อง", lastboxoptionname, lastboxquan+1))
			}

			total_weight -= lastboxcap * 1000
			total_ship_cost += lastboxprice

		} else if box_quan > 0 {
			cost := int(box_quan) * box.BoxPrice
			total_ship_cost += cost
			total_weight -= box.MaxCapacity * 1000 * box_quan
			description = append(description, fmt.Sprintf("%s จำนวน %d กล่อง", box.OptionName, int(box_quan)))
			lastboxprice = box.BoxPrice
			lastboxcap = box.MaxCapacity
			lastboxquan = box_quan
			lastboxoptionname = box.OptionName
		}

	}
	if total_weight > 0 {
		total_ship_cost += box_list[len(box_list)-1].BoxPrice
		description = append(description, fmt.Sprintf("%s จำนวน %d กล่อง", box_list[len(box_list)-1].OptionName, 1))
	}

	// shipping_data:= models.ShippingCost{}
	shipping_data := models.ShippingCost{
		Total_cost:  total_ship_cost,
		Description: description,
	}

	return shipping_data
}

func (m *Repository) SetGiftDate(w http.ResponseWriter, r *http.Request) {
	//get data from form of day start and end
	date_data := r.Form.Get("date-data")
	fmt.Println(date_data)
	type Pinto_day struct {
		Daystart string `json:"daystart"`
		Dayend   string `json:"dayend"`
	}
	pinto_day_list := []Pinto_day{}
	if err := json.Unmarshal([]byte(date_data), &pinto_day_list); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return
	}

	pinto, _ := m.App.Session.Get(r.Context(), "pinto").(models.Pinto)

	user, _ := m.App.Session.Get(r.Context(), "User").(models.User)
	//set pinto code that is already use

	var nextDates []time.Time

	for i := 1; i <= pinto.Duration; i++ {
		day_start_int, _ := strconv.Atoi(pinto_day_list[i-1].Daystart)
		day_end_int, _ := strconv.Atoi(pinto_day_list[i-1].Dayend)
		nextDate := time.Now()
		nextDate = nextDate.AddDate(0, i, 0)

		nextDate = time.Date(nextDate.Year(), nextDate.Month(), day_start_int, 0, 0, 0, 0, nextDate.Location())
		nextDates = append(nextDates, nextDate)

		nextDate = time.Date(nextDate.Year(), nextDate.Month(), day_end_int, 0, 0, 0, 0, nextDate.Location())
		nextDates = append(nextDates, nextDate)
	}

	ok, _ := m.DB.UpdatePintoUsed(pinto, user)
	if !ok {
		fmt.Println("Cannot update pinto as used")
	}

	//set order pinto
	for _, date := range nextDates {
		order_id, _ := m.DB.GetOrderId()
		_, _ = m.DB.CreateOrder(user, order_id, user.FirstName, user.Address, user.Phone, date, 0, 0, 0, "paid")
		_, _ = m.DB.CreateOrderDetailPinto(order_id)
	}
	message := fmt.Sprint("ระบบจะจัดส่งปิ่นโตให้คุณตามเวลาที่คุณกำหนด")
	test(user.Lineuserid, message)
	fmt.Println("Redirect to product")
	http.Redirect(w, r, "/product", http.StatusSeeOther)
}
