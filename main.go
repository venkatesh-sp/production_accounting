package main

import (
	databases "production.accounting/accounting"
	accounting "production.accounting/db/models"
	"production.accounting/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	dbConn := databases.ConnectDB()

	db := accounting.New(dbConn)

	// Initialize routes from different route files
	routes.InitUserRoutes(r, db)
	routes.InitVendorRoutes(r, db)

	r.Run(":8080")
}
