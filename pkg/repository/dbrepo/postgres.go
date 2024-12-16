package dbrepo

import (
	"context"
	"database/sql"
	"fmt"
	"strconv"
	"time"

	"github.com/maxpojchapol/poc_monbaree/pkg/models"
)

func (m *postgresDBRepo) AllUser() bool {
	return true
}

func (m *postgresDBRepo) RegisterUser(res models.User) error {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	stmt := `insert into users (lineuserid, first_name, last_name, phone,house_no,county,post_code,country,soi,road,sub_district, amount_remain, joined_at, created_at, updated_at,address)
			values($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16)`
	_, err := m.DB.ExecContext(ctx, stmt,
		res.Lineuserid,
		res.FirstName,
		res.LastName,
		res.Phone,
		res.HouseNo,
		res.County,
		res.PostCode,
		res.Country,
		res.Soi,
		res.Road,
		res.SubDistrict,
		res.AmountRemain,
		res.JoinAt,
		time.Now(),
		time.Now(),
		res.HouseNo+res.Soi+res.Road+res.County+res.SubDistrict+res.Country+res.PostCode,
	)

	if err != nil {
		return err
	}
	return nil
}

func (m *postgresDBRepo) CheckHaveUser(UserID string) (bool, models.User) {
	// rows, _ := m.DB.Query("SELECT * FROM users WHERE lineuserid = $1", UserID)
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	rows, _ := m.DB.QueryContext(ctx, "SELECT lineuserid, first_name, last_name, address,house_no,soi,road,county,sub_district,country,post_code, phone, amount_remain,admin FROM users WHERE lineuserid = $1", UserID)

	defer rows.Close()
	user_model := models.User{}
	if rows.Next() {
		err := rows.Scan(
			&user_model.Lineuserid,
			&user_model.FirstName,
			&user_model.LastName,
			&user_model.Address,
			&user_model.HouseNo,
			&user_model.Soi,
			&user_model.Road,
			&user_model.County,
			&user_model.SubDistrict,
			&user_model.Country,
			&user_model.PostCode,
			&user_model.Phone,
			&user_model.AmountRemain,
			&user_model.Admin)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println("User is exist")
		// Set the session to this user

		return true, user_model
	}
	fmt.Println("User is not exist")
	return false, models.User{}
}

func (m *postgresDBRepo) QueryProduct(filterType string, query_by_user bool) (bool, []models.Product) {
	var rows *sql.Rows
	var err error
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	if filterType == "" || filterType == "All" {
		if query_by_user {
			rows, err = m.DB.QueryContext(ctx, `SELECT id, product_name, product_type,product_description, image_url,active
			FROM product
			ORDER BY id ASC;
			`)
		} else {
			rows, err = m.DB.QueryContext(ctx, `SELECT id, product_name, product_type,product_description, image_url,active
		FROM product
		WHERE active=true
		ORDER BY id ASC;
		`)
		}
	} else {
		if query_by_user {
			rows, err = m.DB.Query(`SELECT id, product_name, product_type,product_description, image_url,active
			FROM product
			WHERE product_type=$1 
			ORDER BY id ASC;
			`)
		} else {
			rows, err = m.DB.Query(`SELECT id, product_name, product_type,product_description, image_url,active  
		FROM product
		WHERE product_type=$1 AND active = true
		ORDER BY id ASC;
		`, filterType)
		}
	}
	defer rows.Close()
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}
	defer rows.Close()

	listProductModel := []models.Product{}
	for rows.Next() {
		productModel := models.Product{}
		// fmt.Println(rows)
		err := rows.Scan(
			&productModel.Id,
			&productModel.ProductName,
			&productModel.ProductType,
			&productModel.ProductDescription,
			&productModel.ImageUrl,
			&productModel.Active)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}

		listProductModel = append(listProductModel, productModel)

	}
	// fmt.Println(listProductModel)
	return true, listProductModel
}
func (m *postgresDBRepo) QueryProductOption(query_by_user bool) (bool, []models.ProductOption) {
	var query string
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	if query_by_user {
		query = `
		SELECT
			po.id,
			po.product_id,
			po.product_option_name,
			po.price,
			po.weight,
			po.active,
			p.id AS product_id,
			p.product_name,
			p.product_type,
			p.image_url,
			p.product_description
		FROM product_option po
		JOIN product p ON po.product_id = p.id
	`
	} else {
		query = `
		SELECT
			po.id,
			po.product_id,
			po.product_option_name,
			po.price,
			po.weight,
			po.active,
			p.id AS product_id,
			p.product_name,
			p.product_type,
			p.image_url,
			p.product_description
		FROM product_option po
		JOIN product p ON po.product_id = p.id
		WHERE po.active=true
	`
	}

	rows, err := m.DB.QueryContext(ctx, query)

	if err != nil {
		fmt.Println("Query error:", err)
		return false, nil
	}
	defer rows.Close()

	// Create slices to hold the results
	var productOptions []models.ProductOption

	// Iterate through the rows and populate the struct
	for rows.Next() {
		var product_option = models.ProductOption{}
		err := rows.Scan(
			&product_option.Id,
			&product_option.ProductId,
			&product_option.ProductOptionName,
			&product_option.Price,
			&product_option.Weight,
			&product_option.Active,
			&product_option.Product.Id,
			&product_option.Product.ProductName,
			&product_option.Product.ProductType,
			&product_option.Product.ImageUrl,
			&product_option.Product.ProductDescription,
		)
		if err != nil {
			fmt.Println("Error scanning row:", err)
			return false, nil
		}
		productOptions = append(productOptions, product_option)
	}

	// Handle any errors from iterating over rows
	if err := rows.Err(); err != nil {
		fmt.Println("Row iteration error:", err)
		return false, nil
	}

	// Now you have productOptions populated with the data
	// fmt.Println(productOptions)
	return true, productOptions
}

