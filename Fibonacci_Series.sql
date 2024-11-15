SET SERVEROUTPUT ON;
DECLARE
    n1 number := 0;
    n2 number := 1;
    n3 number;
    N number;
    i number;
BEGIN
    N := &N;
    dbms_output.put_line('Fibonacci Series of '||N||' numbers ');
    dbms_output.put_line(n1);
    dbms_output.put_line(n2);
    FOR i IN 3..N
    LOOP
        n3 := n1 + n2;
        dbms_output.put_line(n3);
        n1 := n2;
        n2 := n3;
    END LOOP;
END;
/
