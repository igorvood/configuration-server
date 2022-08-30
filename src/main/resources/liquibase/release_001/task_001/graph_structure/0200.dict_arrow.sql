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
  )
)
/
comment on table dict_arrow is 'Справочник групп настроек для консьюмера топиков.'
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



