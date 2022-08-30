create or replace view dict_nodes
as
select
  agn.GRAPH_ID,
  agn.NODE_TYPE,
  case
    when agn.NODE_TYPE = 'topic' then DTN.ID
    when agn.NODE_TYPE = 'flink_srv' then DSN.ID
  end NODE_ID
from DICT_ABSTRACT_GRAPH_NODE agn
  left join DICT_TOPIC_NODE DTN on agn.NODE_TYPE = DTN.NODE_TYPE and agn.NODE_ID = DTN.ID
  left join DICT_SERVICE_NODE DSN on agn.NODE_TYPE = DSN.NODE_TYPE and agn.NODE_ID = DSN.ID
/
comment on table dict_nodes is 'вьюха для update нод графов.'
/
comment on column dict_nodes.graph_id is 'Идентификатор графа.'
/
comment on column dict_nodes.node_type is 'Тип ноды.'
/
comment on column dict_nodes.node_id is 'Идентификатор ноды.'
/