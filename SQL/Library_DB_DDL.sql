DROP SEQUENCE IF EXISTS person_seq;
DROP TABLE IF EXISTS person;

CREATE SEQUENCE person_seq START 1 CACHE 20;
CREATE TABLE person (
    id                   BIGINT NOT NULL PRIMARY KEY,
    person_type_id       BIGINT NOT NULL,
    email                VARCHAR(200) NOT NULL,
    first_name           VARCHAR(200) NOT NULL, 
    last_name            VARCHAR(200) NOT NULL,
    birth_date           DATE, 
    created_by           VARCHAR(64) NOT NULL,
    created_date         TIMESTAMP WITH TIME ZONE NOT NULL,  
    last_updated_by      VARCHAR(64),
    last_updated_date    TIMESTAMP WITH TIME ZONE,  
    version              BIGINT NOT NULL DEFAULT 0
);