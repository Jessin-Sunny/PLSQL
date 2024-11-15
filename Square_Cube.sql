/*
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE SQUARES(Numbers INT PRIMARY KEY)';
    EXECUTE IMMEDIATE 'CREATE TABLE CUBES(Numbers INT PRIMARY KEY)';
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SQUARES';
    EXECUTE IMMEDIATE 'DROP TABLE CUBES';
END;
*/
DECLARE
    n number;
    i number;
    j number;
    sqr number;
    cbe number;
    snum number;
    cnum number;
    CURSOR c_cursor IS SELECT NUMBERS FROM CUBES;
    CURSOR S_cursor IS SELECT NUMBERS FROM SQUARES;
BEGIN
    n := :n;
    FOR i IN 0..n
    LOOP
        cbe := 0;
        sqr := 0;
        FOR j IN 0..CEIL(i/2)
        LOOP
        IF j*j = i THEN
            sqr := 1;
        END IF;
        IF j*j*j = i THEN
            cbe := 1;
        END IF;
        END LOOP;
        IF sqr = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO SQUARES VALUES(:i)' USING i;
        END IF;
        IF cbe = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO CUBES VALUES(:i)' USING i;
        END IF;
    END LOOP;
    dbms_output.put_line('Square Numbers');
    OPEN s_cursor;
    LOOP
        FETCH s_cursor INTO snum;
        EXIT WHEN s_cursor%NOTFOUND;
        dbms_output.put_line(snum);
    END LOOP;
    CLOSE s_cursor;
    dbms_output.put_line('Cube Numbers');
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO cnum;
        EXIT WHEN c_cursor%NOTFOUND;
        dbms_output.put_line(cnum);
    END LOOP;
    CLOSE c_cursor;
END;