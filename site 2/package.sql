SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE prediction AS

	FUNCTION KNN(
        k IN number, 
        pw IN IRIS.petal_width%TYPE,
        pl IN IRIS.petal_length%TYPE,
        sw IN IRIS.sepal_width%TYPE,
        sl IN IRIS.sepal_width%TYPE
    )
	RETURN number;
	
	PROCEDURE printPrediction(predictvalue number);
END prediction;
/


CREATE OR REPLACE PACKAGE BODY prediction AS

	FUNCTION KNN(
        k IN number, 
        pw IN IRIS.petal_width%TYPE,
        pl IN IRIS.petal_length%TYPE,
        sw IN IRIS.sepal_width%TYPE,
        sl IN IRIS.sepal_width%TYPE
    )
	RETURN number
	IS
        pws IRIS.petal_width%TYPE;
        pls IRIS.petal_length%TYPE;
        sws IRIS.sepal_width%TYPE;
        sls IRIS.sepal_width%TYPE;

        slno number;
        res float;
        srtres float;
        totOne number;
        totTwo number;
        totThree number;
        minmum float;
        predictvalue number;


	BEGIN
        slno := 1;
        totOne := 0;
        totTwo := 0;
        totThree := 0;

        for tuple in (select * from data) loop
            pws := POWER((tuple.petal_width - pw), 2);
            pls := POWER((tuple.petal_length - pl), 2);
            sws := POWER((tuple.sepal_width - sw), 2);
            sls := POWER((tuple.sepal_length - sl), 2);
            res := pws+pls+sws+sls;
            srtres := SQRT(res);
            insert into TEMP (sr_no, species_no, result, species_name) values (slno, tuple.species_no, srtres, tuple.species_name);
            slno := slno + 1;
        end loop;
        

        for i in 1..k loop
            slno := 0;
            minmum := 9999.0;
            findMin(minmum, slno);
            if slno != 0 then
                select TEMP.species_no into  res from TEMP where TEMP.sr_no = slno;

                if res = 1 then
                    totOne := totOne+1;
                elsif res = 2 then
                    totTwo := totTwo+1;
                elsif res = 3 then
                    totThree := totThree+1;
                end if;
                
                delete from TEMP where TEMP.sr_no = slno;
            end if;
        end loop;
        

        predictvalue := getHighprior(totOne, totTwo, totThree);
        --dbms_output.put_line('predict ' || predictvalue);
        return predictvalue;

		
	END KNN;
	
	PROCEDURE printPrediction(predictvalue number)
	IS
	
	BEGIN
        if predictvalue = 1 then
            dbms_output.put_line('Setosa');
        elsif predictvalue = 2 then
            dbms_output.put_line('Versicolor');
        elsif predictvalue = 3 then
            dbms_output.put_line('Verginica');
        end if;
		
	END printPrediction;
	
END prediction;
/
