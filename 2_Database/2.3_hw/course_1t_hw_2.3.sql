create schema course_1t_data_engineer

/*2. ��� ������� ������� ��������� ��������� ��� ������� ��� ���� ������� � ����������� �� ������� � 
� ������� ������ ���� ������������� ��� ������� ������, �������� ������ (��������. ������������� ��� IT �����),
��� ������������ � ���������� �����������.
*/
create table course_1t_data_engineer.department(
	department_id serial primary key,
	department_name varchar(50) not null unique,
	director_last_name varchar(50) not null,
	director_first_name varchar(50) not null,
	director_patronymic varchar(50) not null,
	staff_number int not null
)

/*1. ������� ������� � �������� ����������� � �����������: ���, ���� ��������, ���� ������ ������,
���������, ������� ���������� (jun, middle, senior, lead), ������� ��������, ������������� ������,
�������/���������� ����(True/False). ��� ���� � ������� ����������� ������ ���� ���������� �����
��� ������� ����������.
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

 /*3. �� ���� ����� ���� � ���������� ����������� ����������� ������.
 ������ ����� ������������� �� ���������� �������, ������� ���������� �������� � ������ �������� ����.
 �������� �������, � ������� ��� ������� ���������� ����� ��� ������ �� ������ �������.
 �������� ������ �� A � ����� �������, �� E � ����� ������.
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

/*4. ��������� ��������� �� ���������� �������� � � ������ ������� ������ ���� ������ ��� ������� � 5 �����������,
������� �������� ��� ������� � 2-� ������ �������. ���������� ��������������� ��������� �������� �� ������� ����� ��������,
��, ���������� ��������� ������������� � ��������� �������� ���� ������ (��� �������� � �������� ���, ��� ��� � ��������� � �.�.)
*/
insert into course_1t_data_engineer.department
	(department_name, director_last_name, director_first_name, director_patronymic,staff_number)
values
	('Accounting department','�������','�����','��������',2),
	('IT Department','������','����','��������',3)

insert into course_1t_data_engineer.staff
	(last_name,	first_name,	patronymic,	birthday, start_date, "position", staff_level, salary_level, department_id, "access")
values
	('�������','�����','��������','1990-01-01','2021-12-01','��������� ������','lead',1000000,1,True),
	('�������','���������','��������','1992-02-06','2022-01-01','������� ���������','senior',150000,1,True),
	('������','����','��������','1991-01-01','2022-04-05','��������� ������','lead',10000000,2,True),
	('������','����','��������','1997-06-12','2021-11-23','�������','jun',100000,2,True),
	('�����������','���������','�������������','1994-06-28','2022-02-21','������� �������','middle',130000,2,True)
	
insert into course_1t_data_engineer.staff_rating
	(staff_id, yyyy, Q1, Q2, Q3, Q4)
values
	(1,'2022','A','C','B','B'),
	(2,'2022','D','C','C','B'),
	(3,'2022','A','A','A','A'),
	(4,'2022','B','B','A','C'),
	(5,'2022','E','D','D','D')



/*5. ���� ������� ����������� � ����������� ������������� ������� ����� ����� � ����� ����������������� ������� ������.
�� ��������� ����� � ������� ������ ������ ������������ ������ � ���� �����������. �������� ����������� ���������� � ��������������� �������.
*/
insert into course_1t_data_engineer.department
	(department_name, director_last_name, director_first_name, director_patronymic,staff_number)
values
	('Data Mining Department','��������','�������','����������',3)
	
insert into 
	course_1t_data_engineer.staff
	(last_name,	first_name,	patronymic,	birthday, start_date, "position", staff_level, salary_level, department_id, "access")
values
	('��������','�������','����������','1995-12-11','2022-10-01','��������� ������','lead',1000000,3,True),	
	('��������','���������','��������','1992-02-06','2022-10-5','������� �������','senior',150000,3,True),
	('������','�������','����������','1991-01-01','2022-10-07','�������','jun',100000,3,True)

insert into course_1t_data_engineer.staff_rating
	(staff_id, yyyy, Q1, Q2, Q3, Q4)
values	
	(6, '2022', null, null, null,'B'),
	(7, '2022', null, null, null,'B'),
	(8, '2022', null, null, null,'A')


/*6. ������ ������ ���� ������������� ���� ������ � �������� ������� ��� ��������� ��������� ����������:
���������� ����� ����������, ��� ��� � ���� ������ � ��� ���� ����������� ��������
*/
select s.staff_id "ID ����������",
	concat_ws(' ' , s.last_name, s.first_name, s.patronymic)  "��� ����������",
	(now()::date - s.start_date::date) ||' '|| '����' "���� ������" 	
from course_1t_data_engineer.staff s 

--���������� ����� ����������, ��� ��� � ���� ������ � ������ ������ 3-� �����������
select s.staff_id "ID ����������",
	concat_ws(' ' , s.last_name, s.first_name, s.patronymic)  "��� ����������",
	(now()::date - s.start_date::date) "���� ������ � ����" 	
from course_1t_data_engineer.staff s 
order by "���� ������" desc 
limit 3

--���������� ����� ����������� - ��������� !!!������� �� ���������!!!
select s.staff_id "ID ����������"
from course_1t_data_engineer.staff s 
where s."position" = '�������'


--�������� ������ �����������, ������� ���� �� �� 1 ������� �������� ������ D ��� E
select sr.staff_id "ID ����������"
from course_1t_data_engineer.staff_rating sr  
where q1 in ('D','E') or q2 in ('D','E') or q3 in ('D','E') or q4 in ('D','E')


--�������� ����� ������� �������� � ��������.
select max(s.salary_level)
from course_1t_data_engineer.staff s