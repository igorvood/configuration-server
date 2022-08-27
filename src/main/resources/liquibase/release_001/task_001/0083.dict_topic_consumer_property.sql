create table dict_topic_consumer_property
(
  grp_id varchar2(256) not null,
  prop_id varchar2(256) not null,
  constraint ddict_topic_consumer_property_pk primary key (grp_id, prop_id) using index tablespace t_idx,
  constraint dict_topic_consumer_property_grp_fk foreign key (grp_id) references dict_topic_property_consumer_group( id),
  prop_value varchar2(256) not null

)
/
comment on table dict_topic_consumer_property is 'Справочник групп настроек топиков.'
/
comment on column dict_topic_consumer_property.grp_id is 'Идентификатор группы.'
/
comment on column dict_topic_consumer_property.prop_id is 'Идентификатор свойства.'
/
comment on column dict_topic_consumer_property.prop_value is 'Идентификатор свойства.'
/

