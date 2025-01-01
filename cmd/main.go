package main

import (
	"goKart/cmd/api"
	"goKart/config"
	"goKart/db"
	"log"

	"github.com/go-sql-driver/mysql"
)

func main() {
	db, err := db.NewMySQLStorage(mysql.Config{
		User:                 config.Envs.DBUser,
		Passwd:               config.Envs.DBPassword,
		Addr:                 config.Envs.DBAddress,
		DBName:               config.Envs.DBName,
		Net:                  "tcp",
		AllowNativePasswords: true,
		ParseTime:            true,
	})
	if err != nil {
		log.Fatal(err)
	}
	server := api.NewAPIServer(config.Envs.Port, db)
	if err := server.Run(); err != nil {
		log.Fatal(err)
	}
}
