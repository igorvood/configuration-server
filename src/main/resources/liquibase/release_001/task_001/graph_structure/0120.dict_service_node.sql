create table dict_service_node
(
  service_id varchar2(255) not null,
  constraint dict_service_node_service_id_fk foreign key(service_id) references dict_service(id),
  profile_id varchar2(255) not null,
  constraint dict_service_node_pk primary key (service_id, profile_id) using index tablespace t_idx,
  node_type as ('flink_srv'),
  id as(service_id||'~'||profile_id),
  constraint dict_service_node_node_type_fk foreign key (node_type, id) references dict_abstract_graph_node(node_type, NODE_ID)
)
/
comment on table dict_service_node is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_service_node.node_type is 'Тип ноды.'
/
comment on column dict_service_node.id is 'Идентификатор ноды.'
/
comment on column dict_service_node.service_id is 'Идентификатор сервиса.'
/
comment on column dict_service_node.profile_id is 'Идентификатор профиля запуска.'
/
