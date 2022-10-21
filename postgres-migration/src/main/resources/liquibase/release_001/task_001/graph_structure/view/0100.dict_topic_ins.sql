create or replace view dict_topic_ins
as
select
  agn.GRAPH_ID,
  DTN.ID NODE_ID
from DICT_ABSTRACT_GRAPH_NODE agn
  join DICT_TOPIC_NODE DTN on agn.NODE_TYPE = DTN.NODE_TYPE and agn.NODE_ID = DTN.ID

/
comment on view dict_topic_ins is 'вьюха для update нод графов.'
/
comment on column dict_topic_ins.graph_id is 'Идентификатор графа.'
/
comment on column dict_topic_ins.node_id is 'Идентификатор ноды.'
/