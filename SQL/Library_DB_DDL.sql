--
-- Drop objects 
--
DROP SEQUENCE IF EXISTS person_seq;
DROP TABLE IF EXISTS person CASCADE;

DROP SEQUENCE IF EXISTS address_seq;
DROP TABLE IF EXISTS address CASCADE;


--
-- Create objects 
--
CREATE SEQUENCE person_seq START 1 CACHE 20;
CREATE TABLE person (
    id                   BIGINT NOT NULL,
    person_type_id       BIGINT NOT NULL,
    email                VARCHAR(200) NOT NULL,
    password             VARCHAR(36) NOT NULL,
    first_name           VARCHAR(200) NOT NULL, 
    last_name            VARCHAR(200) NOT NULL,
    birth_date           DATE, 
    created_by           VARCHAR(64) NOT NULL,
    created_date         TIMESTAMP WITH TIME ZONE NOT NULL,  
    last_updated_by      VARCHAR(64),
    last_updated_date    TIMESTAMP WITH TIME ZONE,  
    version              BIGINT NOT NULL DEFAULT 0,
  CONSTRAINT person_pk PRIMARY KEY (id),
  CONSTRAINT person_uk1 UNIQUE (email) 
);


CREATE SEQUENCE address_seq START 1 CACHE 20;
CREATE TABLE address (
    id                   BIGINT NOT NULL,
	person_id            BIGINT NOT NULL,
	city_village         VARCHAR(64) NOT NULL,
	street               VARCHAR(64) NOT NULL,
	building_number      VARCHAR(8) NOT NULL,
	apartment_number     VARCHAR(8),
	zip_code             VARCHAR(16) NOT NULL,
	created_by           VARCHAR(64) NOT NULL,
    created_date         TIMESTAMP WITH TIME ZONE NOT NULL,  
    last_updated_by      VARCHAR(64),
    last_updated_date    TIMESTAMP WITH TIME ZONE,  
    version              BIGINT NOT NULL DEFAULT 0,
  CONSTRAINT address_pk PRIMARY KEY (id),
  CONSTRAINT address_fk1 FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE INDEX address_idx1 ON address (person_id);
