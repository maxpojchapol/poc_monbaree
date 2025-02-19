package util

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/maxpojchapol/poc_monbaree/pkg/models"
	"github.com/xuri/excelize/v2"
)

type summaryProduct struct {
	Name     string
	Quantity int
}

func GetUserID(r *http.Request) (string, error) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return "", err
	}
	type RequestData struct {
		UserID string `json:"UserID"`
	}

	// Unmarshal the JSON data into a struct
	var requestData RequestData
	if err := json.Unmarshal(body, &requestData); err != nil {
		return "", err

	}
	userID := requestData.UserID
	fmt.Printf("Received POST request with UserID : %s\n", userID)
	return userID, nil
}

func ManageAmountRemain(deduct_amount int, remaining_amount int) map[string]interface{} {
	output := make(map[string]interface{})

	if remaining_amount == 0 {
		output["pay_with_credit"] = false
		output["button_message"] = "ยืนยันออเดอร์"
		output["deduct_amount"] = 0
		output["bool_addmoney"] = true
	} else if deduct_amount <= remaining_amount {
		output["pay_with_credit"] = true
		output["button_message"] = "ยืนยันออเดอร์(จ่ายด้วยเครติตของฉัน)"
		output["deduct_amount"] = deduct_amount
		output["current_money_remain"] = remaining_amount
		output["next_money_remain"] = remaining_amount - deduct_amount
		output["bool_addmoney"] = false
	} else {
		output["pay_with_credit"] = true
		output["button_message"] = "ยืนยันออเดอร์"
		output["deduct_amount"] = deduct_amount
		output["current_money_remain"] = remaining_amount
		output["next_money_remain"] = 0
		output["message_addmoney"] = "ต้องชำระเงินเพิ่ม"
		output["bool_addmoney"] = true
		output["amount_addmoney"] = deduct_amount - remaining_amount
	}

	return output
}

func GenerateFile(order_orderdetail_map []models.Order_OrderDetail_map, product_productoption_map_list []models.Product_Product_option_map) {
	// Create a new Excel file
	os.Remove("../../static/file/data.xlsx")
	f := excelize.NewFile()
	// listsumproduct := []summaryProduct{}

	// Iterate over the rowData and set values in each cell of the rows
	fmt.Println(order_orderdetail_map)
	lastrow := 0
	setHeader(f)
	countproduct := make(map[string]int)
	for _, order := range order_orderdetail_map {
		for _, detail := range order.OrderDetail {
			f.SetCellValue("Sheet1", "A"+fmt.Sprint(lastrow+2), order.Order.DateString)
			f.SetCellValue("Sheet1", "B"+fmt.Sprint(lastrow+2), order.Order.OrderId)
			f.SetCellValue("Sheet1", "C"+fmt.Sprint(lastrow+2), order.Order.Name)
			f.SetCellValue("Sheet1", "D"+fmt.Sprint(lastrow+2), order.Order.Address)
			f.SetCellValue("Sheet1", "E"+fmt.Sprint(lastrow+2), order.Order.Phone)
			f.SetCellValue("Sheet1", "F"+fmt.Sprint(lastrow+2), detail.OptionPrice)
			f.SetCellValue("Sheet1", "G"+fmt.Sprint(lastrow+2), order.Order.ShippingCost)
			f.SetCellValue("Sheet1", "H"+fmt.Sprint(lastrow+2), order.Order.TotalPrice)
			f.SetCellValue("Sheet1", "I"+fmt.Sprint(lastrow+2), detail.ProductOption.ProductId)
			f.SetCellValue("Sheet1", "J"+fmt.Sprint(lastrow+2), detail.ProductName)
			f.SetCellValue("Sheet1", "K"+fmt.Sprint(lastrow+2), detail.ProductDescription)
			f.SetCellValue("Sheet1", "L"+fmt.Sprint(lastrow+2), detail.ProductOption.ProductOptionName)
			f.SetCellValue("Sheet1", "M"+fmt.Sprint(lastrow+2), detail.Quantity)
			f.SetCellValue("Sheet1", "N"+fmt.Sprint(lastrow+2), detail.OptionPrice)
			f.SetCellValue("Sheet1", "O"+fmt.Sprint(lastrow+2), order.Order.Status)
			f.SetCellValue("Sheet1", "P"+fmt.Sprint(lastrow+2), order.Order.ShippingId)

			lastrow += 1
			if order.Order.Status == "shipped" {
				countproduct[detail.ProductName] += detail.Quantity
			}

		}

	}

	//Add summary sheet for checking each item
	lastrow = 0
	f.NewSheet("Summary")
	f.SetCellValue("Summary", "A1", "Product ID")
	f.SetCellValue("Summary", "B1", "Product Name")
	f.SetCellValue("Summary", "C1", "Product Description")
	f.SetCellValue("Summary", "D1", "Product Option ID")
	f.SetCellValue("Summary", "E1", "Option Name")
	f.SetCellValue("Summary", "F1", "Amount")
	for _, productoptionmap := range product_productoption_map_list {
		for _, option := range productoptionmap.Option {
			f.SetCellValue("Summary", "A"+fmt.Sprint(lastrow+2), productoptionmap.Product.Id)
			f.SetCellValue("Summary", "B"+fmt.Sprint(lastrow+2), productoptionmap.Product.ProductName+"("+option.ProductOptionName+")")
			f.SetCellValue("Summary", "C"+fmt.Sprint(lastrow+2), productoptionmap.Product.ProductDescription)
			f.SetCellValue("Summary", "D"+fmt.Sprint(lastrow+2), option.Id)
			f.SetCellValue("Summary", "E"+fmt.Sprint(lastrow+2), option.ProductOptionName)

			if !strings.Contains(productoptionmap.Product.ProductName, "ส่วนลด") {
				f.SetCellValue("Summary", "F"+fmt.Sprint(lastrow+2), countproduct[productoptionmap.Product.ProductName+"("+option.ProductOptionName+")"])
			} else {
				f.SetCellValue("Summary", "F"+fmt.Sprint(lastrow+2), countproduct[productoptionmap.Product.ProductName])
			}

			// sumproduct := summaryProduct{
			// 	Name:     productoptionmap.Product.ProductName + "(" + option.ProductOptionName + ")",
			// 	Quantity: 0,
			// }
			// listsumproduct = append(listsumproduct, sumproduct)
			lastrow += 1
		}
	}
	// fmt.Println(countproduct)
	// Save the Excel file with a name
	err := f.SaveAs("../../static/file/data.xlsx")
	if err != nil {
		fmt.Println("Error saving Excel file:", err)
		return
	}

	fmt.Println("Excel file created with row data successfully!")

}

