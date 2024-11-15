/*
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE PRIME(Numbers INT PRIMARY KEY)';
    EXECUTE IMMEDIATE 'CREATE TABLE COMPOSITE(Numbers INT PRIMARY KEY)';
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PRIME';
    EXECUTE IMMEDIATE 'DROP TABLE COMPOSITE';
END;
*/
DECLARE
    n number;
    i number;
    j number;
    p number;
    pnum number;
    cnum number;
    CURSOR c_cursor IS SELECT NUMBERS FROM COMPOSITE;
    CURSOR p_cursor IS SELECT NUMBERS FROM PRIME;
BEGIN
    n := :n;
    FOR i IN 2..n
    LOOP
        p := 1;
        FOR j IN 2..FLOOR(i/2)
        LOOP
        IF MOD(i,j) = 0 THEN
            p := 0;
            EXIT;
        END IF;
        END LOOP;
        IF p = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO PRIME VALUES(:i)' USING i;
        ELSE
            EXECUTE IMMEDIATE 'INSERT INTO COMPOSITE VALUES(:i)' USING i;
        END IF;
    END LOOP;
    dbms_output.put_line('Prime Numbers');
    OPEN p_cursor;
    LOOP
        FETCH p_cursor INTO pnum;
        EXIT WHEN p_cursor%NOTFOUND;
        dbms_output.put_line(pnum);
    END LOOP;
    CLOSE p_cursor;
    dbms_output.put_line('Composite Numbers');
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO cnum;
        EXIT WHEN c_cursor%NOTFOUND;
        dbms_output.put_line(cnum);
    END LOOP;
    CLOSE c_cursor;
END;