func (m *postgresDBRepo) QueryPromoCode(promocode string) (bool, models.PromoCode) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT
		pc.code,
		pc.amount,
		pc.pinto_id
	FROM promo_code pc
	WHERE code = $1 AND pc.user_use IS NULL
`

	rows, _ := m.DB.QueryContext(ctx, query, promocode)
	defer rows.Close()
	fmt.Println(rows)
	promo_code := models.PromoCode{}
	if rows.Next() {
		fmt.Println("code exist")
		err := rows.Scan(
			&promo_code.Code,
			&promo_code.Amount,
			&promo_code.Pinto,
		)
		if err != nil {
			fmt.Println("Error scanning row:", err)
			return false, promo_code
		}
		return true, promo_code
	}
	fmt.Println("code not exist")
	return false, promo_code
}
func (m *postgresDBRepo) QueryPinto(pintocode string) (bool, models.Pinto) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	query := `
	SELECT
		pt.id,
		pt.duration
	FROM pinto pt
	WHERE id = $1
`

	rows, _ := m.DB.QueryContext(ctx, query, pintocode)
	defer rows.Close()
	pinto := models.Pinto{}
	if rows.Next() {
		fmt.Println("pinto code exist")
		err := rows.Scan(
			&pinto.Id,
			&pinto.Duration,
		)
		if err != nil {
			fmt.Println("Error scanning row:", err)
			return false, pinto
		}
		return true, pinto
	}
	fmt.Println("pinto code not exist")
	return false, pinto
}

func (m *postgresDBRepo) UpdateUserAmount(amount int, lineuserid string) (bool, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := "UPDATE users SET amount_remain=$1 WHERE lineuserid = $2"
	_, err := m.DB.ExecContext(ctx, query, amount, lineuserid)
	if err != nil {
		fmt.Println("error query db", err)
		return false, err
	}
	return true, nil
}

func (m *postgresDBRepo) GetOrderId() (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT order_id 
	from "order"
	WHERE order_id LIKE $1
	ORDER BY order_id DESC;
`

	currentTime := time.Now()
	// Format the date to "YYYYMM" using the Year() and Month() functions
	year := currentTime.Year()
	month := int(currentTime.Month())
	// Create the "YYYYMM" formatted string
	formattedDate := fmt.Sprintf("%d%02d", year, month)
	orderid_string := fmt.Sprintf("%s%s", formattedDate, "000")

	rows, _ := m.DB.QueryContext(ctx, query, formattedDate+"%")
	defer rows.Close()
	order := models.Order{}
	if rows.Next() {
		err := rows.Scan(&order.OrderId)
		if err != nil {
			fmt.Println("error")
		}
		fmt.Println(order.OrderId)
		order_prefix := order.OrderId[:6]
		order_suffic := order.OrderId[6:]
		order_last, _ := strconv.Atoi(order_suffic)
		orderid_current := order_last + 1
		if orderid_current < 10 {
			orderid_string = fmt.Sprintf("%s00%d", order_prefix, orderid_current)
		} else if orderid_current >= 10 && orderid_current < 100 {
			orderid_string = fmt.Sprintf("%s0%d", order_prefix, orderid_current)
		} else {
			orderid_string = fmt.Sprintf("%s%d", order_prefix, orderid_current)
		}

		fmt.Println("New order id is ", orderid_string)
	} else {
		fmt.Println("no data found")
	}

	return orderid_string, nil
}

