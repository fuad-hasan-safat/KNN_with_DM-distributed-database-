clear screen;

DROP TABLE TEMP;
DROP TABLE KTABLE;

CREATE TABLE TEMP (
    sr_no number,
	species_no number, 
	result float,
    species_name varchar2(20)
); 

CREATE TABLE KTABLE (
    sr_no number,
	species_no number, 
	result float,
    species_name varchar2(20)
); 

