insert into dict_kafka_prop(TYPE_PROP, PROP_ID)
SELECT 'prd', PROP_ID from DICT_TOPIC_PRODUCER_PROPERTY
union
SELECT 'cns', PROP_ID from DICT_TOPIC_CONSUMER_PROPERTY
/
insert into dict_kafka_prd_property_grp(ID, DESCRIPTION)
SELECT 'producer_default', 'producer_default' from DUAL
/
insert into dict_kafka_cns_property_grp(ID, DESCRIPTION)
SELECT 'consumer_default', 'consumer_default' from DUAL
/
insert into dict_kafka_prop_value(GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE)
SELECT 'producer_default', 'prd', PROP_ID, PROP_VALUE from DICT_TOPIC_PRODUCER_PROPERTY
union
SELECT 'consumer_default', 'cns', PROP_ID, PROP_VALUE from DICT_TOPIC_CONSUMER_PROPERTY
/
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