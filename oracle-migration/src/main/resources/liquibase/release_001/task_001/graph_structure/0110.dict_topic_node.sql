create table dict_topic_node
(
  id varchar2(512) not null,
  constraint dict_topic_node_pk primary key (id) using index tablespace t_idx,
  node_type as ('topic') not null,
  constraint dict_topic_node_node_type_fk foreign key (node_type, id) references dict_abstract_graph_node(node_type, NODE_ID),
  is_our number(1) default 1 not null,
  constraint dict_topic_node_is_our_ck check ( is_our in (0, 1) ),
  producer_prop_grp varchar2(256),
  producer_prop_grp_ref as (
    case when producer_prop_grp is null
      then 'producer_default'
      else producer_prop_grp
    end
  ) not null,
  prd_type as ('prd') not null,
  constraint dict_topic_node_producer_fk foreign key (prd_type, producer_prop_grp_ref) references dict_kafka_property_grp(type_read, id),
  consumer_prop_grp varchar2(256),
  consumer_prop_grp_ref as (
    case when consumer_prop_grp is null
      then 'consumer_default'
      else consumer_prop_grp
    end
  ) not null,
  cns_type as ('cns') not null,
  constraint dict_topic_node_consumer_fk foreign key (cns_type, consumer_prop_grp_ref) references dict_kafka_property_grp(type_read, id)
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
comment on column dict_topic_node.PRODUCER_PROP_GRP is 'Группа настроек продьюссера, заполнять только в случае отличия от дефолтной.'
/
comment on column dict_topic_node.PRODUCER_PROP_GRP_REF is 'Группа настроек продьюссера.'
/
comment on column dict_topic_node.CONSUMER_PROP_GRP is 'Группа настроек консьмера, заполнять только в случае отличия от дефолтной.'
/
comment on column dict_topic_node.CONSUMER_PROP_GRP_REF is 'Группа настроек консьмера.'
/
comment on column dict_topic_node.cns_type is 'Признак продьюсера.'
/
comment on column dict_topic_node.prd_type is 'Признак косьюмера.'
/