func (m *postgresDBRepo) CreateOrder(user models.User, orderid string, name string, address string, phone string, date time.Time, weight int, shipping_cost int, product_cost int, status string) (bool, error) {

	query := `
	INSERT INTO "order" (order_id, status, total_price, user_order,address,shipping_id
						,created_at,updated_at,name,phone,date,weight,shipping_cost,product_cost)
	VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)`
	_, err := m.DB.Exec(query,
		orderid,
		status,
		shipping_cost+product_cost,
		user.Lineuserid,
		address,
		"",
		time.Now(),
		time.Now(),
		name,
		phone,
		date,
		weight,
		shipping_cost,
		product_cost,
	)
	if err != nil {
		fmt.Println(err)
	}
	return true, nil
}

func (m *postgresDBRepo) CreateOrderDetail(cartitem []models.CartItem, orderid string) (bool, error) {
	query := `
	INSERT INTO "order_detail" (order_id,product_name,product_description,product_option, quantity, created_at,updated_at,option_price)
	VALUES ($1,$2,$3,$4,$5,$6,$7,$8)`

	for _, item := range cartitem {
		fmt.Println("item", item)
		fmt.Println("quantity", item.Total)
		fmt.Println("total", item.Quantity)
		fmt.Println("total", item.Total/item.Quantity)
		_, err := m.DB.Exec(query,
			orderid,
			item.Name,
			item.Description,
			item.OptionID,
			item.Quantity,
			time.Now(),
			time.Now(),
			int(item.Total/item.Quantity),
		)
		if err != nil {
			fmt.Println(err)
			return false, err
		}
	}

	return true, nil
}

func (m *postgresDBRepo) QueryOrder(fromdate time.Time, todate time.Time, option string) (bool, []models.Order) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	var rows *sql.Rows
	var err error

	if option == "all" {
		query := `
		SELECT
			od.order_id,
			od.status,
			od.total_price,
			od.user_order,
			od.address,
			od.shipping_id,
			od.shipping_cost,
			od.product_cost,
			od.weight,
			od.phone,
			od.name,
			od.date,
			od.created_at,
			od.updated_at,
			us.lineuserid,
			us.first_name,
			us.last_name,
			us.address,
			us.phone
		FROM "order" od
		JOIN users us ON od.user_order = us.lineuserid 
		WHERE od.date BETWEEN $1 AND $2 
		ORDER BY od.order_id;
	`
		rows, err = m.DB.QueryContext(ctx, query, fromdate, todate)
	} else {
		query := `
		SELECT
			od.order_id,
			od.status,
			od.total_price,
			od.user_order,
			od.address,
			od.shipping_id,
			od.shipping_cost,
			od.product_cost,
			od.weight,
			od.phone,
			od.name,
			od.date,
			od.created_at,
			od.updated_at,
			us.lineuserid,
			us.first_name,
			us.last_name,
			us.address,
			us.phone
		FROM "order" od
		JOIN users us ON od.user_order = us.lineuserid 
		WHERE od.date BETWEEN $1 AND $2 
		AND od.status = $3
		ORDER BY od.order_id;
	`
		rows, err = m.DB.QueryContext(ctx, query, fromdate, todate, option)
	}

	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listOrderModel := []models.Order{}
	for rows.Next() {
		orderModel := models.Order{}
		// fmt.Println(rows)
		err := rows.Scan(
			&orderModel.OrderId,
			&orderModel.Status,
			&orderModel.TotalPrice,
			&orderModel.UserOrderId,
			&orderModel.Address,
			&orderModel.ShippingId,
			&orderModel.ShippingCost,
			&orderModel.ProductCost,
			&orderModel.Weight,
			&orderModel.Phone,
			&orderModel.Name,
			&orderModel.Date,
			&orderModel.CreatedAt,
			&orderModel.UpdatedAt,
			&orderModel.UserOrder.Lineuserid,
			&orderModel.UserOrder.FirstName,
			&orderModel.UserOrder.LastName,
			&orderModel.UserOrder.Address,
			&orderModel.UserOrder.Phone)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}
		orderModel.DateString = orderModel.Date.Format("02-01-2006")

		listOrderModel = append(listOrderModel, orderModel)

	}
	// fmt.Println(listProductModel)
	return true, listOrderModel
}

