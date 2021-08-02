Drop DATABASE if exists Ownership;
CREATE DATABASE if not exists Ownership;
show databases;
USE Ownership;
show tables;

CREATE TABLE addresses ( 
    ip_id VARCHAR(40) NOT NULL,
    city                               VARCHAR(40),
    region                             VARCHAR(40),
    state                              VARCHAR(40),
    country                            VARCHAR(40),
    country_code                       VARCHAR(40),
    zip_code                           VARCHAR(40)
);

CREATE TABLE application_lookup (
    applicant_full_name_english                                               VARCHAR(100) NOT NULL,
    applicant_full_name_arabic                                                CHAR(100),
    application_id                                                            VARCHAR(50) NOT NULL,
    land_id                                                                   VARCHAR(50), 
-- SQLINES DEMO *** me length exceeds maximum allowed length(30) 
    Previously_applied_number                                     INTEGER, 
-- SQLINES DEMO *** me length exceeds maximum allowed length(30) 
    Previously_granted_number                                INTEGER,
    legal_deed_legal_deed_id                                                  VARCHAR(50) NOT NULL COMMENT 'Let it be 0 if there is no legal deed in the application.',
    legal_deed_approved                                                       DOUBLE, 
-- SQLINES DEMO *** me length exceeds maximum allowed length(30) 
    electricity_bill_id                                      VARCHAR(50) NOT NULL COMMENT '0 if this wasn''t submitted',
    electricity_bill_approved                                                 DOUBLE, 
-- SQLINES DEMO *** me length exceeds maximum allowed length(30) 
    power_of_attorney_id                                    VARCHAR(50) NOT NULL COMMENT '0 if no Power of Attorney.',
    power_of_attorney_approved                                                DOUBLE,
    all_required_documents                                                    DOUBLE,
    application_fees_paid                                                     DOUBLE,
    application_approved                                                      DOUBLE, 
-- SQLINES DEMO *** me length exceeds maximum allowed length(30) 
    Inventory_registration_ID VARCHAR(50) NOT NULL COMMENT '0 if this isn''t submitted.',
    Inventory_well_approved                                                 DOUBLE
);

ALTER TABLE application_lookup ADD CONSTRAINT application_lookup_pk PRIMARY KEY ( applicant_full_name_english );

CREATE TABLE buildings (
    land_land_id          CHAR(40) NOT NULL,
    building_id           CHAR(40),
    building_name_arabic  VARCHAR(50),
    building_name_english VARCHAR(50)
);

CREATE TABLE city_lookup (
    city_id           VARCHAR(50) NOT NULL,
    city_name_english VARCHAR(50),
    city_name_arabic  VARCHAR(50)
);

ALTER TABLE city_lookup ADD CONSTRAINT city_lookup_pk PRIMARY KEY ( city_id );

CREATE TABLE company_lookup (
    company_id           VARCHAR(40) NOT NULL,
    company_name_arabic  VARCHAR(40),
    company_name_english VARCHAR(50)
);

