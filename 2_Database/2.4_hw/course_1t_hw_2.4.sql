/* 1. Чтобы успешно справиться с данным практическим заданием, вам необходимо выполнить как минимум задания 1-4 
практики в теме 2.3 "Реляционные базы данных: PostgreSQL", но желательно сделать, конечно же, все.
*/

/*2. Теперь мы знакомы с гораздо большим перечнем операторов языка SQL и это дает нам 
дополнительные возможности для анализа данных. Выполните следующие запросы:
*/

--a.Попробуйте вывести не просто самую высокую зарплату во всей команде, а вывести именно фамилию сотрудника с самой высокой зарплатой.
select s.last_name "Фамилия"
from course_1t_data_engineer.staff s
order by s.salary_level desc 
limit 1

--b.Попробуйте вывести фамилии сотрудников в алфавитном порядке
select s.last_name "Фамилия"
from course_1t_data_engineer.staff s
order by s.last_name 

--c.Рассчитайте средний стаж для каждого уровня сотрудников
select s.staff_level "Уровень сотрудника", avg(now()::date - s.start_date::date) "Средний стаж"
from  course_1t_data_engineer.staff s
group by s.staff_level 

--d.Выведите фамилию сотрудника и название отдела, в котором он работает
select s.last_name "Фамилия", d.department_name "Название отдела"
from course_1t_data_engineer.staff s
join department d ON s.department_id = d.department_id 

--e.Выведите название отдела и фамилию сотрудника с самой высокой зарплатой в данном отделе и саму зарплату также.
select d.department_name "Название отдела", t.last_name "Фамилия", t.salary_level
from (select s.department_id, last_name, s.salary_level,
		rank() OVER (PARTITION BY s.department_id ORDER BY s.salary_level DESC)
	from course_1t_data_engineer.staff s) as t
join department d on t.department_id = d.department_id 
where t.rank = 1
order by d.department_name

