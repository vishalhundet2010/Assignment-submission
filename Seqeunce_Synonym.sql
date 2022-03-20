-- #SEQUENCE  
    CREATE SEQUENCE item_seq;
        
    SELECT item_seq.NEXTVAL
    FROM dual;

    SELECT item_seq.CURRVAL
    FROM dual;


    SELECT item_seq.NEXTVAL
    FROM   dual
    CONNECT BY level <= 5;


    CREATE TABLE items(
        item_id NUMBER
    );

    INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);
    INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);

    COMMIT;

    SELECT item_id FROM items;


    DECLARE
        v_seq NUMBER;
    BEGIN
        v_seq  := item_seq.NEXTVAL;
        DBMS_OUTPUT.put_line('v_seq=' || v_seq);
    END;


    ALTER SEQUENCE item_seq MAXVALUE 100;

    DROP SEQUENCE item_seq;

    CREATE SEQUENCE id_seq
        INCREMENT BY 10
        START WITH 10
        MINVALUE 10
        MAXVALUE 100
        CYCLE
        CACHE 2;
        
    SELECT 
        id_seq.NEXTVAL 
    FROM 
        dual;

    SELECT 
        id_seq.CURRVAL 
    FROM 
        dual;


    SELECT 
        id_seq.NEXTVAL 
    FROM 
        dual
    CONNECT BY level <= 9;


    SELECT id_seq.NEXTVAL FROM dual;


    CREATE TABLE tasks(
        id NUMBER PRIMARY KEY,
        title VARCHAR2(255) NOT NULL
    );



    CREATE SEQUENCE task_id_seq;


    INSERT INTO tasks(id, title)
    VALUES(task_id_seq.NEXTVAL, 'Create Sequence in Oracle');

    INSERT INTO tasks(id, title)
    VALUES(task_id_seq.NEXTVAL, 'Examine Sequence Values');


    SELECT  
        id, title
    FROM
        tasks;

    DROP TABLE tasks;

    CREATE TABLE tasks(
        id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        title VARCHAR2(255) NOT NULL
    );


    SELECT 
        a.name AS table_name,
        b.name AS sequence_name
    FROM   
        sys.idnseq$ c
        JOIN obj$ a ON c.obj# = a.obj#
        JOIN obj$ b ON c.seqobj# = b.obj#
    WHERE 
        a.name = 'TASKS';  


    INSERT INTO tasks(title)
    VALUES('Learn Oracle identity column ');

    INSERT INTO tasks(title)
    VALUES('Verify contents of the TT tasks table');


    SELECT
        id, title
    FROM
        tasks;


    DROP SEQUENCE schema_name.sequence_name;

    CREATE SEQUENCE schema_name.sequence_name
        START WITH new_value;
        
        
    CREATE SEQUENCE invoice_seq
        START WITH 20190001;


    ALTER SEQUENCE invoice_seq
    CACHE 10;


    DROP SEQUENCE invoice_seq;


    CREATE SEQUENCE invoice_seq
        START WITH 20200001
        CACHE 10;


    DROP SEQUENCE schema_name.sequence_name;


    CREATE SEQUENCE no_seq;


    DROP SEQUENCE no_seq;


    CREATE SYNONYM stocks
    FOR inventories;


    CREATE PUBLIC SYNONYM sales 
    FOR lion.sales; 


    DROP SYNONYM stocks;
