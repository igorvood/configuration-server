create table dict_topic_params_by_stand
(
  node_id varchar2(512) not null,
  stand_id varchar2(256) not null,
  constraint dict_topic_params_by_stand_st_fk foreign key (node_id) references DICT_TOPIC_NODE(id),
  constraint dict_topic_params_by_stand_node_fk foreign key (stand_id) references META_STAND(id),
  constraint dict_topic_params_by_stand_pk primary key (stand_id, node_id) using index tablespace t_idx,
  CNT_PARTITION number(2) default 1 not null,
  constraint dict_topic_params_by_stand_ck check ( CNT_PARTITION>0 and CNT_PARTITION<64),
  topic_name varchar2(256) not null,
  constraint dict_topic_params_by_stand_uk unique (stand_id, topic_name) using index tablespace t_idx
)
/
comment on table dict_topic_params_by_stand is 'Справочник настроек топиков в разрезе стенда.'
/
comment on column dict_topic_params_by_stand.node_id is 'Идентификатор топика.'
/
comment on column dict_topic_params_by_stand.CNT_PARTITION is 'Количество партиций.'
/
comment on column dict_topic_params_by_stand.topic_name is 'Имя топика на стенде.'
/
comment on column dict_topic_params_by_stand.stand_id is 'Идентификатор стенда.'
/