func (m *postgresDBRepo) QueryOrderDetail() (bool, []models.OrderDetail) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT
		od.order_id,
		od.product_option,
		od.quantity,
		od.product_name,
		od.product_description,
		po.id,
		po.product_id,
		po.price,
		po.product_option_name
	FROM "order_detail" od
	JOIN product_option po ON od.product_option = po.id;
`
	rows, err := m.DB.QueryContext(ctx, query)
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listOrderDetailModel := []models.OrderDetail{}
	for rows.Next() {
		orderDetailModel := models.OrderDetail{}
		// fmt.Println(rows)
		err := rows.Scan(
			&orderDetailModel.OrderId,
			&orderDetailModel.ProductOptionId,
			&orderDetailModel.Quantity,
			&orderDetailModel.ProductName,
			&orderDetailModel.ProductDescription,
			&orderDetailModel.ProductOption.Id,
			&orderDetailModel.ProductOption.ProductId,
			&orderDetailModel.OptionPrice,
			&orderDetailModel.ProductOption.ProductOptionName,
		)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}

		listOrderDetailModel = append(listOrderDetailModel, orderDetailModel)

	}
	// fmt.Println(listProductModel)
	return true, listOrderDetailModel
}
func (m *postgresDBRepo) QueryUserDetail() (bool, []models.User) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT
		lineuserid,
		first_name,
		last_name,
		phone,
		amount_remain
	FROM "users"
`
	rows, err := m.DB.QueryContext(ctx, query)
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listUserDetailModel := []models.User{}
	for rows.Next() {
		userDetailModel := models.User{}
		// fmt.Println(rows)
		err := rows.Scan(
			&userDetailModel.Lineuserid,
			&userDetailModel.FirstName,
			&userDetailModel.LastName,
			&userDetailModel.Phone,
			&userDetailModel.AmountRemain,
		)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}

		listUserDetailModel = append(listUserDetailModel, userDetailModel)

	}
	// fmt.Println(listProductModel)
	return true, listUserDetailModel
}
func (m *postgresDBRepo) QueryAllUserDetail() (bool, []models.Userjson) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT
		lineuserid,
		first_name,
		last_name,
		phone,
		house_no,
		county,
		post_code,
		sub_district,
		country,
		soi,
		road,
		amount_remain
	FROM "users"
