package util

import (
	"strconv"

	"bookings-udemy/pkg/models"
)

func Product_product_option_map(products []models.Product, productOption []models.ProductOption) []models.Product_Product_option_map {
	productOptionsMap := make(map[string][]models.ProductOption)

	for _, option := range productOption {
		productOptionsMap[option.ProductId] = append(productOptionsMap[option.ProductId], option)
	}

	// Create a list of Product_Product_option_map using the map
	var productOptionMaps []models.Product_Product_option_map

	for _, product := range products {
		options := productOptionsMap[strconv.Itoa(product.Id)]
		productOptionMap := models.Product_Product_option_map{
			Product: product,
			Option:  options,
		}
		productOptionMaps = append(productOptionMaps, productOptionMap)
	}
	// Print the list of Product_Product_option_map

	return productOptionMaps
}

func Order_OrderDetail_map(orders []models.Order, order_detail []models.OrderDetail) []models.Order_OrderDetail_map {
	orderDetailMap := make(map[string][]models.OrderDetail)

	for _, detail := range order_detail {
		orderDetailMap[detail.OrderId] = append(orderDetailMap[detail.OrderId], detail)
	}

	// Create a list of Product_Product_option_map using the map
	var order_orderDetail_Maps []models.Order_OrderDetail_map

	for _, order := range orders {
		details := orderDetailMap[order.OrderId]
		orderDetailMap := models.Order_OrderDetail_map{
			Order:       order,
			OrderDetail: details,
		}
		order_orderDetail_Maps = append(order_orderDetail_Maps, orderDetailMap)
	}
	// Print the list of Product_Product_option_map

	return order_orderDetail_Maps
}
