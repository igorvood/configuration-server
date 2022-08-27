create table dict_topic_property_consumer_group
(
  id varchar2(256) not null,
  constraint dict_topic_property_consumer_group_pk primary key (id) using index tablespace t_idx
)
/
comment on table dict_topic_property_consumer_group is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_topic_property_consumer_group.id is 'Идентификатор.'
/