`
	rows, err := m.DB.QueryContext(ctx, query)
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listUserDetailModel := []models.Userjson{}
	for rows.Next() {
		userDetailModel := models.Userjson{}
		// fmt.Println(rows)
		err := rows.Scan(
			&userDetailModel.Lineuserid,
			&userDetailModel.FirstName,
			&userDetailModel.LastName,
			&userDetailModel.Phone,
			&userDetailModel.HouseNo,
			&userDetailModel.Country,
			&userDetailModel.PostCode,
			&userDetailModel.SubDistrict,
			&userDetailModel.Country,
			&userDetailModel.Soi,
			&userDetailModel.Road,
			&userDetailModel.AmountRemain,
		)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}

		listUserDetailModel = append(listUserDetailModel, userDetailModel)

	}
	// fmt.Println(listProductModel)
	return true, listUserDetailModel
}

func (m *postgresDBRepo) UpdateOrderStatus(status string, orderId string) (bool, error) {
	query := `UPDATE "order" SET status=$1 WHERE order_id = $2`
	_, err := m.DB.Exec(query, status, orderId)

	if err != nil {
		fmt.Println(err)
		return false, err
	}
	return true, nil
}
func (m *postgresDBRepo) UpdateOrderShipping(shippingId string, orderid string) (bool, error) {
	query := `UPDATE "order" SET shipping_id=$1 WHERE order_id = $2`
	_, err := m.DB.Exec(query, shippingId, orderid)

	if err != nil {
		fmt.Println(err)
		return false, err
	}
	return true, nil
}
func (m *postgresDBRepo) UpdateOrderDate(date time.Time, orderid string) (bool, error) {
	query := `UPDATE "order" SET date=$1 WHERE order_id = $2`
	_, err := m.DB.Exec(query, date, orderid)

	if err != nil {
		fmt.Println(err)
		return false, err
	}
	return true, nil
}

func (m *postgresDBRepo) QueryShippingBox() ([]models.ShippingBox, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
	SELECT id,max_capacity,option_name,box_price
	from "shipping"
	ORDER BY max_capacity DESC;
	`

	rows, _ := m.DB.QueryContext(ctx, query)
	defer rows.Close()
	listshipping_box := []models.ShippingBox{}
	for rows.Next() {
		shipping_box := models.ShippingBox{}
		err := rows.Scan(
			&shipping_box.Id,
			&shipping_box.MaxCapacity,
			&shipping_box.OptionName,
			&shipping_box.BoxPrice,
		)

		if err != nil {
			fmt.Println("Error scanning row:", err)
			return nil, err
		}
		listshipping_box = append(listshipping_box, shipping_box)
	}
	return listshipping_box, nil
}

func (m *postgresDBRepo) UpdateProduct(datachange models.DataChange) {

	query := fmt.Sprintf("UPDATE product SET %s = $1 WHERE id = $2", datachange.ChangeFeild)
	//check for active
	var data interface{}
	if datachange.ChangeData == "true" || datachange.ChangeData == "false" {
		data, _ = strconv.ParseBool(datachange.ChangeData)
	} else {
		data = datachange.ChangeData
	}
	_, err := m.DB.Exec(query, data, datachange.Id)

	if err != nil {
		fmt.Println("error query db")
	}
}
func (m *postgresDBRepo) UpdateProductDetail(datachange models.DataChange) {
	query := fmt.Sprintf("UPDATE product_option SET %s = $1 WHERE id = $2", datachange.ChangeFeild)
	//check for active
	var data interface{}
	if datachange.ChangeData == "true" || datachange.ChangeData == "false" {
		data, _ = strconv.ParseBool(datachange.ChangeData)
	} else {
		data = datachange.ChangeData
	}
	_, err := m.DB.Exec(query, data, datachange.Id)

	if err != nil {
		fmt.Println("error query db")
	}
}

func (m *postgresDBRepo) UpdatePintoUsed(pinto models.Pinto, user models.User) (bool, error) {
	query := "UPDATE pinto SET user_id=$1 WHERE id = $2"
	_, err := m.DB.Exec(query, user.Lineuserid, pinto.Id)

	if err != nil {
		fmt.Println(err)
		return false, err
	}
	fmt.Println("Update pinto use successful")
	return true, nil
}

func (m *postgresDBRepo) CreateOrderDetailPinto(orderid string, sender string, receiver string) (bool, error) {
	query := `
	INSERT INTO "order_detail" (order_id,product_name, product_option, quantity, created_at,updated_at,option_price,product_description)
	VALUES ($1,$2,$3,$4,$5,$6,$7,$8)`
	_, err := m.DB.Exec(query,
		orderid,
		"Pinto",
		122,
		1,
		time.Now(),
		time.Now(),
		0,
		"จากคุณ "+sender+" ถึงคุณ "+receiver,
	)
	if err != nil {
		fmt.Println(err)
		return false, err
	}

	return true, nil
}

