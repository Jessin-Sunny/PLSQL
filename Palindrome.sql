DECLARE
    Str VARCHAR(50);
    i number := 1;
    r number;
    p number := 1;
BEGIN
    Str := :Str;
    r := LENGTH(Str);
    WHILE i < r
    LOOP
        IF SUBSTR(Str,i,1) != SUBSTR(Str,r,1) THEN
            p := 0;
            EXIT;
        END IF;
        i := i + 1;
        r := r-1;
    END LOOP;
    IF p = 1 THEN
        dbms_output.put_line(Str || ' is Palindrome');
    ELSE
        dbms_output.put_line(Str || ' is not Palindrome');
    END IF;
END;
/