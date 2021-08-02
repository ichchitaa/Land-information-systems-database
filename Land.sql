Drop DATABASE if exists Land;
CREATE DATABASE if not exists Land;
show databases;
USE Land;
show tables;

DROP TABLE IF EXISTS Buildings;
CREATE TABLE Buildings 
    (
     Land_Land_ID VARCHAR (50), 
     Building_ID VARCHAR (50) , 
     Building_name_Arabic VARCHAR (50) , 
     Building_name_English VARCHAR (50) ,
     CONSTRAINT Buildings_Land_FK FOREIGN KEY 
    ( 
     Land_Land_ID
    ) 
    REFERENCES Land 
    ( 
     Land_ID 
    ) 
    );
    
DROP TABLE IF EXISTS City_lookup;

CREATE TABLE City_lookup 
    (
     City_ID VARCHAR (50) NOT NULL , 
     City_name_English VARCHAR (50) , 
     City_name_Arabic VARCHAR (50) ,
     CONSTRAINT City_lookup_PK PRIMARY KEY (City_ID)
    );
    
DROP TABLE IF EXISTS Land;

CREATE TABLE Land 
    (
     Land_ID VARCHAR (50) NOT NULL, 
     Krooki_number VARCHAR (50) NOT NULL, 
     Land_creation_date DATE , 
     Northing BIGINT , 
     Easting BIGINT , 
     City_lookup_City_ID VARCHAR (50) NOT NULL , 
     Region_lookup_Region_ID VARCHAR (50) NOT NULL , 
     Postal_code VARCHAR (40) , 
     Zip_Code INTEGER , 
     Plot_number VARCHAR (50) , 
     Block VARCHAR (50) , 
     Area VARCHAR (50) , 
     Height_in_metres VARCHAR (50) , 
     Floors VARCHAR (50) , 
     Number_of_parking_spaces NUMERIC (20,10) , 
     Land_use_lookup_Land_use_ID VARCHAR (50) NOT NULL , 
     Setbacks_lookup_Setback_ID VARCHAR (50) NOT NULL , 
     Condition_lookup_Condition_ID VARCHAR (50) NOT NULL ,
     CONSTRAINT Land_PK PRIMARY KEY (Land_ID) ,
     CONSTRAINT Land_City_lookup_FK FOREIGN KEY 
    ( 
     City_lookup_City_ID
    ) 
    REFERENCES City_lookup 
    ( 
     City_ID 
    ) ,
    CONSTRAINT Land_Condition_lookup_FK FOREIGN KEY 
    ( 
     Condition_lookup_Condition_ID
    ) 
    REFERENCES Condition_lookup 
    ( 
     Condition_ID 
    ) ,
    CONSTRAINT Land_Land_use_lookup_FK FOREIGN KEY 
    ( 
     Land_use_lookup_Land_use_ID
    ) 
    REFERENCES Land_use_lookup 
    ( 
     Land_use_ID 
    ) ,
    CONSTRAINT Land_Region_lookup_FK FOREIGN KEY 
    ( 
     Region_lookup_Region_ID
    ) 
    REFERENCES Region_lookup 
    ( 
     Region_ID 
    ) ,
    CONSTRAINT Land_Setbacks_lookup_FK FOREIGN KEY 
    ( 
     Setbacks_lookup_Setback_ID
    ) 
    REFERENCES Setbacks_lookup 
    ( 
     Setback_ID 
    ) 
    );
    
DROP TABLE IF EXISTS Region_lookup;

CREATE TABLE Region_lookup 
    (
     Region_ID VARCHAR (50) NOT NULL , 
     Region__name_English VARCHAR (50) , 
     Region_name_Arabic VARCHAR (50) ,
     CONSTRAINT Region_lookup_PK PRIMARY KEY (Region_ID)
    );