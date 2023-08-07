CREATE OR REPLACE FUNCTION getHighprior(
    totOne IN number,
    totTwo IN number,
    totThree IN number
)
RETURN number
IS

BEGIN
    if (totOne >= totTwo) and (totOne >= totThree) then
        return 1;
    elsif (totTwo >= totOne) and (totTwo >= totThree) then
        return 2;
    elsif (totThree >= totOne) and (totThree >= totTwo) then 
        return 3;
    else 
        return 0;
    end if;
END getHighprior;
/



