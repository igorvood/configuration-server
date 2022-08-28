create table dict_topic
(
  id varchar2(256) not null,
  constraint dict_act_state_pk primary key (id) using index tablespace t_idx,
  constraint dict_topic_id_ck check ( instr(id, '-') = 0 ),
    ---
  description varchar2(255) not null,
  is_our_topic number(1) not null,
  constraint dict_topic_is_our_topic_ck check ( is_our_topic in (0, 1) ),
  dev_name varchar2(256) not null,
  constraint dict_act_state_dev_name_real_uk unique (dev_name) using index tablespace t_idx,
  ---
  ift_name varchar2(256),
  ift_name_real as (nvl(ift_name, 'ift_'||substr(dev_name,5))),
  constraint dict_act_state_ift_name_real_uk unique (ift_name_real) using index tablespace t_idx,
  ---
  nt_name varchar2(256),
  nt_name_real as (nvl(ift_name, 'nt_'||substr(dev_name,5))),
  constraint dict_act_state_nt_name_real_uk unique (nt_name_real) using index tablespace t_idx,
  ---
  real_name varchar2(256),
  real_name_real as (nvl(ift_name, 'rr_'||substr(dev_name,5))),
  constraint dict_act_state_real_name_real_uk unique (real_name_real) using index tablespace t_idx,
  ---
  p0_name varchar2(256),
  p0_name_real as (nvl(ift_name, 'p0_'||substr(dev_name,5))),
  constraint dict_act_state_p0_name_real_uk unique (p0_name_real) using index tablespace t_idx,
  ---
  producer_prop_grp varchar2(64),
  producer_prop_grp_ref as (nvl(producer_prop_grp, 'DEFAULT_PRODUCER')),
  constraint dict_topic_producer_prop_grp_fk FOREIGN KEY (producer_prop_grp_ref)
    references dict_topic_property_producer_group(id),

  consumer_prop_grp varchar2(64),
  consumer_prop_grp_ref as (nvl(consumer_prop_grp, 'DEFAULT_CONSUMER')),
  constraint dict_topic_consumer_prop_grp_fk FOREIGN KEY (consumer_prop_grp_ref)
      references dict_topic_property_consumer_group(id),
  constraint dict_topic_producer_prop_grp_ref_uk unique (id, producer_prop_grp_ref) using index tablespace t_idx,
  constraint dict_topic_consumer_prop_grp_ref_uk unique (id, consumer_prop_grp_ref) using index tablespace t_idx
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
comment on column dict_topic.producer_prop_grp is 'группа свойств продьюссера, если пусто возьмется по умолчанию'
/
comment on column dict_topic.producer_prop_grp_ref is 'группа свойств продьюссера для констренйнта'
/
comment on column dict_topic.consumer_prop_grp is 'группа свойств консьюмера, если пусто возьмется по умолчанию'
/
comment on column dict_topic.consumer_prop_grp_ref is 'группа свойств консьюмера для констренйнта'
/
comment on column dict_topic.nt_name is 'Имя топика на nt стенде.'
/
comment on column dict_topic.nt_name_real is 'Имя топика на nt стенде вычисленное.'
/
comment on column dict_topic.p0_name is 'Имя топика на prod стенде.'
/
comment on column dict_topic.p0_name_real is 'Имя топика на prod стенде вычисленное.'
/
comment on column dict_topic.real_name is 'Имя топика на pred prod стенде.'
/
comment on column dict_topic.real_name_real is 'Имя топика на pred prod стенде вычисленное.'
/