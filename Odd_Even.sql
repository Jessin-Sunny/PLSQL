SET SERVEROUTPUT ON;
DECLARE
    n number;
BEGIN
    n := &n;
    IF MOD(n,2) = 0 THEN
	dbms_output.put_line('EVEN NUMBER');
    ELSE
	dbms_output.put_line('ODD NUMBER');
    END IF;
END;
/