func (m *postgresDBRepo) CreateProduct(product models.Product) (int, error) {
	var productID int
	query := `
	INSERT INTO "product" (product_name, product_type, image_url, product_description,
							active,vat)
	VALUES ($1,$2,$3,$4,$5,$6) RETURNING id`
	err := m.DB.QueryRow(query,
		product.ProductName,
		product.ProductType,
		product.ImageUrl,
		product.ProductDescription,
		product.Active,
		product.Vat,
	).Scan(&productID)
	if err != nil {
		fmt.Println(err)
		return 0, err
	}
	return productID, nil
}
func (m *postgresDBRepo) CreateProductOption(product_option models.ProductOption, product_id int) (bool, error) {
	query := `
	INSERT INTO "product_option" (product_id, product_option_name, price, active,
							weight)
	VALUES ($1,$2,$3,$4,$5)`
	_, err := m.DB.Exec(query,
		product_id,
		product_option.ProductOptionName,
		product_option.Price,
		product_option.Active,
		product_option.Weight,
	)
	if err != nil {
		fmt.Println(err)
		return false, err
	}
	return true, nil
}

func (m *postgresDBRepo) MarkPromoCode(promocode string, user models.User) (bool, error) {
	query := "UPDATE promo_code SET user_use=$1 WHERE code = $2"
	_, err := m.DB.Exec(query, user.Lineuserid, promocode)

	if err != nil {
		fmt.Println(err)
		return false, err
	}
	fmt.Println("Update pinto use successful")
	return true, nil
}

