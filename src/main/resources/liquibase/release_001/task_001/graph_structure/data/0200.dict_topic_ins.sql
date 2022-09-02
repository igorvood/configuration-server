insert into DICT_TOPIC_INS(GRAPH_ID, NODE_ID)
-- select 'way4', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto' from dual union
-- select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__status' from dual

select 'graph_1', 'dev_ivr__uasp_realtime__business_rules__uaspdto' from dual union
select 'graph_1', 'Filter_producer_1' from dual union
select 'graph_1', 'Filter_producer_2' from dual union
select 'graph_1', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq' from dual union
select 'graph_1', 'mutator_consumer_2' from dual union
select 'graph_1', 'uasp_mutator_filter_input' from dual union
select 'graph_1', 'uasp_mutator_filter_input_2' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__status' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto' from dual

/

select --GRAPH_ID, NODE_ID,
       'select '''||GRAPH_ID|| ''', '''||NODE_ID|| ''' from dual union'
       from DICT_ABSTRACT_GRAPH_NODE where NODE_TYPE = 'topic'
order by GRAPH_ID, NODE_ID