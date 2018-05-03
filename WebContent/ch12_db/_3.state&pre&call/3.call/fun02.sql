drop table emp2;

--<2. 이클립스에서 실행하는 경우>
create table emp2
as
select * from emp;
--영역 설정 후 ALT+X

drop procedure del_name;

create or replace procedure
	del_name(vename emp.ename%type)
is
	begin
		delete from emp2 where ename=vename;
	end;
--영역 설정 후 ALT+C
	
select * from emp2;

select * from emp;