func (m *postgresDBRepo) QueryOrderById(orderid string) (bool, []models.Order) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
		SELECT
			od.order_id,
			od.status,
			od.total_price,
			od.user_order,
			od.address,
			od.shipping_id,
			od.shipping_cost,
			od.product_cost,
			od.weight,
			od.phone,
			od.name,
			od.date,
			od.created_at,
			od.updated_at,
			us.lineuserid,
			us.first_name,
			us.last_name,
			us.address,
			us.phone
		FROM "order" od
		JOIN users us ON od.user_order = us.lineuserid 
		WHERE od.order_id::TEXT LIKE $1
	`
	rows, err := m.DB.QueryContext(ctx, query, "%"+orderid+"%")

	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listOrderModel := []models.Order{}
	for rows.Next() {
		orderModel := models.Order{}
		// fmt.Println(rows)
		err := rows.Scan(
			&orderModel.OrderId,
			&orderModel.Status,
			&orderModel.TotalPrice,
			&orderModel.UserOrderId,
			&orderModel.Address,
			&orderModel.ShippingId,
			&orderModel.ShippingCost,
			&orderModel.ProductCost,
			&orderModel.Weight,
			&orderModel.Phone,
			&orderModel.Name,
			&orderModel.Date,
			&orderModel.CreatedAt,
			&orderModel.UpdatedAt,
			&orderModel.UserOrder.Lineuserid,
			&orderModel.UserOrder.FirstName,
			&orderModel.UserOrder.LastName,
			&orderModel.UserOrder.Address,
			&orderModel.UserOrder.Phone)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}
		orderModel.DateString = orderModel.Date.Format("02-01-2006")

		listOrderModel = append(listOrderModel, orderModel)

	}
	// fmt.Println(listProductModel)
	return true, listOrderModel
}
func (m *postgresDBRepo) QueryOrderByUser(Userid string) (bool, []models.Order) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	query := `
		SELECT
			od.order_id,
			od.status,
			od.total_price,
			od.user_order,
			od.address,
			od.shipping_id,
			od.shipping_cost,
			od.product_cost,
			od.weight,
			od.phone,
			od.name,
			od.date,
			od.created_at,
			od.updated_at,
			us.lineuserid,
			us.first_name,
			us.last_name,
			us.address,
			us.phone
		FROM "order" od
		JOIN users us ON od.user_order = us.lineuserid 
		WHERE us.lineuserid::TEXT LIKE $1
	`
	rows, err := m.DB.QueryContext(ctx, query, "%"+Userid+"%")

	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}

	defer rows.Close()
	listOrderModel := []models.Order{}
	for rows.Next() {
		orderModel := models.Order{}
		// fmt.Println(rows)
		err := rows.Scan(
			&orderModel.OrderId,
			&orderModel.Status,
			&orderModel.TotalPrice,
			&orderModel.UserOrderId,
			&orderModel.Address,
			&orderModel.ShippingId,
			&orderModel.ShippingCost,
			&orderModel.ProductCost,
			&orderModel.Weight,
			&orderModel.Phone,
			&orderModel.Name,
			&orderModel.Date,
			&orderModel.CreatedAt,
			&orderModel.UpdatedAt,
			&orderModel.UserOrder.Lineuserid,
			&orderModel.UserOrder.FirstName,
			&orderModel.UserOrder.LastName,
			&orderModel.UserOrder.Address,
			&orderModel.UserOrder.Phone)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}
		orderModel.DateString = orderModel.Date.Format("02-01-2006")

		listOrderModel = append(listOrderModel, orderModel)

	}
	// fmt.Println(listProductModel)
	return true, listOrderModel
}

func (m *postgresDBRepo) QueryDiscount() (bool, []models.Product) {
	var rows *sql.Rows
	var err error
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	rows, err = m.DB.QueryContext(ctx, `
    SELECT id, product_name, product_type, product_description, image_url, active
    FROM product
    WHERE product_name LIKE '%discount%'
    ORDER BY id ASC;
	`)

	defer rows.Close()
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return false, nil
	}
	defer rows.Close()

	listProductModel := []models.Product{}
	for rows.Next() {
		productModel := models.Product{}
		// fmt.Println(rows)
		err := rows.Scan(
			&productModel.Id,
			&productModel.ProductName,
			&productModel.ProductType,
			&productModel.ProductDescription,
			&productModel.ImageUrl,
			&productModel.Active)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return false, nil
		}

		listProductModel = append(listProductModel, productModel)

	}
	// fmt.Println(listProductModel)
	return true, listProductModel
}

func (m *postgresDBRepo) QueryTotalRedeem(lineuserid string) (int, int) {
	//Calculate total redeem
	totalRedeem := 0
	rows, err := m.DB.Query(`SELECT amount
	FROM promo_code
	WHERE user_use=$1 
	`, lineuserid)
	defer rows.Close()

	fmt.Println("Credit redeem is", rows)
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return 0, 0
	}
	var amountredeem int

	for rows.Next() {
		err := rows.Scan(
			&amountredeem)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return 0, 0
		}

		totalRedeem += int(amountredeem)
	}

	//calculate pinto redeem
	pintoRedeem := 0
	rows, err = m.DB.Query(`SELECT duration
	FROM pinto
	WHERE user_id=$1 
	`, lineuserid)
	defer rows.Close()

	fmt.Println("Credit redeem is", rows)
	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return 0, 0
	}
	var durationredeem int

	for rows.Next() {
		err := rows.Scan(
			&durationredeem)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return 0, 0
		}

		pintoRedeem += int(durationredeem)
	}
	return totalRedeem, pintoRedeem
}

func (m *postgresDBRepo) QueryTotalSpend(lineuserid string) int {
	//Calculate total redeem
	fmt.Println(lineuserid)
	totalSpend := 0
	rows, err := m.DB.Query(`
    SELECT total_price
    FROM "order"
    WHERE user_order = $1
	AND status IN ('paid', 'shipped')
`, lineuserid)
	defer rows.Close()

	if err != nil {
		// Proper error handling, e.g., log or return an error to indicate failure
		fmt.Println(err)
		return 0
	}
	fmt.Println("Credit spend", rows)
	var totalprice int

	for rows.Next() {
		err := rows.Scan(
			&totalprice)
		if err != nil {
			// Proper error handling, e.g., log or return an error to indicate failure
			fmt.Println(err)
			return 0
		}

		totalSpend += int(totalprice)
	}
	return totalSpend
}
