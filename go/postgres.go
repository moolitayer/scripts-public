package main

import (
	"database/sql"
	"fmt"

	"github.com/golang-migrate/migrate"
	_ "github.com/golang-migrate/migrate/database/postgres"
	_ "github.com/golang-migrate/migrate/source/file"
	_ "github.com/lib/pq"
)

func main() {
	db, err := sql.Open("postgres", "postgres://postgres@localhost:5432/test?sslmode=disable")
	if err != nil {
		panic(fmt.Sprintf("sql.Open: %v", err))
	}
	fmt.Printf("sql.Open: Success\n")
	err = db.Ping()
	if err != nil {
		panic(fmt.Sprintf("db.Ping: %v", err))
	}
	fmt.Printf("db.Ping: Success\n")
	rows, err := db.Query("SELECT * FROM schema_migrations")
	if err != nil {
		panic(fmt.Sprintf("db.Query: %v", err))
	}
	fmt.Printf("db.Query: Success\n")
	for rows.Next() {
		var version int
		var dirty bool
		err = rows.Scan(&version, &dirty)
		fmt.Println("version| dirty")
		fmt.Printf("%3v, %v\n", version, dirty)
	}

	m, err := migrate.New(
		"file:////home/mtayer/dev/gopath/src/github.com/container-mgmt/dedicated-portal/images/clusters-service/migrations",
		"postgres://postgres@localhost:5432/test?sslmode=disable",
	)
	if err != nil {
		panic(fmt.Sprintf("migrate.New: %v", err))
	}
	fmt.Printf("migrate.New: Success\n")
	ver, dirty, err := m.Version()
	if err != nil && err != migrate.ErrNilVersion {
		panic(fmt.Sprintf("m.Version: %v", err))
	}
	fmt.Printf("m.Version: Success [%v], [%v, [%v]\n", ver, dirty, err)
	err = m.Up()
	if err != nil && err != migrate.ErrNoChange {
		panic(fmt.Sprintf("m.Up: %v", err))
	}
	fmt.Printf("m.Up: Success [%v]\n", err)
	ver, dirty, err = m.Version()
	if err != nil && err != migrate.ErrNilVersion {
		panic(fmt.Sprintf("m.Version: %v", err))
	}
	fmt.Printf("m.Version: Success [%v], [%v], [%v]\n", ver, dirty, err)

}
