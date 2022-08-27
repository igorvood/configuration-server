create table dict_service
(
  id varchar2(256) not null,
  constraint dict_service_pk primary key (id) using index tablespace t_idx,
    ---
  description varchar2(255) not null
)
/
comment on table dict_service is 'Справочник сервисов.'
/
comment on column dict_service.id is 'Идентификатор.'
/
comment on column dict_service.description is 'Описание.'
/
