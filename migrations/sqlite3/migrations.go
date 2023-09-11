package sqlite3

import (
	"database/sql"
	"embed"

	"github.com/pressly/goose/v3"
)

//go:embed sql/*.sql
var embedMigrations embed.FS

func Run(conn *sql.DB, dbstring string) (err error) {
	db, err := goose.OpenDBWithDriver("sqlite3", dbstring)
	if err != nil {
		return err
	}
	defer func() {
		if errClose := db.Close(); errClose != nil {
			err = errClose
			return
		}
	}()

	goose.SetBaseFS(embedMigrations)

	if err := goose.SetDialect("sqlite3"); err != nil {
		return err
	}
	dir := "sql"
	goose.SetTableName("sm_version")
	if err := goose.Up(db, dir); err != nil {
		return err
	}

	return nil
}
