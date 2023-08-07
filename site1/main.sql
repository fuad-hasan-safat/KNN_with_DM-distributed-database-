SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;
@C:\Users\fuads\Desktop\final\Project\function.sql;
@C:\Users\fuads\Desktop\final\Project\procedure.sql;
@C:\Users\fuads\Desktop\final\Project\Temp_table.sql;
@C:\Users\fuads\Desktop\final\Project\view.sql;
@C:\Users\fuads\Desktop\final\Project\package.sql;
@C:\Users\fuads\Desktop\final\Project\trigger.sql;


ACCEPT X PROMPT 'Enter K: '
ACCEPT Y PROMPT 'Enter petal_width: '
ACCEPT Z PROMPT 'Enter petal_length: '
ACCEPT A PROMPT 'Enter sepal_width: '
ACCEPT B PROMPT 'Enter sepal_width: '
DECLARE
    k VARCHAR2(10) := '&X';
	pw VARCHAR2(10) := '&Y';
	pl VARCHAR2(10)  := '&Z';
    sw VARCHAR2(10) := '&A';
	sl VARCHAR2(10)  := '&B';

    kn number ;
	pwn number ;
	pln number ;
    swn number ;
	sln number ;

    res number;
    invalidk exception;
    emptyv exception;

BEGIN
   
    res :=0;
    kn := TO_NUMBER(k, '9999.99');
    if not REGEXP_LIKE(kn, '^[[:digit:]]+$') then
      raise invalidk;
    end if;
    pwn := TO_NUMBER(pw, '9999.99');
    pln := TO_NUMBER(pl, '9999.99');
    swn := TO_NUMBER(sw, '9999.99');
    sln := TO_NUMBER(sl, '9999.99');

    if pwn is NULL OR pln is NULL OR swn is NULL OR sln is NULL then
        raise emptyv;
    end if;

    res := prediction.KNN(kn, pwn, pln, swn, sln);
    prediction.printPrediction(res);

EXCEPTION 
    when invalidk then 
        dbms_output.put_line('!!!!!!!! Value of K should be integer !!!!!!!!');
        kn := TRUNC(kn);
        dbms_output.put_line('converted value of K: '|| kn);
        res := prediction.KNN(kn, pwn, pln, swn, sln);
        prediction.printPrediction(res);
    when emptyv then 
        dbms_output.put_line('!!!!!!! Values should be float or integer !!!!!!!!');
    when VALUE_ERROR  then 
        dbms_output.put_line('!!!!!!!! Input should be float or integer !!!!!!!!');
    WHEN OTHERS THEN
      dbms_output.put_line('!!!!!!!! Some other kind of error occurred !!!!!!!!');
    
    
END;
/



