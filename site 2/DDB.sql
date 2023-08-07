clear screen;

DROP TABLE IRIS1;
--DROP TABLE IRIS2;
--DROP TABLE IRIS3;

CREATE TABLE IRIS1 (species_no number, petal_width float, petal_length float, sepal_width float, sepal_length float, species_name varchar2(20)); 
--CREATE TABLE IRIS2 (species_no number, petal_width float, petal_length float, sepal_width float, sepal_length float, species_name varchar2(20)); 
--CREATE TABLE IRIS3 (species_no number, petal_width float, petal_length float, sepal_width float, sepal_length float, species_name varchar2(20)); 


DECLARE
    sp_no IRIS.species_no%TYPE;
    pw IRIS.petal_width%TYPE;
    pl IRIS.petal_length%TYPE;
    sw IRIS.sepal_width%TYPE;
    sl IRIS.sepal_length%TYPE;
    sp_name IRIS.species_name%TYPE;

BEGIN 
    for tuple in (SELECT * FROM IRIS) loop
        if tuple.species_no = 1 then
            insert into IRIS1 (species_no, petal_width, petal_length, sepal_width, sepal_length,species_name) 
                values (tuple.species_no, tuple.petal_width, tuple.petal_length, tuple.sepal_width, tuple.sepal_length, tuple.species_name);
        elsif tuple.species_no = 2 then
            insert into IRIS2@site1 (species_no, petal_width, petal_length, sepal_width, sepal_length,species_name) 
                values (tuple.species_no, tuple.petal_width, tuple.petal_length, tuple.sepal_width, tuple.sepal_length, tuple.species_name);
        elsif tuple.species_no = 3 then
            insert into IRIS3@site1 (species_no, petal_width, petal_length, sepal_width, sepal_length,species_name) 
                values (tuple.species_no, tuple.petal_width, tuple.petal_length, tuple.sepal_width, tuple.sepal_length, tuple.species_name);
        end if;
    end loop;
    commit;
END;
/