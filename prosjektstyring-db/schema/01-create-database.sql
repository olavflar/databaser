-- MySQL 8.0 database oppsett for prosjektstyring
DROP DATABASE IF EXISTS prosjektstyring;

CREATE DATABASE prosjektstyring
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE prosjektstyring;

-- Sørger for at alle tabeller opprettes med InnoDB som motor
SET default_storage_engine = INNODB;
SET SESSION sql_require_primary_key = 1;
