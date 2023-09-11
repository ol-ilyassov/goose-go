-- +goose Up
INSERT INTO files(
    filename, 
    config_type, 
    abs_path,
    created_at,
    updated_at)
VALUES(
    "logstash-test",
    1,
    "/etc/logstash/conf.d/logstash-test.conf",
    datetime("now"),
    datetime("now")
);

-- +goose Down
DELETE FROM files
WHERE filename="logstash-test";