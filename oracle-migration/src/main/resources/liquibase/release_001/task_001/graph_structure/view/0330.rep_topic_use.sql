create or replace view rep_topic_use as
select
  nvl(DA_e.GRAPH_ID, DA_b.GRAPH_ID) graph_id,
  tn.ID topic_id,
  case when nvl(DA_e.GRAPH_ID, DA_b.GRAPH_ID) is not null
    then 1
    else 0
  end used
from DICT_TOPIC_NODE tn
  left join DICT_ABSTRACT_GRAPH_NODE DAGN on DAGN.NODE_TYPE = tn.NODE_TYPE and DAGN.NODE_ID = tn.ID
  left join DICT_ARROW DA_b on DAGN.GRAPH_ID = DA_b.GRAPH_ID and DAGN.NODE_TYPE = DA_b.BEG_NODE_TYPE and DAGN.NODE_ID = DA_b.BEG_NODE_ID
  left join DICT_ARROW DA_e on DAGN.GRAPH_ID = DA_e.GRAPH_ID and DAGN.NODE_TYPE = DA_e.END_NODE_TYPE and DAGN.NODE_ID = DA_e.END_NODE_ID
/
comment on table rep_topic_use is 'Список топиков с признаком использования.'
/
comment on column rep_topic_use.graph_id is 'В каком графе используется.'
/
comment on column rep_topic_use.topic_id is 'идентификатор топика.'
/
comment on column rep_topic_use.used is 'Признак использования.'
/
