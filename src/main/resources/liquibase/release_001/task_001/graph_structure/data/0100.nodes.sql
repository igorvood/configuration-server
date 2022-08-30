insert into dict_nodes(graph_id, node_type, node_id)
select 'graph_1', 'topic', ID from DICT_TOPIC
/
insert into dict_nodes(graph_id, node_type, node_id)
select 'graph_1', 'flink_srv', ID from DICT_SERVICE
/
insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
select distinct 'graph_1', 'topic', IN_TOPIC, 'flink_srv', SERVICE_ID
from REPORT_ORDER_SERVICE
/
insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
select distinct 'graph_1','flink_srv', SERVICE_ID,  'topic', OUT_TOPIC
from REPORT_ORDER_SERVICE
/
commit
/
-- constraint dict_arrow_pk primary key (graph_id, beg_node_type, beg_node_id, end_node_type, end_node_id) using index tablespace t_idx compress 1,