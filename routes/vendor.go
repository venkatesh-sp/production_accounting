package routes

import (
	"github.com/gin-gonic/gin"
	accounting "production.accounting/db/models"
)

func InitVendorRoutes(router *gin.Engine, db *accounting.Queries) {
	vendorRouter := router.Group("/api/vendors")
	{
		vendorRouter.GET("/", func(c *gin.Context) {
			getVendors(c, db)
		})
		vendorRouter.POST("/", func(c *gin.Context) {
			createVendor(c, db)
		})
		vendorRouter.GET("/:id", func(c *gin.Context) {
			getVendor(c, db)
		})
		vendorRouter.PUT("/:id", func(c *gin.Context) {
			updateVendor(c, db)
		})
		vendorRouter.DELETE("/:id", func(c *gin.Context) {
			deleteVendor(c, db)
		})
	}
}

func getVendors(c *gin.Context, db *accounting.Queries) {

}
func createVendor(c *gin.Context, db *accounting.Queries) {}
func getVendor(c *gin.Context, db *accounting.Queries)    {}
func updateVendor(c *gin.Context, db *accounting.Queries) {}
func deleteVendor(c *gin.Context, db *accounting.Queries) {}
