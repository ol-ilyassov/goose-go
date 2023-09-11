
EXECUTABLE_NAME := goose-go

GO_PATH := /home/user/go/bin/
MIGRATIONS_DIR := migrations/sqlite3/sql
DB_DRIVER := sqlite3
DB_STRING := bin/goose-go.db

.SILENT:

.PHONY: build
build:
	cd cmd/app && \
		go build -o ../../bin/${EXECUTABLE_NAME}
	@echo "- make build finished"

# build: builds app and runs it.
.PHONY: run
run: build
	cd bin && \
		./${EXECUTABLE_NAME}
	@echo "- make run finished"

# clear: clears bin folder.
.PHONY: clear
clear: 
	rm -rf bin
	@echo "- make clear finished"

# migrate/up: runs all up migrations.
.PHONY: migrate/up
migrate/up:
	${GO_PATH}/goose -dir=${MIGRATIONS_DIR} ${DB_DRIVER} ${DB_STRING} up
	@echo "- make migrate/up finished"

# migrate/down: runs all down migrations.
.PHONY: migrate/down
migrate/down:
	${GO_PATH}/goose -dir=${MIGRATIONS_DIR} ${DB_DRIVER} ${DB_STRING} reset
	@echo "- make migrate/down finished"

# migrate/status: returns migration status.
.PHONY: migrate/status
migrate/status:
	${GO_PATH}/goose -dir=${MIGRATIONS_DIR} ${DB_DRIVER} ${DB_STRING} status
	@echo "- make migrate/status finished"

# migrate/version: returns current migrations version.
.PHONY: migrate/version
migrate/version:
	${GO_PATH}/goose -dir=${MIGRATIONS_DIR} ${DB_DRIVER} ${DB_STRING} version
	@echo "- make migrate/version finished"
