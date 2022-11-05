create schema course_1t_data_engineer

/*2. Для будущих отчетов аналитики попросили вас создать еще одну таблицу с информацией по отделам – 
в таблице должен быть идентификатор для каждого отдела, название отдела (например. Бухгалтерский или IT отдел),
ФИО руководителя и количество сотрудников.
*/
create table course_1t_data_engineer.department(
	department_id serial primary key,
	department_name varchar(50) not null unique,
	director_last_name varchar(50) not null,
	director_first_name varchar(50) not null,
	director_patronymic varchar(50) not null,
	staff_number int not null
)

/*1. Создать таблицу с основной информацией о сотрудниках: ФИО, дата рождения, дата начала работы,
должность, уровень сотрудника (jun, middle, senior, lead), уровень зарплаты, идентификатор отдела,
наличие/отсутствие прав(True/False). При этом в таблице обязательно должен быть уникальный номер
для каждого сотрудника.
*/
create table course_1t_data_engineer.staff(
	staff_id serial primary key,
	last_name varchar(50) not null,
	first_name varchar(50) not null,
	patronymic varchar(50) not null,
	birthday date not null,
	start_date date not null,
	"position" varchar(50) not null,
	staff_level varchar(50) not null,
	salary_level int not null,
	department_id int references course_1t_data_engineer.department(department_id),
	"access" boolean not null
	CHECK (staff_level in('jun', 'middle', 'senior', 'lead'))
)

 /*3. На кону конец года и необходимо выплачивать сотрудникам премию.
 Премия будет выплачиваться по совокупным оценкам, которые сотрудники получают в каждом квартале года.
 Создайте таблицу, в которой для каждого сотрудника будут его оценки за каждый квартал.
 Диапазон оценок от A – самая высокая, до E – самая низкая.
 */
create table course_1t_data_engineer.staff_rating(
	id serial primary key,
	staff_id int references course_1t_data_engineer.staff(staff_id),
	yyyy varchar(4) NOT NULL,
	Q1 varchar(1),
	Q2 varchar(1),
	Q3 varchar(1),
	Q4 varchar(1)
	CHECK (Q1 in('A', 'B', 'C', 'D', 'E'))
	CHECK (Q2 in('A', 'B', 'C', 'D', 'E'))
	CHECK (Q3 in('A', 'B', 'C', 'D', 'E'))
	CHECK (Q4 in('A', 'B', 'C', 'D', 'E'))
)

/*4. Несколько уточнений по предыдущим заданиям – в первой таблице должны быть записи как минимум о 5 сотрудниках,
которые работают как минимум в 2-х разных отделах. Содержимое соответствующих атрибутов остается на совесть вашей фантазии,
но, желательно соблюдать осмысленность и правильно выбирать типы данных (для зарплаты – числовой тип, для ФИО – строковый и т.д.)
*/
insert into course_1t_data_engineer.department
	(department_name, director_last_name, director_first_name, director_patronymic,staff_number)
values
	('Accounting department','Иванова','Ольга','Ивановна',2),
	('IT Department','Иванов','Иван','Иванович',3)

insert into course_1t_data_engineer.staff
	(last_name,	first_name,	patronymic,	birthday, start_date, "position", staff_level, salary_level, department_id, "access")
values
	('Иванова','Ольга','Ивановна','1990-01-01','2021-12-01','Начальник отдела','lead',1000000,1,True),
	('Петрова','Екатерина','Петровна','1992-02-06','2022-01-01','Главный бухгалтер','senior',150000,1,True),
	('Иванов','Иван','Иванович','1991-01-01','2022-04-05','Начальник отдела','lead',10000000,2,True),
	('Петров','Петр','Петрович','1997-06-12','2021-11-23','Инженер','jun',100000,2,True),
	('Александров','Александр','Александрович','1994-06-28','2022-02-21','Ведущий Инженер','middle',130000,2,True)
	
insert into course_1t_data_engineer.staff_rating
	(staff_id, yyyy, Q1, Q2, Q3, Q4)
values
	(1,'2022','A','C','B','B'),
	(2,'2022','D','C','C','B'),
	(3,'2022','A','A','A','A'),
	(4,'2022','B','B','A','C'),
	(5,'2022','E','D','D','D')



/*5. Ваша команда расширяется и руководство запланировало открыть новый отдел – отдел Интеллектуального анализа данных.
На начальном этапе в команду наняли одного руководителя отдела и двух сотрудников. Добавьте необходимую информацию в соответствующие таблицы.
*/
insert into course_1t_data_engineer.department
	(department_name, director_last_name, director_first_name, director_patronymic,staff_number)
values
	('Data Mining Department','Евгеньев','Евгений','Евгеньевич',3)
	
insert into 
	course_1t_data_engineer.staff
	(last_name,	first_name,	patronymic,	birthday, start_date, "position", staff_level, salary_level, department_id, "access")
values
	('Евгеньев','Евгений','Евгеньевич','1995-12-11','2022-10-01','Начальник отдела','lead',1000000,3,True),	
	('Евгеньев','Александр','Петрович','1992-02-06','2022-10-5','Главный инженер','senior',150000,3,True),
	('Иванов','Евгений','Евгеньевич','1991-01-01','2022-10-07','Инженер','jun',100000,3,True)

insert into course_1t_data_engineer.staff_rating
	(staff_id, yyyy, Q1, Q2, Q3, Q4)
values	
	(6, '2022', null, null, null,'B'),
	(7, '2022', null, null, null,'B'),
	(8, '2022', null, null, null,'A')


/*6. Теперь пришла пора анализировать наши данные – напишите запросы для получения следующей информации:
Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании
*/
select s.staff_id "ID сотрудника",
	concat_ws(' ' , s.last_name, s.first_name, s.patronymic)  "ФИО сотрудника",
	(now()::date - s.start_date::date) ||' '|| 'дней' "Стаж работы" 	
from course_1t_data_engineer.staff s 

--Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников
select s.staff_id "ID сотрудника",
	concat_ws(' ' , s.last_name, s.first_name, s.patronymic)  "ФИО сотрудника",
	(now()::date - s.start_date::date) "Стаж работы в днях" 	
from course_1t_data_engineer.staff s 
order by "Стаж работы" desc 
limit 3

--Уникальный номер сотрудников - водителей !!!Заменил на инженеров!!!
select s.staff_id "ID сотрудника"
from course_1t_data_engineer.staff s 
where s."position" = 'Инженер'


--Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E
select sr.staff_id "ID сотрудника"
from course_1t_data_engineer.staff_rating sr  
where q1 in ('D','E') or q2 in ('D','E') or q3 in ('D','E') or q4 in ('D','E')


--Выведите самую высокую зарплату в компании.
select max(s.salary_level)
from course_1t_data_engineer.staff s