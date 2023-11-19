package main

import (
	"encoding/gob"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/maxpojchapol/poc_monbaree/driver"
	"github.com/maxpojchapol/poc_monbaree/pkg/config"
	"github.com/maxpojchapol/poc_monbaree/pkg/handlers"
	"github.com/maxpojchapol/poc_monbaree/pkg/models"
	"github.com/maxpojchapol/poc_monbaree/pkg/render"

	"github.com/alexedwards/scs/v2"
)

const portNumber = ":8080"

var app config.AppConfig
var session *scs.SessionManager

// main is the main function
func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Some error occured. Err: %s", err)
	}

	// put something in session
	gob.Register(models.User{})
	gob.Register(models.Pinto{})
	app.InProduction = false

	// set up the session
	session = scs.New()
	session.Lifetime = 24 * time.Hour
	session.Cookie.Persist = true
	session.Cookie.SameSite = http.SameSiteLaxMode
	session.Cookie.Secure = app.InProduction

	app.Session = session

	// connect to database
	log.Println("Connectiing to database..........")
	dbURL := os.Getenv("DATABASE_URL")
	db, err := driver.ConnectSQL(dbURL)
	if err != nil {
		log.Fatal("Cannot connect to DB")
	}
	defer db.SQL.Close()
	log.Println("Database connected")
	tc, err := render.CreateTemplateCache()
	if err != nil {
		log.Fatal("cannot create template cache")
	}

	app.TemplateCache = tc
	app.UseCache = false

	repo := handlers.NewRepo(&app, db)
	handlers.NewHandlers(repo)

	render.NewTemplates(&app)

	fmt.Printf("Staring application on port %s", portNumber)

	srv := &http.Server{
		Addr:    portNumber,
		Handler: routes(&app),
	}

	err = srv.ListenAndServe()
	if err != nil {
		log.Fatal(err)
	}
}
