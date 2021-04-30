use universidad;
-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:
-- 1
select apellido1, apellido2, nombre from persona order by apellido1, apellido2, nombre;
-- 2
select nombre, apellido1, apellido2 from persona where telefono is null;
-- 3
select * from persona where fecha_nacimiento between '1999/01/01' and '1999/12/31';
-- 4
select * from persona where tipo = 'profesor' and telefono is null and nif like '%k';
-- 5
select * from grado g left join asignatura a on g.id = a.id_grado where g.id = 7 and cuatrimestre = 1 and curso = 3;
-- 6
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p left join profesor pr on p.id = pr.id_profesor left join departamento d on pr.id_departamento = d.id order by p.apellido1, p.apellido2, p.nombre;
-- 7
select a.nombre, c.anyo_inicio, c.anyo_fin from persona p left join alumno_se_matricula_asignatura m on p.id = m.id_alumno left join asignatura a on m.id_asignatura = a.id left join curso_escolar c on m.id_curso_escolar = c.id where nif = '26902806M';
-- 8
select distinct d.nombre from grado g left join asignatura a on g.id = a.id_grado left join profesor p on a.id_profesor = p.id_profesor left join departamento d on p.id_departamento = d.id where g.id = 4;
-- 9
select distinct p.nif, p.apellido1, p.apellido2, p.nombre from persona p left join alumno_se_matricula_asignatura m on p.id = m.id_alumno left join curso_escolar c on m.id_curso_escolar = c.id where c.anyo_inicio = 2018 and c.anyo_fin; /*  de este modo, y en vez de utilizar el id = 5, si hubiese alguna asignatura con matrícula bianual quedaría fuera del filtro  */

-- Consultes resum:
-- 1
select count(id) from persona where tipo = 'alumno';
-- 2
select count(id) from persona where tipo = 'alumno' and fecha_nacimiento like '1999%';
 -- 3
select d.nombre, count(p.id_profesor) from profesor p right join departamento d on p.id_departamento = d.id where p.id_profesor is not null group by d.nombre order by count(p.id_profesor) desc;
-- 4
select d.nombre, count(p.id_profesor) from profesor p right join departamento d on p.id_departamento = d.id group by d.nombre order by count(p.id_profesor) desc;
-- 5
select g.nombre, count(a.id) from asignatura a right join grado g on a.id_grado = g.id group by g.nombre order by count(a.id) desc;
-- 6
select g.nombre, count(a.id) from asignatura a right join grado g on a.id_grado = g.id group by g.nombre having count(a.id) > 40 order by count(a.id) desc;
-- 7
select g.nombre, a.tipo, sum(a.creditos) from asignatura a left join grado g on a.id_grado = g.id group by a.tipo, g.nombre;
-- 8
select c.anyo_inicio, count(a.id_alumno) from alumno_se_matricula_asignatura a left join curso_escolar c on a.id_curso_escolar = c.id group by c.anyo_inicio;
-- 9
select p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, count(a.id) from profesor p left join asignatura a on p.id_profesor = a.id_profesor left join persona pe on p.id_profesor = pe.id group by p.id_profesor order by count(a.id) desc;
-- 10
select * from persona where tipo = 'alumno' having max(fecha_nacimiento);
-- 11
select pe.nombre, pe.apellido1, pe.apellido2 from profesor p left join asignatura a on p.id_profesor = a.id_profesor left join persona pe on p.id_profesor = pe.id where a.id is null;

use tienda;
-- 1
select producto.nombre from producto;
-- 2
select p.nombre, p.precio from producto p;
-- 3
select * from producto;
-- 6
select upper(p.nombre), p.precio from producto p;
-- 7
select lower(p.nombre), p.precio from producto p;
-- 8
select *, upper(substring(nombre, 1,2)) from fabricante;
-- 9
select nombre, round(precio) from producto;
-- 10
select nombre, truncate(precio, 0) from producto;
-- 11
select distinct f.nombre from producto p
left join fabricante f 	on p.codigo_fabricante = f.codigo;
-- 12
select distinct f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo;
-- 13
select * from fabricante order by nombre asc;
-- 14
select * from fabricante order by nombre desc;
-- 15
select nombre from producto order by nombre asc;
select nombre from producto order by nombre desc;
-- 16
select * from fabricante limit 5;
-- 17
select * from fabricante limit 3, 2;
-- 18
select nombre, precio from producto order by precio limit 1;
-- 19
select nombre, precio from producto order by precio desc limit 1;
-- 20
select nombre from producto where codigo_fabricante = 2;
-- 21
select p.nombre, p.precio, f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo;
-- 22
select p.nombre, p.precio, f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre;
-- 23
select p.codigo, p.nombre, f.codigo, f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre;
-- 24
select p.nombre, p.precio, f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo order by p.precio asc limit 1;
-- 25
select p.nombre, p.precio, f.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo order by p.precio desc limit 1;
-- 26
select p.nombre from producto p left join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = 'lenovo';
-- 27
select p.nombre, p.precio from producto p left join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = 'crucial' and p.precio > 200;
