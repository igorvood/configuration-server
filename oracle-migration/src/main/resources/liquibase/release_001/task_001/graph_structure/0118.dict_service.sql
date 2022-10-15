create table dict_service
(
  id varchar2(255) not null,
  main_class varchar2(255) not null,
  constraint dict_service_pk primary key (id) using index tablespace t_idx
--   constraint dict_service_main_class_uk unique (main_class) using index tablespace t_idx
)
/
comment on table dict_service is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_service.id is 'Идентификатор ноды.'
/
comment on column dict_service.main_class is 'Класс запуска.'
/
