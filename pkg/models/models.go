package models

import (
	"time"
)

type User struct {
	Lineuserid   string
	FirstName    string
	LastName     string
	Address      string
	HouseNo      string
	Soi          string
	Road         string
	SubDistrict  string
	County       string
	Country      string
	PostCode     string
	Phone        string
	AmountRemain int
	JoinAt       time.Time
	Admin        bool
}

type User_Credit struct {
	User         User
	CreditRedeem int
	PintoRedeem  int
	CreditUse    int
	TotalSpend   int
}

type PromoCode struct {
	Code       string
	UserCreate User
	UserUse    User
	Amount     int
	Pinto      string
}

type Pinto struct {
	Id        string
	DateStart *time.Time
	DateEnd   *time.Time
	Duration  int
	UserID    string
}

type Order struct {
	OrderId      string
	Status       string
	TotalPrice   int
	Address      string
	Phone        string
	Name         string
	UserOrder    User
	UserOrderId  string
	UserAccept   User
	ShippingId   string
	ShippingCost int
	ProductCost  int
	Weight       float32
	CreatedAt    *time.Time
	UpdatedAt    *time.Time
	Date         *time.Time
	DateString   string
}

type OrderDetail struct {
	Id                 int
	ProductName        string
	ProductDescription string
	OrderId            string
	ProductOptionId    string
	ProductOption      ProductOption
	OptionPrice        int
	Quantity           int
}

type Order_OrderDetail_map struct {
	Order       Order
	OrderDetail []OrderDetail
}

type Product struct {
	Id                 int
	ProductName        string
	ProductType        string
	ProductDescription string
	ImageUrl           string
	Active             bool
	Vat                bool
}

type ProductOption struct {
	Id                int
	ProductId         string
	ProductOptionName string
	Price             int
	Weight            float32
	Product           Product
	Active            bool
}

type Product_Product_option_map struct {
	Product Product
	Option  []ProductOption
}

type CartItem struct {
	ID          string `json:"id"`
	OptionID    string `json:"optionId"`
	Name        string `json:"name"`
	Description string `json:"product_description"`
	Quantity    int    `json:"quantity"`
	TotalPrice  int    `json:"total_price"`
	Total       int    `json:"total"`
	TotalWeight int    `json:"total_weight"`
}

type UpdateOrder struct {
	OrderId       string `json:"orderId"`
	SubmittedType string `json:"submittedType"`
	Status        string `json:"status"`
	ShippingId    string `json:"shippingId"`
	IdUserOrder   string `json:"IdUserOrder"`
	Datestring    string `json:"datestring"`
	FromDate      string `json:"FromDate"`
	ToDate        string `json:"ToDate"`
}

type ShippingBox struct {
	Id          int
	MaxCapacity int
	OptionName  string
	BoxPrice    int
}

type ShippingCost struct {
	Total_cost  int
	Description []string
}

type DataChange struct {
	Id          string
	ChangeDB    string `json:"change_db"`
	ChangeType  string `json:"change_type"`
	ChangeFeild string `json:"change_field"`
	ChangeData  string `json:"change_data"`
}
