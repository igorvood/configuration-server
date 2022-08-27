insert into DICT_TOPIC(ID, DESCRIPTION, IS_OUR_TOPIC, DEV_NAME, IFT_NAME, PRODUCER_PROP_GRP, CONSUMER_PROP_GRP)
select 'uasp-mutator-filter-input', 'DESCRIPTION', 1, 'dev-uasp-mutator-filter-input', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'mutator_consumer_2', 'DESCRIPTION', 1, 'dev-uasp-mutator-filter-input', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', 'DESCRIPTION', 1, 'dev_ivr__uasp_realtime__bussiness_rules__uaspdto__dlq', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'dev_ivr__uasp_realtime__business_rules__uaspdto', 'DESCRIPTION', 1, 'dev_ivr__uasp_realtime__business_rules__uaspdto', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'Filter_producer_1', 'DESCRIPTION', 1, 'dev_ivr__uasp_realtime__business_rules__uaspdto', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'Filter_producer_2', 'DESCRIPTION', 1, 'dev_ivr__uasp_realtime__business_rules__uaspdto', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual union all
select 'ID', 'DESCRIPTION', 1, 'DEV_NAME', null, 'DEFAULT_PRODUCER', 'DEFAULT_CONSUMER' from dual where 1=2
/
