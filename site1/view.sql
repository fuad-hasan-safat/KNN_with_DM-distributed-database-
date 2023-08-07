DROP VIEW data;
CREATE or REPLACE VIEW data AS  
SELECT * FROM 
(select * from IRIS1@site2 UNION 
select * from IRIS2 UNION 
select * from IRIS3);



--select * from data;