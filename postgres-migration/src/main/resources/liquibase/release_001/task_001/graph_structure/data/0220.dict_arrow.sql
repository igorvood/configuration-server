DO $$
begin
INSERT INTO DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID, PROPERTY_KEY)
select 'graph_1', 'flink_srv', 'Additional_enrich~case_65', 'topic', 'mutator_consumer_2', 'some_key' from DUAL union
select 'graph_1', 'flink_srv', 'Filter~case_65', 'topic', 'Filter_producer_1', 'some_key' from DUAL union
select 'graph_1', 'flink_srv', 'Filter~case_65', 'topic', 'Filter_producer_2', 'some_key' from DUAL union
select 'graph_1', 'flink_srv', 'Mutator~case_65', 'topic', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'some_key' from DUAL union
select 'graph_1', 'flink_srv', 'Mutator~case_65', 'topic', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'some_key' from DUAL union
select 'graph_1', 'topic', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'flink_srv', 'Filter~case_65', 'some_key' from DUAL union
select 'graph_1', 'topic', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'flink_srv', 'Additional_enrich~case_65', 'some_key' from DUAL union
select 'graph_1', 'topic', 'mutator_consumer_2', 'flink_srv', 'Mutator~case_65', 'some_key' from DUAL union
select 'graph_1', 'topic', 'uasp_mutator_filter_input', 'flink_srv', 'Mutator~case_65', 'some_key' from DUAL union
select 'graph_1', 'topic', 'uasp_mutator_filter_input_2', 'flink_srv', 'Mutator~case_65', 'some_key' from DUAL union
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__status', 'enrich.hypothec.toTopicName' from DUAL union
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto', 'enrichOne.MainEnrichProperty$.dlqTopic' from DUAL union
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status', 'enrichOne.GlobalIdEnrichProperty$.toTopicName' from DUAL union
select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto', 'enrichOne.MainEnrichProperty$.toTopicName' from DUAL union
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto', 'flink_srv', 'mdm-enrichment~way4', 'enrichOne.GlobalIdEnrichProperty$.fromTopic' from DUAL union
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto', 'flink_srv', 'mdm-enrichment~way4', 'enrich.hypothec.fromTopic' from DUAL union
select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto', 'flink_srv', 'mdm-enrichment~way4', 'enrichOne.MainEnrichProperty$.fromTopic' from DUAL;
end;
$$;
/
commit;
/