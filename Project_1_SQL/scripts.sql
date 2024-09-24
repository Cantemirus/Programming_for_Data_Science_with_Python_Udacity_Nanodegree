/* For Slide 1, the following script was used: */

SELECT 
    c.name AS category,
    COUNT(r.rental_id) AS total_rentals
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    c.name
ORDER BY 
    total_rentals DESC;


/* For Slide 2, the following script was used: */

SELECT DISTINCT 
    categ_name, 
    COUNT(film_title) OVER (PARTITION BY categ_name) AS categ_cnt 
FROM 
    (
        SELECT 
            f.title AS film_title, 
            c.name AS categ_name 
        FROM 
            film f 
        JOIN 
            film_category fc ON fc.film_id = f.film_id 
        JOIN 
            category c ON c.category_id = fc.category_id
    ) cte 
ORDER BY 
    categ_cnt;


/* For Slide 3, the following script was used: */

SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name, 
    COUNT(DISTINCT f.title) AS film_cnt 
FROM 
    actor a 
JOIN 
    film_actor fa ON fa.actor_id = a.actor_id 
JOIN 
    film f ON fa.film_id = f.film_id 
GROUP BY 
    actor_name 
ORDER BY 
    film_cnt DESC 
LIMIT 10;


/* For Slide 4, the following script was used: */

SELECT 
    co.country, 
    COUNT(DISTINCT cu.first_name) AS customer_cnt 
FROM 
    customer cu 
JOIN 
    address ad ON ad.address_id = cu.address_id 
JOIN 
    city cy ON cy.city_id = ad.city_id 
JOIN 
    country co ON cy.country_id = co.country_id 
GROUP BY 
    co.country 
ORDER BY 
    customer_cnt DESC 
LIMIT 10;

