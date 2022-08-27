create table dict_service_profile
(
  service_id varchar2(256) not null,
  id varchar2(256) not null,
  constraint dict_service_profile_pk primary key (service_id, id) using index tablespace t_idx,
  constraint dict_service_profile_service_id_fk foreign key (service_id) references dict_service(ID),
  ---
  description varchar2(255) not null
)
/
comment on table dict_service_profile is 'Справочник профилей сервисов.'
/
comment on column dict_service_profile.id is 'Идентификатор профиля.'
/
comment on column dict_service_profile.service_id is 'Идентификатор сервиса.'
/
comment on column dict_service_profile.description is 'Описание состояния.'
/
