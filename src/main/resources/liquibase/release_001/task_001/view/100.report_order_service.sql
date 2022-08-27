-- create or replace view report_order_service as
with full_srv_and_topic as
(SELECT SP.SERVICE_ID, sp.ID profile_id, DSPT.CONSUMER_TOPIC_ID IN_TOPIC, dspt.PRODUCER_TOPIC_ID OUT_TOPIC
FROM DICT_SERVICE_PROFILE SP
  JOIN DICT_SERVICE DS on DS.ID = SP.SERVICE_ID
  JOIN DICT_SERVICE_PROFILE_TOPIC DSPT on SP.SERVICE_ID = DSPT.SERVICE_ID and SP.ID = DSPT.PROFILE_ID
  LEFT JOIN DICT_TOPIC DT_CNS on DT_CNS.ID = DSPT.CONSUMER_TOPIC_ID and DT_CNS.CONSUMER_PROP_GRP_REF = DSPT.CONSUMER_PROP_GRP_REF
  LEFT JOIN DICT_TOPIC DT_PRD on DT_PRD.ID = DSPT.PRODUCER_TOPIC_ID and DT_PRD.CONSUMER_PROP_GRP_REF = DSPT.PRODUCER_PROP_GRP_REF)
select * from full_srv_and_topic

/
comment on table report_order_service is 'Вьюха с порядком сервисов.'
/
comment on column report_order_service.SERVICE_ID is 'Идентификатор сервиса.'
/
comment on column report_order_service.PROFILE_ID is 'Идентификатор профиля.'
/
comment on column report_order_service.IN_TOPIC is 'Входящий топик.'
/
comment on column report_order_service.OUT_TOPIC is 'Изходящий топик.'
/

