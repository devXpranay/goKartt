package main

import (
	"goKart/cmd/api"
	"goKart/config"
	"goKart/db"
	"log"

	"github.com/go-sql-driver/mysql"
)

func main() {
	dbIns, err := db.NewMySQLStorage(mysql.Config{
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

	db.InitDB(dbIns)

	server := api.NewAPIServer(config.Envs.Port, dbIns)
	if err := server.Run(); err != nil {
		log.Fatal(err)
	}
}
