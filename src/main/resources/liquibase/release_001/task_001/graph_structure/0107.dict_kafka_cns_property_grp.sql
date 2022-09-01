create table dict_kafka_cns_property_grp
(
  id varchar2(256) not null,
  constraint dict_kafka_cns_property_grp_pk primary key (id) using index tablespace t_idx,
  description varchar2(512)

)
/
comment on table dict_kafka_cns_property_grp is 'Справочник групп настроек консьбмера для кафки.'
/
comment on column dict_kafka_cns_property_grp.description is 'Описание.'
/
comment on column dict_kafka_cns_property_grp.id is 'Идентификатор группы настроек.'
/
