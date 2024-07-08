use students_marks;

select * from students_list;

select sub_name, avg(mark) as sub_avg 
from students_list
order by sub_name;

with sub_avg as (select sub_name, avg(mark) as sub_average
from students_list
group by sub_name)
select name, sub_name, mark
from students_list as sm
inner join sub_avg as sa
using(sub_name)
where mark > sub_average and
sm.sub_name = sa.sub_name;

select name, sum(mark) as total_mark
from students_list
order by 2 desc;