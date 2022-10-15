create table dict_place_holder_by_service
(
    service_id varchar2(255) not null,
    profile_id varchar2(255) not null,
    place_holder_id varchar2(255) not null,
    constraint dict_place_holder_by_service_pk primary key (service_id, profile_id, place_holder_id) using index tablespace t_idx compress 1,
    value varchar2(256) not null,
    constraint dict_place_holder_by_service_srv_fk foreign key (service_id, profile_id) references DICT_SERVICE_NODE(SERVICE_ID, PROFILE_ID),
    constraint dict_place_holder_by_service_ph_fk foreign key (place_holder_id) references dict_place_holder(ID)
)
/
comment on table dict_place_holder_by_service is 'Справочник плейсхолдеров.'
/
comment on column dict_place_holder_by_service.place_holder_id is 'Идетификатор плейсхолдера.'
/
comment on column dict_place_holder_by_service.service_id is 'Идетификатор сервиса.'
/
comment on column dict_place_holder_by_service.profile_id is 'Идетификатор профиля.'
/
comment on column dict_place_holder_by_service.value is 'Значение по умолчанию.'
/
