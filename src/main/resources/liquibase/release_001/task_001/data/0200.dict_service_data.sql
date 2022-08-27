insert into dict_service(ID, DESCRIPTION)
select 'Mutator', 'Мутатор' from dual union all
select 'Filter', 'Сервис фильтрации' from dual union all
select 'ID', 'DESCRIPTION' from dual where 1=2
/
