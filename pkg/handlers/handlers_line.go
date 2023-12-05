package handlers

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/maxpojchapol/poc_monbaree/pkg/models"
)

const LINEAPI = "https://api.line.me/v2/bot/message/push"

func (m *Repository) NotifyMessage(w http.ResponseWriter, r *http.Request) {
	var LineAccessToken = os.Getenv("LineAccessToken")
	user := m.App.Session.Get(r.Context(), "User").(models.User)
	message := m.App.Session.Get(r.Context(), "Message").(string)
	Authorization := fmt.Sprintf("Bearer %s", LineAccessToken)
	fmt.Println(user)

	headers := map[string]string{
		"Content-Type":  "application/json; charset=UTF-8",
		"Authorization": Authorization,
	}

	data := map[string]interface{}{
		"to": user.Lineuserid,
		"messages": []map[string]string{
			{"type": "text", "text": message},
		},
	}

	jsonData, err := json.Marshal(data)
	if err != nil {
		// return 0, err
	}

	resp, err := makePOSTRequest(LINEAPI, headers, jsonData)
	if err != nil {
		// return 0, err
	}
	fmt.Println(resp)
	// return resp.StatusCode, nil
}

func makePOSTRequest(url string, headers map[string]string, data []byte) (*http.Response, error) {
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(data))
	if err != nil {
		return nil, err
	}

	for key, value := range headers {
		req.Header.Set(key, value)
	}

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}

	return resp, nil
}

func test(user string, message string) {
	var LineAccessToken = os.Getenv("LineAccessToken")
	Authorization := fmt.Sprintf("Bearer %s", LineAccessToken)

	headers := map[string]string{
		"Content-Type":  "application/json; charset=UTF-8",
		"Authorization": Authorization,
	}

	data := map[string]interface{}{
		"to": user,
		"messages": []map[string]string{
			{"type": "text", "text": message},
		},
	}

	jsonData, err := json.Marshal(data)
	if err != nil {
		// return 0, err
	}

	resp, err := makePOSTRequest(LINEAPI, headers, jsonData)
	if err != nil {
		// return 0, err
	}
	fmt.Println(resp)
	// return resp.StatusCode, nil
}
func sendQR(user string) {

	var LineAccessToken = os.Getenv("LineAccessToken")
	Authorization := fmt.Sprintf("Bearer %s", LineAccessToken)

	headers := map[string]string{
		"Content-Type":  "application/json; charset=UTF-8",
		"Authorization": Authorization,
	}

	data := map[string]interface{}{
		"to": user,
		"messages": []map[string]string{
			{
				"type":               "image",
				"originalContentUrl": "https://monbarree.com/static/image/QR.jpg",
				"previewImageUrl":    "https://monbarree.com/static/image/QR.jpg",
			},
		},
	}

	jsonData, err := json.Marshal(data)
	if err != nil {
		// return 0, err
		fmt.Println("error send message", err)
	}

	resp, err := makePOSTRequest(LINEAPI, headers, jsonData)
	if err != nil {
		fmt.Println("error send message", err)
		// return 0, err
	}
	fmt.Println(resp)
	// return resp.StatusCode, nil
}

func (m *Repository) BuildOrderMessage(order_id string, listcartItem []models.CartItem, shipping_data models.ShippingCost, amount_data map[string]interface{}, r *http.Request) bool {
	message := fmt.Sprintf("Order %s  \nสินค้าที่สั่ง \n", order_id)
	// user := m.App.Session.Get(r.Context(), "User").(models.User)
	qr := false
	for _, item := range listcartItem {
		itemMessage := fmt.Sprintf("%s จำนวน %d = %d บาท",
			item.Name, item.Quantity, item.TotalPrice)

		message += itemMessage + "\n"
	}
	message += fmt.Sprintf("ค่าจัดส่งทั้งหมด %d บาท", shipping_data.Total_cost)
	message += fmt.Sprintf("\n\nรวมทั้งสินเป็นเงิน %d", listcartItem[len(listcartItem)-1].Total+shipping_data.Total_cost)
	if amount_data["pay_with_credit"] == false {
		fmt.Println("This is no credit user")
		message += " \n\nรบกวนชำระเงินที่ตาม QR Code ด้านล่างครับ"
		qr = true
		// sendQR(user.Lineuserid)
	} else {
		if amount_data["bool_addmoney"] == true {
			message += fmt.Sprintf("\n\n ยอดเงินในเครดิตปัจจุบัน %d บาท", amount_data["current_money_remain"])
			message += fmt.Sprintf("\n\n ยอดเงินที่ต้องชำระเพิ่ม %d บาท", amount_data["amount_addmoney"])
			message += " \n\nรบกวนชำระเงินตาม QR Code ด้านล่างครับ"
			qr = true
			// sendQR(user.Lineuserid)
		} else {
			message += fmt.Sprintf("\n\n ยอดเงินในเครดิตปัจจุบัน %d บาท", amount_data["current_money_remain"])
			message += fmt.Sprintf("\n\n ยอดเงินในเครดิตคงเหลือ %d บาท", amount_data["next_money_remain"])
			message += "\n\n ระบบได้ตัดเงินจากเครดิตของท่านเรียบร้อยแล้ว \nหลังจัดส่งทางร้านจะแจ้งเลขพัสดุให้ครับ ขอบคุณครับ"
		}
	}

	m.App.Session.Put(r.Context(), "Message", message)
	return qr
}
