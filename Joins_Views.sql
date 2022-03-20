--JOINS


    SELECT 
        c.customer_id,c.name,o.order_date,o.status
    FROM
        customers c
    JOIN
        orders o
    ON
        c.customer_id=o.customer_id
    ORDER BY
        order_date;
        


    SELECT 
        p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
    FROM
        products p
    JOIN
        order_items o
    ON
        p.product_id=o.product_id
    JOIN
        inventories i
    ON
        p.product_id=i.product_id
    ORDER BY
        p.product_id;
    

--RIGHT JOIN


    SELECT 
        c.customer_id,c.name,o.order_date,o.status
    FROM
        customers c
    RIGHT JOIN
        orders o
    ON
        c.customer_id=o.customer_id
    ORDER BY
        order_date;




    SELECT 
        p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
    FROM
        products p
    RIGHT JOIN
        order_items o
    ON
        p.product_id=o.product_id
    RIGHT JOIN
        inventories i
    ON
        p.product_id=i.product_id
    ORDER BY
        p.product_id;
        

--LEFT JOIN


    SELECT 
        c.customer_id,c.name,o.order_date,o.status
    FROM
        customers c
    LEFT JOIN
        orders o
    ON
        c.customer_id=o.customer_id
    ORDER BY
        order_date;



    SELECT 
        p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
    FROM
        products p
    LEFT JOIN
        order_items o
    ON
        p.product_id=o.product_id
    LEFT JOIN
        inventories i
    ON
        p.product_id=i.product_id
    ORDER BY
        p.product_id;
      

--FULL OUTER JOIN


    SELECT 
        c.customer_id,c.name,o.order_date,o.status
    FROM
        customers c
    FULL OUTER JOIN
        orders o
    ON
        c.customer_id=o.customer_id
    ORDER BY
        order_date;


    SELECT 
        p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
    FROM
        products p
    FULL OUTER JOIN
        order_items o
    ON
        p.product_id=o.product_id
    LEFT JOIN
        inventories i
    ON
        p.product_id=i.product_id
    ORDER BY
        p.product_id;
  
    

--SELF JOIN


    SELECT 
        e1.employee_id,e1.first_name,e1.email,e2.manager_id
    FROM
        employees e1
    JOIN 
        employees e2
    ON
        e1.employee_id=e2.manager_id


    

--CROSS JOIN


    SELECT 
        c.customer_id,c.name,o.order_date,o.status
    FROM
        customers c
    CROSS JOIN
        orders o
    ORDER BY
        order_date;
        


    SELECT 
        p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
    FROM
        products p
    CROSS JOIN
        order_items o, inventories i
    ORDER BY
        p.product_id;
  




    SELECT
        product_name,
        list_price
    FROM
        products
    WHERE
        list_price > ANY(
            2200,
            2259.99,
            2269.99
        )
        AND category_id = 1
    ORDER BY
        list_price DESC;
    

--ALL


    SELECT
        product_name,
        list_price
    FROM
        products
    WHERE
        list_price <= ALL(
            977.99,
            1000,
            2200
        )
        AND category_id = 1
    ORDER BY
        list_price DESC;
        


    SELECT
        product_name,
        list_price
    FROM
        products
    WHERE
        list_price >= ALL(
            1000,
            1500,
            2200
        )
        AND category_id = 1


-- VIEWS



    SELECT
        *
    FROM
        (
            SELECT
                name,
                credit_limit
            FROM
                customers
        );  
    
--Query returns sales amount by the customer by year
    SELECT
        name AS customer,
        SUM( quantity * unit_price ) sales_amount,
        EXTRACT(
            YEAR
        FROM
            order_date
        ) YEAR
    FROM
        orders
    INNER JOIN order_items
            USING(order_id)
    INNER JOIN customers
            USING(customer_id)
    WHERE
        status = 'Shipped'
    GROUP BY
        name,
        EXTRACT(
            YEAR
        FROM
            order_date
        );
 
    CREATE OR REPLACE VIEW customer_sales AS 
    SELECT
        name AS customer,
        SUM( quantity * unit_price ) sales_amount,
        EXTRACT(
            YEAR
        FROM
            order_date
        ) YEAR
    FROM
        orders
    INNER JOIN order_items
            USING(order_id)
    INNER JOIN customers
            USING(customer_id)
    WHERE
        status = 'Shipped'
    GROUP BY
        name,
        EXTRACT(
            YEAR
        FROM
            order_date
        );
        
    --Retrieve the sales by the customer in 2017
    SELECT
        customer,
        sales_amount
    FROM
        customer_sales
    WHERE
        YEAR = 2017
    ORDER BY
        sales_amount DESC;
    

--View shows the employee id, name and years of service
    CREATE VIEW employee_yos AS
    SELECT
        employee_id,
        first_name || ' ' || last_name full_name,
        FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ) yos
    FROM
        employees;

    --
    CREATE VIEW employee_yos (employee_id, full_name, yos) AS
    SELECT
        employee_id,
        first_name || ' ' || last_name,
        FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 )
    FROM
        employees;

    SELECT
        *
    FROM
        employee_yos
    WHERE
        yos = 15
    ORDER BY
        full_name; 


        CREATE OR REPLACE VIEW customer_credits(
            customer_id,
            name,
            credit
        ) AS 
    SELECT
            customer_id,
            name,
            credit_limit
        FROM
            customers WITH READ ONLY;

        CREATE OR REPLACE VIEW backlogs AS
    SELECT
        product_name,
        EXTRACT(
            YEAR
        FROM
            order_date
        ) YEAR,
        SUM( quantity * unit_price ) amount
    FROM
        orders
    INNER JOIN order_items
            USING(order_id)
    INNER JOIN products
            USING(product_id)
    WHERE
        status = 'Pending'
    GROUP BY
        EXTRACT(
            YEAR
        FROM
            order_date
        ),
        product_name;

    CREATE VIEW vw_emp
        AS
                SELECT
                    empno,ename,job,mgr,hiredate,sal,comm,deptno
                FROM
                    emp;

    SELECT * FROM vw_emp;