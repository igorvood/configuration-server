create table dict_topic
(
  id varchar2(20)  not null,
  constraint dict_act_state_pk primary key (id) using index tablespace t_idx,
    ---
  description varchar2(255) not null,
  is_our_topic number(1) not null,
  constraint dict_topic_is_our_topic check ( is_our_topic in (0, 1) ),
  dev_name varchar2(256) not null,
  ift_name varchar2(256),
  ift_name_real as (nvl(ift_name, 'ift_'||substr(dev_name,5)))


)
/
comment on table dict_topic is 'Справочник топиков.'
/
comment on column dict_topic.id is 'Идентификатор.'
/
comment on column dict_topic.description is 'Описание состояния.'
/
comment on column dict_topic.is_our_topic is 'признак топика принадлежащего комманде.'
/
comment on column dict_topic.dev_name is 'Имя топика на dev стенде.'
/
comment on column dict_topic.ift_name is 'Имя топика на ift стенде.'
/
comment on column dict_topic.ift_name_real is 'Имя топика на ift стенде вычисленное.'
/