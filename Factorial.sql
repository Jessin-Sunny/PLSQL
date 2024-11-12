SET SERVEROUTPUT ON;
DECLARE
    n number;
    i number;
    facts number;
BEGIN
    facts := 1;
    n := &n;
    FOR i in 1..n
    LOOP
	facts := facts * i;
    END LOOP;
    dbms_output.put_line('Factorial of '||n||' : '||facts);
END;
/