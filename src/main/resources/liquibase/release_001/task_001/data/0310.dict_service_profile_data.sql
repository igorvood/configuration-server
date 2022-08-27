insert into dict_service_profile_topic(SERVICE_ID, PROFILE_ID, PRODUCER_TOPIC_ID, PRODUCER_PROP_GRP_REF, CONSUMER_TOPIC_ID, CONSUMER_PROP_GRP_REF)
select 'Mutator', 'case_65', null, null, 'uasp-mutator-filter-input', 'DEFAULT_CONSUMER' from dual union all
select 'Mutator', 'case_65', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'DEFAULT_PRODUCER', null, null from dual UNION ALL
select 'Mutator', 'case_65', 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'DEFAULT_PRODUCER', null, null from dual  UNION ALL
select 'Filter', 'case_65',null, null, 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'DEFAULT_CONSUMER' from dual
/
