CREATE USER IF NOT EXISTS 'exporter'@'%' identified BY 'password';
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'%';
GRANT SELECT ON performance_schema.* TO 'exporter'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'max' with grant option;
FLUSH PRIVILEGES;
