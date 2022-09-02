create table dict_topic_node
(
  id varchar2(512) not null,
  constraint dict_topic_node_pk primary key (id) using index tablespace t_idx,
  node_type as ('topic'),
  constraint dict_topic_node_node_type_fk foreign key (node_type, id) references dict_abstract_graph_node(node_type, NODE_ID),
  is_our number(1) default 1 not null,
  CNT_PARTITION number(2) default 1 not null,
  constraint dict_topic_node_CNT_PARTITION_ck check ( CNT_PARTITION>0 and CNT_PARTITION<64),
  constraint dict_topic_node_is_our_ck check ( is_our in (0, 1) ),
  producer_prop_grp varchar2(256),
  producer_prop_grp_ref as (
    case when producer_prop_grp is null
      then 'producer_default'
      else producer_prop_grp
    end
  ),
  prd_type as ('prd'),
  constraint dict_topic_node_producer_fk foreign key (prd_type, producer_prop_grp_ref) references dict_kafka_property_grp(type_read, id),
  consumer_prop_grp varchar2(256),
  consumer_prop_grp_ref as (
    case when consumer_prop_grp is null
      then 'consumer_default'
      else consumer_prop_grp
    end
  ),
  cns_type as ('cns'),
  constraint dict_topic_node_consumer_fk foreign key (cns_type, consumer_prop_grp_ref) references dict_kafka_property_grp(type_read, id),
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
  constraint dict_act_state_p0_name_real_uk unique (p0_name_real) using index tablespace t_idx
)
/
comment on table dict_topic_node is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_topic_node.node_type is 'Тип ноды.'
/
comment on column dict_topic_node.id is 'Идентификатор топика.'
/
comment on column dict_topic_node.is_our is 'Признак топика принадлежащего комманде.'
/
comment on column dict_topic_node.CNT_PARTITION is 'Количество партиций.'
/
comment on column dict_topic_node.PRODUCER_PROP_GRP is 'Группа настроек продьюссера, заполнять только в случае отличия от дефолтной.'
/
comment on column dict_topic_node.PRODUCER_PROP_GRP_REF is 'Группа настроек продьюссера.'
/
comment on column dict_topic_node.CONSUMER_PROP_GRP is 'Группа настроек консьмера, заполнять только в случае отличия от дефолтной.'
/
comment on column dict_topic_node.CONSUMER_PROP_GRP_REF is 'Группа настроек консьмера.'
/
comment on column dict_topic_node.dev_name is 'Имя топика на dev стенде.'
/
comment on column dict_topic_node.ift_name is 'Имя топика на ift стенде.'
/
comment on column dict_topic_node.ift_name_real is 'Имя топика на ift стенде вычисленное.'
/
comment on column dict_topic_node.nt_name is 'Имя топика на nt стенде.'
/
comment on column dict_topic_node.nt_name_real is 'Имя топика на nt стенде вычисленное.'
/
comment on column dict_topic_node.p0_name is 'Имя топика на prod стенде.'
/
comment on column dict_topic_node.p0_name_real is 'Имя топика на prod стенде вычисленное.'
/
comment on column dict_topic_node.real_name is 'Имя топика на pred prod стенде.'
/
comment on column dict_topic_node.real_name_real is 'Имя топика на pred prod стенде вычисленное.'
/
comment on column dict_topic_node.cns_type is 'Признак продьюсера.'
/
comment on column dict_topic_node.prd_type is 'Признак косьюмера.'
/

