create table meta_stand
(
    id varchar(256) not null,
    description varchar(512) not null,
    is_local numeric(1) not null,
    constraint meta_stand_is_local_ck check ( is_local in (0, 1) ),
    constraint meta_stand_pk primary key (id)
)
/
comment on table meta_stand is 'Справочник Стендов.'
/
comment on column meta_stand.id is 'Идентификатор стенда'
/
comment on column meta_stand.description is 'Описание стенда.'
/
comment on column meta_stand.is_local is 'признак локального стенда.'
/
