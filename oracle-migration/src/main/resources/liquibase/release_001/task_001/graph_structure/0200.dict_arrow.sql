create table dict_arrow
(
  graph_id varchar2(256) not null,
  beg_node_type varchar2(32)  not null,
  beg_node_id varchar2(512) not null,
  end_node_type varchar2(32)  not null,
  end_node_id varchar2(512) not null,
  constraint dict_arrow_pk primary key (graph_id, beg_node_type, beg_node_id, end_node_type, end_node_id) using index tablespace t_idx compress 1,
  constraint dict_arrow_not_equal_ck check (
    beg_node_type != end_node_type or beg_node_id != end_node_id
  ),
  constraint dict_arrow_beg_fk foreign key (graph_id, beg_node_type, beg_node_id) references dict_abstract_graph_node(graph_id, node_type, node_id),
  constraint dict_arrow_end_fk foreign key (graph_id, end_node_type, end_node_id) references dict_abstract_graph_node(graph_id, node_type, node_id),
  property_key varchar2(256) not null,
  flink_srv as (
      case when beg_node_type = 'flink_srv'
      then beg_node_id
      else end_node_id end
    ) not null,
  constraint dict_arrow_prop_key_uk unique (flink_srv, property_key) using index tablespace t_idx compress
)
/
comment on table dict_arrow is 'Справочник связей сервисов и топиков.'
/
comment on column dict_arrow.beg_node_type is 'Тип ноды начала стрелки .'
/
comment on column dict_arrow.beg_node_id is 'Идентификатор ноды начала стрелки.'
/
comment on column dict_arrow.end_node_type is 'Тип ноды окончания стрелки .'
/
comment on column dict_arrow.end_node_id is 'Идентификатор ноды окончания стрелки.'
/
comment on column dict_arrow.graph_id is 'Идентификатор графа.'
/
comment on column dict_arrow.property_key is 'Ключ для свойства для указания имени топика в настройках.'
/
comment on column dict_arrow.flink_srv is 'Имя сервиса.'
/
