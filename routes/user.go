package routes

import (
	"github.com/gin-gonic/gin"
	accounting "production.accounting/db/models"
)

func InitUserRoutes(router *gin.Engine, db *accounting.Queries) {
	userRouter := router.Group("/api/users")
	{
		userRouter.GET("/", func(c *gin.Context) {
			getUsers(c, db)
		})
		userRouter.POST("/", func(c *gin.Context) {
			createUser(c, db)
		})
		userRouter.GET("/:id", func(c *gin.Context) {
			getUser(c, db)
		})
		userRouter.PUT("/:id", func(c *gin.Context) {
			updateUser(c, db)
		})
		userRouter.DELETE("/:id", func(c *gin.Context) {
			deleteUser(c, db)
		})
	}
}

func getUsers(c *gin.Context, db *accounting.Queries) {
	users, err := db.ListUsers(c)
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, users)
}
func createUser(c *gin.Context, db *accounting.Queries) {
	var newUser accounting.CreateUserParams
	if err := c.ShouldBindJSON(&newUser); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}
	createdUser, err := db.CreateUser(c, newUser)
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(201, createdUser)
}
func getUser(c *gin.Context, db *accounting.Queries)    {}
func updateUser(c *gin.Context, db *accounting.Queries) {}
func deleteUser(c *gin.Context, db *accounting.Queries) {}
