package databases

import (
	"fmt"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
	accounting "production.accounting/db/models"
)

func AutoMigrateAllModels(db *gorm.DB) {
	models := []interface{}{&accounting.User{}, &accounting.Vendor{}} // Add all your model structs here

	for _, model := range models {
		db.AutoMigrate(model)
	}
}

func ConnectDB() *sqlx.DB {
	dsn := "user=venkatesh dbname=accounting password=soul123 sslmode=disable" // Update with your database details
	db, err := sqlx.Connect("postgres", dsn)
	if err != nil {
		fmt.Println("Error connecting database:", err.Error())
		return nil
	}
	fmt.Println("Database connected successfully")
	gormDB, err := gorm.Open(postgres.New(postgres.Config{
		Conn: db,
	}), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			SingularTable: true,
		},
	})

	if err != nil {
		fmt.Println("Error connecting database with GORM:", err.Error())
		return nil
	}

	AutoMigrateAllModels(gormDB)
	return db
}
