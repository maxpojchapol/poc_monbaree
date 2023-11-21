package main

import (
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
)

func main() {
	// urlExample := "postgres://username:password@localhost:5432/database_name"
	conn, err := pgx.Connect(context.Background(), "host=localhost port=5432 dbname=monbaree user=postgres password=Maxxx@456")
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}
	defer conn.Close(context.Background())

	maxcap := "2000"
	optionname := "2kg"
	boxprice := "50"

	insertStatement := `
	INSERT INTO shipping (max_capacity, option_name, box_price)
	VALUES ($1, $2, $3)
	RETURNING id
`
	_, err = conn.Exec(context.Background(), insertStatement, maxcap, optionname, boxprice)
	if err != nil {
		fmt.Fprintf(os.Stderr, "execute failed: %v\n", err)
		os.Exit(1)
	}

}
