
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.

select "Title" 
from "Album" a 
order by "Title" ;


-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.

select "AlbumId", COUNT("TrackId")
from "Track"
group by "AlbumId"
order by COUNT("TrackId") desc 
limit 1 ;

select "AlbumId", COUNT("TrackId") as "Total_Pistas"
from "Track"
group by "AlbumId"
order by "Total_Pistas" desc 
limit 1 ;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.

select "Composer" , round(avg("Milliseconds"),2) as "Duracion_Promedio", round(stddev("Milliseconds"),2) as "Desv_Compositor", round(variance("Milliseconds"), 2) as "Varianza_Compositor"
from "Track" t 
group by "Composer";


-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.

select "Name" , "UnitPrice" 
from "Track" t 
limit 10 ;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.

select "EmployeeId", "FirstName" 
from "Employee" e 
order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.

select count(distinct "GenreId") 
from "Genre" g ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.

select "FirstName" , "Country" 
from "Customer" c 
order by "FirstName" 
limit 5 ;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.

select "Country" , count("CustomerId")
from "Customer" c 
group by "Country" ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.

select "BillingCountry" , sum("Total") as "Total_Facturado"
from "Invoice" i 
group by "BillingCountry" 
having sum("Total") > 10000;


-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.

select "Country" , sum("CustomerId") as "Total_Clientes" 
from "Customer" c 
group by "Country" 
having sum("CustomerId") > 5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
   
select "MediaTypeId", COUNT("TrackId") as "Total_Pistas"
from "Track" t
where "Milliseconds" > 250000
group by "MediaTypeId";

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.

select "Country" , count("SupportRepId")  
from "Customer" c 
where "SupportRepId" < 5
group by "Country" , "SupportRepId" ;

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
  
select "BillingPostalCode" , "Total" 
from "Invoice" i 
where "Total" > 5
group by "BillingPostalCode" , "Total" ;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.

select "MediaTypeId" , count("MediaTypeId")
from "Track" t 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000 
group by "MediaTypeId" ;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.

select "Country" , "State" , count("CustomerId") as "Total_Clientes" 
from "Customer" c 
where "SupportRepId" > 3 and "Company" is not null 
group by "Country" , "State" ;


