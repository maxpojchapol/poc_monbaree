package repository

import (
	"time"

	"github.com/maxpojchapol/poc_monbaree/pkg/models"
)

type DatabaseRepo interface {
	AllUser() bool
	RegisterUser(models.User) error
	CheckHaveUser(string) (bool, models.User)
	QueryProduct(string, bool) (bool, []models.Product)
	QueryProductOption(bool) (bool, []models.ProductOption)
	QueryPromoCode(string) (bool, models.PromoCode)
	QueryPinto(string) (bool, models.Pinto)
	UpdateUserAmount(int, string) (bool, error)
	GetOrderId() (string, error)
	CreateOrder(models.User, string, string, string, string, time.Time, int, int, int, string) (bool, error)
	CreateOrderDetail([]models.CartItem, string) (bool, error)
	QueryOrder(time.Time, time.Time, string) (bool, []models.Order)
	QueryOrderDetail() (bool, []models.OrderDetail)
	QueryUserDetail() (bool, []models.User)
	UpdateOrderStatus(string, string) (bool, error)
	UpdateOrderShipping(string, string) (bool, error)
	UpdateOrderDate(time.Time, string) (bool, error)
	QueryShippingBox() ([]models.ShippingBox, error)
	UpdateProduct(models.DataChange)
	UpdateProductDetail(models.DataChange)
	UpdatePintoUsed(models.Pinto, models.User) (bool, error)
	CreateOrderDetailPinto(string, string, string) (bool, error)
	CreateProduct(models.Product) (int, error)
	CreateProductOption(models.ProductOption, int) (bool, error)
	MarkPromoCode(string, models.User) (bool, error)
	QueryOrderById(string) (bool, []models.Order)
	QueryDiscount() (bool, []models.Product)
	QueryTotalRedeem(string) (int, int)
	QueryTotalSpend(string) int
	QueryOrderByUser(string) (bool, []models.Order)
}
