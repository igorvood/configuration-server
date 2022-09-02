insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
select 'way4', 'flink_srv', 'mdm-enrichment~way4','topic', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto'  from DUAL union all
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto' from DUAL union all
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status' from DUAL union all
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__status' from DUAL
/
commit
/