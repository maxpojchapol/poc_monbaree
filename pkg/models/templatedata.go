package models

import (
	"github.com/maxpojchapol/poc_monbaree/pkg/forms"
)

// TemplateData holds data sent from handlers to templates
type TemplateData struct {
	StringMap     map[string]string
	IntMap        map[int]interface{}
	FloatMap      map[string]float32
	Data          map[string]interface{}
	CSRFToken     string
	Flash         string
	Warning       string
	Error         string
	Form          *forms.Form
	ProductData   []Product_Product_option_map
	OrderData     []Order_OrderDetail_map
	User          User
	CartItems     []CartItem
	ShippingData  ShippingCost
	MessageAmount map[string]interface{}
}
