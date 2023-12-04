package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"

	"github.com/jackc/pgx/v4"
)

type Product struct {
	Productname        string `json:"Productname"`
	ProductType        string `json:"Product type"`
	ImageFileName      string `json:"image_file_name"`
	Vat                bool   `json:"vat"`
	Active             bool   `json:"active"`
	ProductDescription string `json:"product description"`
	ProductOption      string `json:"product option"`
}
type Code struct {
	Code  string `json:"Code"`
	Price int    `json:"Price"`
}
type Pinto struct {
	Code     string `json:"Code"`
	Duration int    `json:"Duration"`
}

func main() {
	fmt.Println("Starting config db")

	// Define your PostgreSQL connection configuration
	connConfig := "host=localhost user=max dbname=monbaree password=maxxx456"

	// Establish a database connection
	conn, err := pgx.Connect(context.Background(), connConfig)
	if err != nil {
		fmt.Println("Error connecting to the database:", err)
		return
	}
	defer conn.Close(context.Background())

	// create the product db
	list_product := readproductjsonfile()
	for _, product := range list_product {
		id := createproduct(conn, product)
		if id != 0 {
			createproductoption(id, conn, product.ProductOption)
		}
	}

	//create code db
	list_code := readcodejsonfile()
	for _, code := range list_code {
		createcode(conn, code)
	}

	// //create pinto db
	list_pinto := readpintojsonfile()
	for _, pinto := range list_pinto {
		createpinto(conn, pinto)
	}

}

func createpinto(conn *pgx.Conn, pinto Pinto) {
	fmt.Println("Creating code")
	// Define the SQL query to insert data and return the ID
	query := `
        INSERT INTO promo_code (code,pinto_id, amount)
        VALUES ($1, $2,$3)
    `
	_, err := conn.Exec(context.Background(), query,
		pinto.Code,
		pinto.Code,
		0,
	)
	if err != nil {
		log.Fatal("Error inserting data:", err)
	}
	query = `
        INSERT INTO pinto (id, duration)
        VALUES ($1, $2)
    `
	_, err = conn.Exec(context.Background(), query,
		pinto.Code,
		pinto.Duration,
	)

	if err != nil {
		log.Fatal("Error inserting data:", err)
	}
}
func createcode(conn *pgx.Conn, code Code) {
	fmt.Println("Creating code" + code.Code)
	// Define the SQL query to insert data and return the ID
	query := `
        INSERT INTO promo_code (code, amount)
        VALUES ($1, $2)
    `
	_, err := conn.Exec(context.Background(), query,
		code.Code,
		code.Price,
	)
	if err != nil {
		fmt.Println("Error inserting data:", err)
	}
}

func createproduct(conn *pgx.Conn, product Product) int {
	fmt.Println("Creating product")
	// Define the SQL query to insert data and return the ID
	query := `
        INSERT INTO product (product_name, product_type,image_url,active,vat,product_description)
        VALUES ($1, $2,$3,$4,$5,$6)
        RETURNING id
    `

	// Execute the query and retrieve the inserted ID
	var insertedID int
	err := conn.QueryRow(context.Background(), query,
		product.Productname,
		product.ProductType,
		product.ImageFileName,
		product.Active,
		product.Vat,
		product.ProductDescription,
	).Scan(&insertedID)
	if err != nil {
		fmt.Println("Error inserting data:", err)
		return 0
	}

	fmt.Printf("Inserted Product ID: %d\n", insertedID)
	return insertedID
}

func createproductoption(product_id int, conn *pgx.Conn, productoption string) {
	fmt.Println("Creating product option ", productoption)
	options := strings.Split(productoption, ";")

	for _, option := range options {
		// Split each option by slash (/)
		parts := strings.Split(option, "/")
		fmt.Println("parts is", parts)
		if len(parts) == 3 {
			name := parts[0]
			weight, _ := strconv.ParseFloat(parts[1], 32)
			price, _ := strconv.Atoi(parts[2])
			query := `
			INSERT INTO product_option (product_id, product_option_name,price,weight,active)
			VALUES ($1, $2,$3,$4,$5)
			`
			_, err := conn.Exec(context.Background(), query,
				product_id,
				name,
				price,
				weight,
				true,
			)
			if err != nil {
				fmt.Println("error create product option", err)
			}
		}
	}

}

func readproductjsonfile() []Product {
	file, err := os.Open("product.json")
	if err != nil {
		fmt.Println("Error opening JSON file:", err)
		return nil
	}
	defer file.Close()

	jsonData, err := ioutil.ReadAll(file)
	if err != nil {
		fmt.Println("Error reading JSON file:", err)
		return nil
	}

	// Create a slice of Product structs to store the data
	var products []Product

	// Unmarshal the JSON data into the products slice
	err = json.Unmarshal(jsonData, &products)
	if err != nil {
		fmt.Println("Error unmarshaling JSON:", err)
		return nil
	}
	return products
}

func readcodejsonfile() []Code {
	file, err := os.Open("code.json")
	if err != nil {
		fmt.Println("Error opening JSON file:", err)
		return nil
	}
	defer file.Close()

	jsonData, err := ioutil.ReadAll(file)
	if err != nil {
		fmt.Println("Error reading JSON file:", err)
		return nil
	}

	// Create a slice of Product structs to store the data
	var code []Code

	// Unmarshal the JSON data into the products slice
	err = json.Unmarshal(jsonData, &code)
	if err != nil {
		fmt.Println("Error unmarshaling JSON:", err)
		return nil
	}
	return code
}
func readpintojsonfile() []Pinto {
	file, err := os.Open("pinto.json")
	if err != nil {
		fmt.Println("Error opening JSON file:", err)
		return nil
	}
	defer file.Close()

	jsonData, err := ioutil.ReadAll(file)
	if err != nil {
		fmt.Println("Error reading JSON file:", err)
		return nil
	}

	// Create a slice of Product structs to store the data
	var pinto []Pinto

	// Unmarshal the JSON data into the products slice
	err = json.Unmarshal(jsonData, &pinto)
	if err != nil {
		fmt.Println("Error unmarshaling JSON:", err)
		return nil
	}
	return pinto
}
