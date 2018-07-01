package main

import (
	"database/sql"
	"os"

	"github.com/golang-migrate/migrate"
	"github.com/golang-migrate/migrate/database/postgres"
	_ "github.com/golang-migrate/migrate/source/file"
	_ "github.com/lib/pq"
)

func main() {
	db, err := sql.Open("postgres", "user=postgres dbname=test sslmode=disable")
	if err != nil {
		panic(err)
	}
	driver, err := postgres.WithInstance(db, &postgres.Config{})
	if err != nil {
		panic(err)
	}
	m, err := migrate.NewWithDatabaseInstance(
		"file:////home/mtayer/dev/gopath/src/github.com/container-mgmt/dedicated-portal/images/clusters-service/migrations",
		"test",
		driver,
	)
	if err != nil {
		panic(err)
	}
	err = m.Down()
	if err != nil {
		panic(err)
	}
	os.Exit(0)
}
