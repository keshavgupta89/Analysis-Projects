SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
	t.from_date,
	t.to_date
INTO Retirement_Titles
FROM employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

SELECT * from Retirement_Titles

SELECT distinct on (rt.emp_no)
	rt.emp_no,
    rt.first_name,
	rt.last_name,
    rt.title	
INTO Unique_Title
FROM Retirement_Titles as rt
order by rt.emp_no, rt.to_date desc ;

SELECT * from Unique_Title

SELECT count(title) as "poistion_count",title
INTO retiring_titles
FROM Unique_Title
group by title
order by "poistion_count" desc;

select * from retiring_titles

SELECT 
	distinct on(e.emp_no)
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO Mentorship_Eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE  (de.to_date = '9999-01-01') and
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;

select * from Mentorship_Eligibility