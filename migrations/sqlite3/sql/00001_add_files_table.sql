-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS files
(
    id              INTEGER PRIMARY KEY     NOT NULL,
    filename        VARCHAR(60)             NOT NULL,
    config_type     INTEGER                 NOT NULL,
    abs_path        VARCHAR(255)            NOT NULL,
    created_at      DATETIME DEFAULT NOW()  NOT NULL,
    updated_at      DATETIME DEFAULT NOW()  NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_files_filename on files(filename);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_files_filename;

DROP TABLE IF EXISTS files;
-- +goose StatementEnd