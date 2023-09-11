
# goose-go

My practical code to train work with goose cli migration tool and integrations with Go project code.

# Technological Stack

- Built in Go version 1.20
- Uses [go-sqlite3](https://github.com/mattn/go-sqlite3) self-contained SQL database
- Uses [pressly/goose/v3](httpsL//github.com/pressly/goose) cli SQL migrations tool for Go

# Dependencies

- Linux requires to install gcc library for build operation (additionally sqlite3 self will be installed):
````
sudo apt-get install sqlite3 libsqlite3-dev gcc
````

- goose cli migration toold:
````
$ go install github.com/pressly/goose/v3/cmd/goose@latest
````