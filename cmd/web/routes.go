package main

import (
	"net/http"

	"github.com/maxpojchapol/poc_monbaree/pkg/config"
	"github.com/maxpojchapol/poc_monbaree/pkg/handlers"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
)

func routes(app *config.AppConfig) http.Handler {
	mux := chi.NewRouter()
	mux.Use(middleware.Recoverer)
	mux.Use(NoSurf)
	mux.Use(SessionLoad)
	mux.Group(func(r chi.Router) {
		// r.Use(handlers.Repo.RequireLogin)

		r.Post("/postorder", handlers.Repo.PostOrder)
		r.Get("/addcode", handlers.Repo.AddCode)
		r.Post("/postcode", handlers.Repo.PostCode)
		r.Post("/summary", handlers.Repo.Summary)
		r.Get("/postcode_success", handlers.Repo.PostCode)
		r.Get("/success", handlers.Repo.Success)
		r.Get("/filter_admin", handlers.Repo.FilterAdmin)
		r.Get("/filter_order", handlers.Repo.FilterOrder)
		r.Post("/set_gift_date", handlers.Repo.SetGiftDate)
		r.Post("/postline", handlers.Repo.NotifyMessage)
		r.Get("/product", handlers.Repo.Product)
		r.Get("/filter", handlers.Repo.Filter)
		//for checking admin
		mux.Group(func(admin chi.Router) {
			// admin.Use(handlers.Repo.RequireAdmin)
			admin.Get("/admin", handlers.Repo.Admin)
			admin.Get("/getorder", handlers.Repo.GetOrderTable)
			admin.Get("/add_product", handlers.Repo.AddProduct)
			admin.Post("/add_product", handlers.Repo.AddProduct)
			admin.Get("/manage_product", handlers.Repo.ManageProduct)
			admin.Post("/manage_product", handlers.Repo.ManageProduct)
			admin.Post("/update_order_data", handlers.Repo.UpdateOrderData)
			admin.HandleFunc("/download", handlers.Repo.ServeFile)
			admin.HandleFunc("/backup", handlers.Repo.BackupFile)
		})

		// Other authenticated routes
	})
	mux.Get("/home", handlers.Repo.Home)
	mux.Get("/ourstory", handlers.Repo.Ourfarm)
	mux.Get("/visitmon", handlers.Repo.Visitmon)

	mux.Get("/register", handlers.Repo.Register)
	mux.Post("/register", handlers.Repo.PostRegister)
	mux.Get("/", handlers.Repo.Liff)
	mux.Post("/checkuser", handlers.Repo.CheckUser)

	// mux.Get("/", handlers.Repo.Home)

	fileServer := http.FileServer(http.Dir("../../static"))
	mux.Handle("/static/*", http.StripPrefix("/static/", fileServer))

	return mux
}
