package main

import (
	"database/sql"
	"log"
	"time"

	migrations "goose-go/migrations/sqlite3"

	_ "github.com/mattn/go-sqlite3"
)

type File struct {
	ID         int
	Filename   string
	ConfigType int
	AbsPath    string
	CreatedAt  time.Time
	UpdatedAt  time.Time
}

func main() {
	driver := "sqlite3"
	dbstring := "./goose-go.db"
	db, err := sql.Open(driver, dbstring)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	log.Println("connection established")

	err = migrations.Run(db, dbstring)
	if err != nil {
		log.Fatal(err)
	}
	log.Println("migrations finished")

	// ----------------------------------

	// * ==========================================
	// * SELECT
	// * ==========================================
	var file File
	query := `
		SELECT id, filename, config_type, abs_path, created_at, updated_at
		FROM files
	`
	rows, _ := db.Query(query)

	for rows.Next() {
		err = rows.Scan(
			&file.ID,
			&file.Filename,
			&file.ConfigType,
			&file.AbsPath,
			&file.CreatedAt,
			&file.UpdatedAt,
		)
		if err != nil {
			log.Println(err)
		}
		log.Println(file)
	}

	log.Println("goose-go work finished")
}
