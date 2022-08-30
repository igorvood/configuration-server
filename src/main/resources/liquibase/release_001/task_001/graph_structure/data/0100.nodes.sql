insert into DICT_TOPIC_INS(GRAPH_ID, NODE_ID)
select 'graph_1', ID from DICT_TOPIC
/
insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID)
select 'graph_1', SERVICE_ID, ID from DICT_SERVICE_PROFILE
/
insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
select distinct 'graph_1', 'topic', IN_TOPIC, 'flink_srv', SERVICE_ID||'~'||PROFILE_ID
from REPORT_ORDER_SERVICE

/
insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
select distinct 'graph_1','flink_srv', SERVICE_ID||'~'||PROFILE_ID,  'topic', OUT_TOPIC
from REPORT_ORDER_SERVICE
/
commit
/