ALTER TABLE company_lookup ADD CONSTRAINT company_lookup_pk PRIMARY KEY ( company_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE condition_lookup (
    condition_id                  CHAR(40) NOT NULL,
    condition_type_english        VARCHAR(50),
    condition_description_english VARCHAR(100),
    condition_type_arabic         VARCHAR(50),
    condition_type_arabic_1       VARCHAR(100)
);

ALTER TABLE condition_lookup ADD CONSTRAINT condition_lookup_pk PRIMARY KEY ( condition_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE education_level_lookup (
    education_level_id      VARCHAR(40) NOT NULL,
    education_level_arabic  VARCHAR(40),
    education_level_english VARCHAR(50)
);

ALTER TABLE education_level_lookup ADD CONSTRAINT education_level_lookup_pk PRIMARY KEY ( education_level_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE electricity_bill (
    electricity_bill_id VARCHAR(50) NOT NULL COMMENT 'A row for the value 0: if this isn''t submitted',
    amount_due          DOUBLE,
    account_number      INTEGER,
    billing_date        DATETIME,
    amount_due_by       DATETIME,
    other_details       VARCHAR(100)
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN electricity_bill.electricity_bill_id IS
    'A row for the value 0: if this isn''t submitted'; */

ALTER TABLE electricity_bill ADD CONSTRAINT electricity_bill_pk PRIMARY KEY ( electricity_bill_id );

CREATE TABLE health_insurance ( 
    ip_id  VARCHAR(40) NOT NULL, 
    insurance_company_lookup_id VARCHAR(50) NOT NULL,
    insurance_id                        CHAR(40),
    policy_number                       INTEGER,
    policy_name                         VARCHAR(40),
    deductible                          DOUBLE,
    additional_info                     VARCHAR(50)
);

ALTER TABLE health_insurance ADD CONSTRAINT health_insurance_pk PRIMARY KEY ( ip_id );

CREATE TABLE id_type_lookup (
    id_type_id           CHAR(50) NOT NULL,
    id_type_name_arabic  VARCHAR(50),
    id_type_name_english VARCHAR(50)
);

ALTER TABLE id_type_lookup ADD CONSTRAINT id_type_lookup_pk PRIMARY KEY ( id_type_id );

CREATE TABLE insurance_benefits ( 
    health_insurance_involved_parties_ip_id VARCHAR(40) NOT NULL,
    benefit_name                                        VARCHAR(50),
    additional_info                                     VARCHAR(50)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE insurance_company_lookup (
    company_id           VARCHAR(50) NOT NULL,
    company_name_arabic  VARCHAR(50),
    company_name_english VARCHAR(50)
);

ALTER TABLE insurance_company_lookup ADD CONSTRAINT insurance_company_lookup_pk PRIMARY KEY ( company_id );

CREATE TABLE inventory_or_well (
    Inventory_registration_ID VARCHAR(50) NOT NULL COMMENT 'A row for an ID of 0: for if this isn''t submitted',
    inventory_or_registration   VARCHAR(50), 
    important_details           VARCHAR(100)
);

ALTER TABLE inventory_or_well ADD CONSTRAINT inventory_or_well_pk PRIMARY
KEY ( Inventory_registration_ID );

CREATE TABLE involved_parties (
    involved_party_id                                 VARCHAR(40) NOT NULL,
    prefix                                            VARCHAR(10),
    first_name                                        VARCHAR(25),
    middle_name                                       VARCHAR(35),
    last_name                                         VARCHAR(30),
    suffix                                            VARCHAR(10),
    date_of_birth                                     DATETIME,
    age                                               DOUBLE, 
    nationality_id                 INT NOT NULL,
    alive                                             DOUBLE,
    individual_annual_income                          DOUBLE,
    household_annual_income                           DOUBLE,
    eligible_for_grant                                DOUBLE, 
    education_level_id         VARCHAR(40) NOT NULL,
    job_title_id                     VARCHAR(40) NOT NULL,
    company_lookup_company_id                         VARCHAR(40) NOT NULL,
    involved_party_type_id                            VARCHAR(40), 
    involved_party_type_lookup_involved_party_type_id VARCHAR(40) NOT NULL, 
    application_lookup_applicant_full_name_english    VARCHAR(100) NOT NULL,
    mortgage_mortgage_id                              VARCHAR(50) NOT NULL COMMENT '0 if there is no mortgage'
);

ALTER TABLE involved_parties ADD CONSTRAINT involved_parties_pk PRIMARY KEY ( involved_party_id );

CREATE TABLE involved_party_id_numbers ( 
    ip_id VARCHAR(40) NOT NULL,
    id_type_lookup_id_type_id          CHAR(50) NOT NULL,
    id_number                          VARCHAR(25)
);

ALTER TABLE involved_party_id_numbers ADD CONSTRAINT involved_party_id_pk PRIMARY KEY ( ip_id );

CREATE TABLE involved_party_type_lookup (
    involved_party_type_id        VARCHAR(40) NOT NULL,
    involved_party_type_english   VARCHAR(50),
    involved_party_type_english_1 VARCHAR(50),
    additional_details            VARCHAR(100)
);

ALTER TABLE involved_party_type_lookup ADD CONSTRAINT involved_party_type_lookup_pk PRIMARY KEY ( involved_party_type_id );

CREATE TABLE job_title_lookup (
    job_title_id      VARCHAR(40) NOT NULL,
    job_title_arabic  VARCHAR(40),
    job_title_english VARCHAR(50)
);

ALTER TABLE job_title_lookup ADD CONSTRAINT job_title_lookup_pk PRIMARY KEY ( job_title_id );

CREATE TABLE land (
    land_id                       CHAR(40) NOT NULL,
    krooki_number                 CHAR(40),
    land_creation_date            DATETIME,
    northing                      DOUBLE,
    easting                       DOUBLE,
    city_lookup_city_id           VARCHAR(50) NOT NULL,
    region_lookup_region_id       VARCHAR(50) NOT NULL,
    postal_code                   VARCHAR(40),
    zip_code                      INTEGER,
    plot_number                   VARCHAR(50),
    block_numbr                         VARCHAR(50),
    area                          VARCHAR(50),
    height_in_metres              VARCHAR(50),
    floors                        VARCHAR(50),
    number_of_parking_spaces      DECIMAL(20, 10),
    land_use_lookup_land_use_id   CHAR(50) NOT NULL,
    setbacks_lookup_setback_id    CHAR(50) NOT NULL,
    condition_lookup_condition_id CHAR(40) NOT NULL
);

ALTER TABLE land ADD CONSTRAINT land_pk PRIMARY KEY ( land_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE land_use_lookup (
    land_use_id      CHAR(50) NOT NULL,
    land_use_arabic  VARCHAR(50),
    land_use_english VARCHAR(50)
);

ALTER TABLE land_use_lookup ADD CONSTRAINT land_use_lookup_pk PRIMARY KEY ( land_use_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE legal_deed (
    legal_deed_id          VARCHAR(50) NOT NULL COMMENT 'Including a row for an ID of 0: no legal deed',
    legal_deed_name        VARCHAR(100),
    legal_deed_description VARCHAR(100)
);

ALTER TABLE legal_deed ADD CONSTRAINT legal_deed_pk PRIMARY KEY ( legal_deed_id );

CREATE TABLE mortgage (
    mortgage_id                          VARCHAR(50) NOT NULL COMMENT 'A row for an ID of 0: if there is no mortgage.',
    Borrower_names                   VARCHAR(200),
    lender_name                          VARCHAR(100),
    Length_of_mortgage_years         DOUBLE, 
    Annual_rate_of_return_percent DOUBLE
);

ALTER TABLE mortgage ADD CONSTRAINT mortgage_pk PRIMARY KEY ( mortgage_id );

CREATE TABLE nationality_lookup (
    nationality_id      INT NOT NULL,
    nationaity_arabic   VARCHAR(100),
    nationality_english VARCHAR(100),
    created_by          VARCHAR(20),
    created_date        DATETIME,
    updated_by          VARCHAR(20),
    updated_date        DATETIME
);

ALTER TABLE nationality_lookup ADD CONSTRAINT nationality_lookup_pk PRIMARY KEY ( nationality_id );

CREATE TABLE ownership_history ( 
    real_estate_transaction_id BIGINT NOT NULL, 
    ip_id     VARCHAR(40) NOT NULL,
    land_land_id                           CHAR(40) NOT NULL,
    date_purchased                         DATETIME,
    land_value                             DOUBLE,
    purchase_price                         DOUBLE,
    additional_info                        VARCHAR(50),
    is_current_owner                       VARCHAR(1),
    valid_start_date                       DATETIME,
    valid_end_date                         DATETIME
);

CREATE TABLE phone_numbers ( 
    ip_id VARCHAR(40) NOT NULL,
    type_of_number                     VARCHAR(20),
    Number                           INTEGER
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE power_of_attorney (
    power_of_attorney_id        VARCHAR(50) NOT NULL,
    applicant_full_name_english VARCHAR(100),
    attorney_full_name_english  VARCHAR(100),
    other_details               VARCHAR(100)
);

ALTER TABLE power_of_attorney ADD CONSTRAINT power_of_attorney_pk PRIMARY KEY ( power_of_attorney_id );

CREATE TABLE real_estate_transaction (
    transaction_id   BIGINT NOT NULL,
    transaction_date DATETIME,
    transaction_type VARCHAR(5),
    additional_info  VARCHAR(100)
);

ALTER TABLE real_estate_transaction ADD CONSTRAINT real_estate_transaction_pk PRIMARY KEY ( transaction_id );

CREATE TABLE region_lookup (
    region_id            VARCHAR(50) NOT NULL,
    region__name_english VARCHAR(50),
    region_name_arabic   VARCHAR(50)
);

ALTER TABLE region_lookup ADD CONSTRAINT region_lookup_pk PRIMARY KEY ( region_id );

CREATE TABLE setbacks_lookup (
    setback_id           CHAR(50) NOT NULL,
    setback_name_arabic  VARCHAR(50),
    setback_name_english VARCHAR(50),
    setback_description  VARCHAR(100)
);

ALTER TABLE setbacks_lookup ADD CONSTRAINT setbacks_lookup_pk PRIMARY KEY ( setback_id );

CREATE TABLE university ( 
    university_lookup_id    VARCHAR(50) NOT NULL,  
    ip_id VARCHAR(40) NOT NULL
);

ALTER TABLE university ADD CONSTRAINT university_pk PRIMARY KEY ( university_lookup_id,
                                                                  ip_id );

CREATE TABLE university_lookup (
    university_id           VARCHAR(50) NOT NULL,
    university_name_arabic  VARCHAR(50),
    university_name_english VARCHAR(50)
);

ALTER TABLE university_lookup ADD CONSTRAINT university_lookup_pk PRIMARY KEY ( university_id );

ALTER TABLE addresses
    ADD CONSTRAINT addresses_involved_parties_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE application_lookup
    ADD CONSTRAINT application_lookup_electricity_bill_fk FOREIGN KEY ( electricity_bill_id )
        REFERENCES electricity_bill ( electricity_bill_id );

ALTER TABLE application_lookup
    ADD CONSTRAINT application_inventory_or_well_fk FOREIGN KEY ( Inventory_or_well_ID )
        REFERENCES inventory_certificate_or_registration_of_well ( Inventory_registration_ID );

ALTER TABLE application_lookup
    ADD CONSTRAINT application_lookup_legal_deed_fk FOREIGN KEY ( legal_deed_legal_deed_id )
        REFERENCES legal_deed ( legal_deed_id );

ALTER TABLE application_lookup
    ADD CONSTRAINT application_power_of_attorney_fk FOREIGN KEY ( power_of_attorney_id )
        REFERENCES power_of_attorney ( power_of_attorney_id );

ALTER TABLE buildings
    ADD CONSTRAINT buildings_land_fk FOREIGN KEY ( land_land_id )
        REFERENCES land ( land_id );

ALTER TABLE health_insurance
    ADD CONSTRAINT health_insurance_lookup_fk FOREIGN KEY ( insurance_company_lookup_id )
        REFERENCES insurance_company_lookup ( company_id );

ALTER TABLE health_insurance
    ADD CONSTRAINT health_insurance_ip_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE insurance_benefits
    ADD CONSTRAINT insurance_benefits_health_insurance_fk FOREIGN KEY ( health_insurance_ip_id )
        REFERENCES health_insurance ( ip_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT involved_parties_application_lookup_fk FOREIGN KEY ( application_lookup_applicant_full_name_english )
        REFERENCES application_lookup ( applicant_full_name_english );

ALTER TABLE involved_parties
    ADD CONSTRAINT involved_parties_company_lookup_fk FOREIGN KEY ( company_lookup_company_id )
        REFERENCES company_lookup ( company_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT involved_parties_education_fk FOREIGN KEY ( education_level_id )
        REFERENCES education_level_lookup ( education_level_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT ip_type_lookup_fk FOREIGN KEY ( involved_party_type_lookup_involved_party_type_id )
        REFERENCES involved_party_type_lookup ( involved_party_type_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT involved_parties_job_title_lookup_fk FOREIGN KEY ( job_title_id )
        REFERENCES job_title_lookup ( job_title_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT involved_parties_mortgage_fk FOREIGN KEY ( mortgage_mortgage_id )
        REFERENCES mortgage ( mortgage_id );

ALTER TABLE involved_parties
    ADD CONSTRAINT ip_nationality_fk FOREIGN KEY ( nationality_id )
        REFERENCES nationality_lookup ( nationality_id );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE involved_party_id_numbers
    ADD CONSTRAINT involved_party_id_numbers_id_type_lookup_fk FOREIGN KEY ( id_type_lookup_id_type_id )
        REFERENCES id_type_lookup ( id_type_id );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE involved_party_id_numbers
    ADD CONSTRAINT involved_party_id_numbers_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE land
    ADD CONSTRAINT land_city_lookup_fk FOREIGN KEY ( city_lookup_city_id )
        REFERENCES city_lookup ( city_id );

ALTER TABLE land
    ADD CONSTRAINT land_condition_lookup_fk FOREIGN KEY ( condition_lookup_condition_id )
        REFERENCES condition_lookup ( condition_id );

ALTER TABLE land
    ADD CONSTRAINT land_land_use_lookup_fk FOREIGN KEY ( land_use_lookup_land_use_id )
        REFERENCES land_use_lookup ( land_use_id );

ALTER TABLE land
    ADD CONSTRAINT land_region_lookup_fk FOREIGN KEY ( region_lookup_region_id )
        REFERENCES region_lookup ( region_id );

ALTER TABLE land
    ADD CONSTRAINT land_setbacks_lookup_fk FOREIGN KEY ( setbacks_lookup_setback_id )
        REFERENCES setbacks_lookup ( setback_id );

ALTER TABLE ownership_history
    ADD CONSTRAINT ownership_history_ip_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE ownership_history
    ADD CONSTRAINT ownership_history_land_fk FOREIGN KEY ( land_land_id )
        REFERENCES land ( land_id );

ALTER TABLE ownership_history
    ADD CONSTRAINT ownership_transaction_fk FOREIGN KEY ( real_estate_transaction_id )
        REFERENCES real_estate_transaction ( transaction_id );

ALTER TABLE phone_numbers
    ADD CONSTRAINT phone_numbers_ip_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE university
    ADD CONSTRAINT university_involved_parties_fk FOREIGN KEY ( ip_id )
        REFERENCES involved_parties ( involved_party_id );

ALTER TABLE university
    ADD CONSTRAINT university_university_lookup_fk FOREIGN KEY ( university_lookup_university_id )
        REFERENCES university_lookup ( university_id );