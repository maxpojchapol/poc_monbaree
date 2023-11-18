package util

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math"
	"net/http"
	"os"
	"time"

	"github.com/maxpojchapol/poc_monbaree/pkg/models"

	"github.com/xuri/excelize/v2"
)

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
	fmt.Println(output)

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

func GenerateFile(order_orderdetail_map []models.Order_OrderDetail_map) {
	// Create a new Excel file
	os.Remove("../../static/file/data.xlsx")
	f := excelize.NewFile()

	// Iterate over the rowData and set values in each cell of the rows
	fmt.Println(order_orderdetail_map)
	lastrow := 0
	setHeader(f)
	for _, order := range order_orderdetail_map {
		for _, detail := range order.OrderDetail {
			f.SetCellValue("Sheet1", "A"+fmt.Sprint(lastrow+2), order.Order.DateString)
			f.SetCellValue("Sheet1", "B"+fmt.Sprint(lastrow+2), order.Order.OrderId)
			f.SetCellValue("Sheet1", "C"+fmt.Sprint(lastrow+2), order.Order.Name)
			f.SetCellValue("Sheet1", "D"+fmt.Sprint(lastrow+2), order.Order.Address)
			f.SetCellValue("Sheet1", "E"+fmt.Sprint(lastrow+2), order.Order.Phone)
			f.SetCellValue("Sheet1", "F"+fmt.Sprint(lastrow+2), order.Order.ProductCost)
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
		}
		// 	if err != nil {
		// 		fmt.Println("Error setting cell value:", err)
		// 		return
		// 	}
		// }
	}

	// Save the Excel file with a name (e.g., "example.xlsx")
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
