
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

select t."Name" , a."Title" 
from "Track" t 
inner join "Album" a 
	on t."AlbumId" = a."AlbumId" ;


-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

select a2."Name" , a."Title" 
from "Album" a 
inner join "Artist" a2 
	on a."ArtistId" = a2."ArtistId" 
order by a2."Name" ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 

select c."FirstName" , sum(i."Total") 
from "Invoice" i
left join "Customer" c
	on i."CustomerId" =i."CustomerId" 
group by c."FirstName" 
order by sum(i."Total") 
limit 5 ;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

select 
concat( c."FirstName" , ' ' , c."LastName" ) as "Nombre_Cliente" ,
concat( e."FirstName" , ' ' , e."LastName" ) as "Empleado_Asignado" 
from "Customer" c 
left join "Employee" e 
	on c."SupportRepId" = e."EmployeeId" ;

select 
concat( c."FirstName" , ' ' , c."LastName" ) as "Nombre_Cliente" ,
concat( e."FirstName" , ' ' , e."LastName" ) as "Empleado_Asignado" 
from "Employee" e 
right join  "Customer" c
	on c."SupportRepId" = e."EmployeeId" ;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

select il."InvoiceId" , t."Name" 
from "InvoiceLine" il 
right join "Track" t 
	on il."TrackId" = t."TrackId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.



--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

select t."Name" , mt."Name" 
from "Track" t 
left join "MediaType" mt 
	on t."MediaTypeId" = mt."MediaTypeId" ;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

select t."Name" , g."Name" 
from "Track" t 
full join "Genre" g 
	on t."GenreId" =g."GenreId" ;
	

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

select 
	concat( c."FirstName" , ' ' , c."LastName" ) as "Nombre_Cliente" , i."InvoiceDate" 
from "Customer" c 
full join "Invoice" i 
	on c."CustomerId" = i."CustomerId" ;
	

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

select a."Title" as "Album", a2."Name" as "Artista"
from "Album" a 
inner join "Artist" a2 
	on a."ArtistId" = a2."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

select g."Name" , sum(t."TrackId") as "Canciones_Totales"
from "Genre" g 
left join "Track" t 
	on g."GenreId" = t."TrackId" 
group  by g."Name" 
order by sum(t."TrackId") desc ;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

select a."Title" , sum(t."TrackId") as "Duracion_Total"
from "Album" a 
left join "Track" t 
	on a."AlbumId" = t."AlbumId" 
group by a."Title" ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

select c."FirstName" as "Nombre_Cliente", sum(i."Total") as "Total_Facturas"
from "Customer" c 
inner join "Invoice" i 
	on c."CustomerId" = i."CustomerId" 
group by c."CustomerId" ;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.

select e."FirstName" as "Nombre_Empleado", c."FirstName" as "Cliente_Asignado"
from "Employee" e 
full join "Customer" c 
	on e."EmployeeId" = c."SupportRepId" ;



