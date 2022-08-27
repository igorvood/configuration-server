create table dict_service_profile_property
(
  service_id varchar2(256) not null,
  profile_id varchar2(256) not null,
  name_property varchar2(512) not null,
  constraint dict_service_profile_property_pk primary key (service_id, profile_id, name_property) using index tablespace t_idx,
  constraint dict_service_profile_property_service_id_fk foreign key (service_id, profile_id) references dict_service_profile(service_id, id),
  value_property varchar2(512)
)
/
comment on table dict_service_profile_property is 'Справочник свойст сервиса в разрезе профиля.'
/
comment on column dict_service_profile_property.profile_id is 'Идентификатор профиля.'
/
comment on column dict_service_profile_property.service_id is 'Идентификатор сервиса.'
/
comment on column dict_service_profile_property.name_property is 'Имя свойства.'
/
comment on column dict_service_profile_property.value_property is 'значение свойства.'
/
