create table dict_service_node
(
  id varchar2(512) not null,
  constraint dict_service_node_pk primary key (id) using index tablespace t_idx,
  node_type as ('flink_srv'),
  constraint dict_service_node_node_type_fk foreign key (node_type, id) references dict_abstract_graph_node(node_type, NODE_ID)
)
/
comment on table dict_service_node is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_service_node.node_type is 'Тип ноды.'
/
comment on column dict_service_node.id is 'Идентификатор топика.'
/
