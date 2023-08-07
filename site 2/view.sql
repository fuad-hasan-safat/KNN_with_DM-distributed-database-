DROP VIEW data;
CREATE or REPLACE VIEW data AS  
SELECT * FROM 
(select * from IRIS1 UNION 
select * from IRIS2@site1 UNION 
select * from IRIS3@site1);



--select * from data;