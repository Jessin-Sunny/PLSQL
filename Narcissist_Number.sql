DECLARE
    Num number;
    digit number;
    counts number := 0;
    i number;
    temp number;
    sum_var number := 0;
BEGIN
    Num := :Num;
    temp := Num;
    WHILE temp > 0
    LOOP
        temp := FLOOR(temp/10);
        counts := counts +1;
    END LOOP;
    temp := Num;
    WHILE temp > 0
    LOOP
        digit := MOD(temp,10);
        sum_var := sum_var + POWER(digit,counts);
        temp := FLOOR(temp/10);
    END LOOP;
    IF sum_var = Num THEN
        dbms_output.put_line(Num || ' is a Narcissistic Number');
    ELSE
        dbms_output.put_line(Num || ' is not a Narcissistic Number');
    END IF;
END;
/