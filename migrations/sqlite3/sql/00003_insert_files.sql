-- +goose Up
INSERT INTO files(
    filename, 
    config_type, 
    abs_path,
    created_at,
    updated_at)
VALUES(
    "heartbeat-test",
    2,
    "/etc/heartbeatmonitor/heartbeat-test.yml",
    datetime("now"),
    datetime("now")
);

-- +goose Down
DELETE FROM files
WHERE filename="heartbeat-test";