create table dict_arrow
(
  graph_id varchar(256) not null,
  beg_node_type varchar(32)  not null,
  beg_node_id varchar(512) not null,
  end_node_type varchar(32)  not null,
  end_node_id varchar(512) not null,
  constraint dict_arrow_pk primary key (graph_id, beg_node_type, beg_node_id, end_node_type, end_node_id),
  constraint dict_arrow_not_equal_ck check (
    beg_node_type != end_node_type or beg_node_id != end_node_id
  ),
  constraint dict_arrow_beg_fk foreign key (graph_id, beg_node_type, beg_node_id) references dict_abstract_graph_node(graph_id, node_type, node_id),
  constraint dict_arrow_end_fk foreign key (graph_id, end_node_type, end_node_id) references dict_abstract_graph_node(graph_id, node_type, node_id),
  property_key varchar(256) not null
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
