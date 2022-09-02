-- insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID)
-- select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
-- select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
-- select 'way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto', 'flink_srv', 'mdm-enrichment~way4' from DUAL union all
-- select 'way4', 'flink_srv', 'mdm-enrichment~way4','topic', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto'  from DUAL union all
-- select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto' from DUAL union all
-- select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status' from DUAL union all
-- select 'way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__status' from DUAL
-- /
-- commit
-- /
begin
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'flink_srv', 'Additional_enrich~case_65', 'topic', 'mutator_consumer_2');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'flink_srv', 'Filter~case_65', 'topic', 'Filter_producer_1');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'flink_srv', 'Filter~case_65', 'topic', 'Filter_producer_2');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'flink_srv', 'Mutator~case_65', 'topic', 'dev_ivr__uasp_realtime__business_rules__uaspdto');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'flink_srv', 'Mutator~case_65', 'topic', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'topic', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'flink_srv', 'Filter~case_65');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'topic', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'flink_srv', 'Additional_enrich~case_65');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'topic', 'mutator_consumer_2', 'flink_srv', 'Mutator~case_65');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'topic', 'uasp_mutator_filter_input', 'flink_srv', 'Mutator~case_65');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('graph_1', 'topic', 'uasp_mutator_filter_input_2', 'flink_srv', 'Mutator~case_65');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__status');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'flink_srv', 'mdm-enrichment~way4', 'topic', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto', 'flink_srv', 'mdm-enrichment~way4');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto', 'flink_srv', 'mdm-enrichment~way4');
INSERT INTO LOCALDEV.DICT_ARROW (GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID) VALUES ('way4', 'topic', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto', 'flink_srv', 'mdm-enrichment~way4');
end;
/