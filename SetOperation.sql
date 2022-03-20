--Assignment02
-- Display list of contacts from Employee and Contacts
    SELECT
        first_name,
        last_name,
        email,
        'contact'
    FROM
        contacts
    UNION SELECT
        first_name,
        last_name,
        email,
        'employee'
    FROM
        employees;




-- Display unique last name of employees and contacts
    SELECT
        last_name
    FROM
        employees
    UNION SELECT
        last_name
    FROM
        contacts
    ORDER BY
        last_name;

-- With UNION ALL

    SELECT
        last_name
    FROM
        employees
    UNION ALL SELECT
        last_name
    FROM
        contacts
    ORDER BY
        last_name;


-- get the last names used by people in both contacts and employees tables

    SELECT
        last_name
    FROM
        contacts
    INTERSECT 
    SELECT
        last_name
    FROM
        employees
    ORDER BY
        last_name;


-- Returns distinct last names from the the left table which are not found in right table
    SELECT
        last_name
    FROM
        contacts
    MINUS
    SELECT
        last_name
    FROM
        employees
    ORDER BY
        last_name;

-- List of product id from the product table but doesnt exist in inventories table
    SELECT
        product_id
    FROM
        products
    WHERE
        product_id NOT IN
        (SELECT
            product_id
        FROM
            inventory);

