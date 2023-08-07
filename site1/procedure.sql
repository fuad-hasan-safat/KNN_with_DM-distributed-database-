CREATE OR REPLACE PROCEDURE findMin(
    minmum IN OUT float,
    slno IN OUT number
)
IS

BEGIN
    for tuple in (select * from TEMP) loop
        if tuple.result < minmum then
            minmum := tuple.result;
            slno := tuple.sr_no;
        end if;
    end loop;
END findMin;
/