func setHeader(f *excelize.File) {
	f.SetCellValue("Sheet1", "A"+fmt.Sprint(1), "OrderDate")
	f.SetCellValue("Sheet1", "B"+fmt.Sprint(1), "OrderId")
	f.SetCellValue("Sheet1", "C"+fmt.Sprint(1), "Name")
	f.SetCellValue("Sheet1", "D"+fmt.Sprint(1), "Address")
	f.SetCellValue("Sheet1", "E"+fmt.Sprint(1), "Phone")
	f.SetCellValue("Sheet1", "F"+fmt.Sprint(1), "Product Cost")
	f.SetCellValue("Sheet1", "G"+fmt.Sprint(1), "Shipping Cost")
	f.SetCellValue("Sheet1", "H"+fmt.Sprint(1), "Total Price")
	f.SetCellValue("Sheet1", "I"+fmt.Sprint(1), "ProductId")
	f.SetCellValue("Sheet1", "J"+fmt.Sprint(1), "ProductName")
	f.SetCellValue("Sheet1", "K"+fmt.Sprint(1), "ProductDescription")
	f.SetCellValue("Sheet1", "L"+fmt.Sprint(1), "OptionName")
	f.SetCellValue("Sheet1", "M"+fmt.Sprint(1), "Quantity")
	f.SetCellValue("Sheet1", "N"+fmt.Sprint(1), "OptionPrice")
	f.SetCellValue("Sheet1", "O"+fmt.Sprint(1), "Status")
	f.SetCellValue("Sheet1", "P"+fmt.Sprint(1), "ShippingId")
}

func Createmonthlist(totalmonth int) map[int]interface{} {

	monthMap := map[int]string{
		1:  "มกราคม",
		2:  "กุมภาพันธ์",
		3:  "มีนาคม",
		4:  "เมษายน",
		5:  "พฤษภาคม",
		6:  "มิถุนายน",
		7:  "กรกฎาคม",
		8:  "สิงหาคม",
		9:  "กันยายน",
		10: "ตุลาคม",
		11: "พฤศจิกายน",
		12: "ธันวาคม",
		0:  "ธันวาคม",
	}
	monthSet := make(map[int]interface{})
	thisMonth := int(time.Now().Month())
	for i := 1; i <= totalmonth; i++ {
		nextMonth := int(math.Mod(float64(thisMonth+i), 12))
		nextMonth_text := monthMap[nextMonth]
		monthSet[nextMonth] = nextMonth_text
	}
	return monthSet
}

func CalculateTotalSpend(lineuserid string) int {
	fmt.Println("Calculate total spend")
	return 0
}
