CREATE TABLE IF NOT EXISTS police_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(60) NOT NULL,
    name VARCHAR(60) NOT NULL,
    rank VARCHAR(60) NOT NULL,
    badge_number VARCHAR(60) NOT NULL,
    duty_status BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE KEY unique_identifier (identifier)
);

INSERT INTO police_data (identifier, name, rank, badge_number, duty_status) VALUES
('steam:11000010abcdef1', 'John Doe', 'Officer', 'PD1234', FALSE);