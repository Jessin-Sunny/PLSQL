SET SERVEROUTPUT ON;
DECLARE
    i number;
    s number;
    n number;
BEGIN
    n := &n;
    i := 1;
    s := 0;
    WHILE i <= n
    LOOP
	s := s + i;
	i := i + 1;
    END LOOP;
    dbms_output.put_line('Sum up to '||n||' numbers  : '||s);   
END;
/