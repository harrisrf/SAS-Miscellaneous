/* 2016 07 17 Ryan Harris */
/* Takes categorical variables and turns them into dummy variables for models */

%macro dummy(
		var_name 	/*The name of the categorical variable*/, 
		table_name 	/*The library & dataset name*/, 
		max_vars 	/*Maximum number of variables to create*/);

proc sql outobs=&max_vars. noprint;
	create table prep as
	select 
			a.&var_name., 
			case 
				when b.total_count in (., 0) then 0
				else a.var_count / b.total_count
			end as percentage
		from 
			(select &var_name., count(*) as var_count from &table_name. group by &var_name.) as a
			full join (select count(*) as total_count from &table_name.) as b on 1=1
		order by calculated percentage desc;
quit;

proc sql noprint;
	select 
		cat("case when &var_name. = '", cats(&var_name.), "' then 1 else 0 end as ", catx('_', "&var_name.", MONOTONIC())) into: case_statement separated by ","
	from prep;
quit;

proc datasets lib=work nodetails;
	delete prep;
run;
%put &case_statement.;
%mend;

%dummy(make, sashelp.cars, 8)

proc sql;
	create table new_cars as
	select *, &case_statement.
	from sashelp.cars;
quit;
