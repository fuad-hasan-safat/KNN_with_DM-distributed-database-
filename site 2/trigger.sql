SET SERVEROUTPUT ON;
--DROP TRIGGER SAVEDATA; 
CREATE OR REPLACE TRIGGER SAVEDATA 
AFTER DELETE 
ON TEMP
FOR EACH ROW
DECLARE
BEGIN
	insert into KTABLE (sr_no, species_no, result, species_name) values (:OLD.sr_no, :OLD.species_no, :OLD.result, :OLD.species_name);
END;
/

