insert into dict_service_profile_topic(SERVICE_ID, PROFILE_ID, TYPE_TOPIC, TOPIC_ID, TOPIC_GRP_REF)
select 'Mutator', 'case_65', 'in', 'uasp_mutator_filter_input', 'DEFAULT_CONSUMER' from dual union all
select 'Mutator', 'case_65', 'in', 'mutator_consumer_2', 'DEFAULT_CONSUMER' from dual union all
select 'Mutator', 'case_65', 'out', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'DEFAULT_PRODUCER' from dual UNION ALL
select 'Mutator', 'case_65', 'out', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'DEFAULT_PRODUCER' from dual  UNION ALL
select 'Filter', 'case_65', 'out', 'Filter_producer_1', 'DEFAULT_PRODUCER' from dual  UNION ALL
select 'Filter', 'case_65', 'out', 'Filter_producer_2', 'DEFAULT_PRODUCER' from dual  UNION ALL
select 'Filter', 'case_65', 'in', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'DEFAULT_CONSUMER' from dual
/
commit
/