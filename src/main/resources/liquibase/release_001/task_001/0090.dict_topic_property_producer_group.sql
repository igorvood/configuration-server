create table dict_topic_property_producer_group
(
  id varchar2(256) not null,
  constraint dict_topic_property_producer_group_pk primary key (id) using index tablespace t_idx

)
/
comment on table dict_topic_property_producer_group is 'Справочник групп настроек для продюсера топиков.'
/
comment on column dict_topic_property_producer_group.id is 'Идентификатор.'
/
