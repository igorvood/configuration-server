-- create or replace view report_order_service as
with full_srv_and_topic as
(SELECT SP.SERVICE_ID, sp.ID profile_id, nvl(DSPT.CONSUMER_TOPIC_ID, '-') IN_TOPIC, nvl(dspt.PRODUCER_TOPIC_ID,'-') OUT_TOPIC
FROM DICT_SERVICE_PROFILE SP
  JOIN DICT_SERVICE DS on DS.ID = SP.SERVICE_ID
  JOIN DICT_SERVICE_PROFILE_TOPIC DSPT on SP.SERVICE_ID = DSPT.SERVICE_ID and SP.ID = DSPT.PROFILE_ID
  LEFT JOIN DICT_TOPIC DT_CNS on DT_CNS.ID = DSPT.CONSUMER_TOPIC_ID and DT_CNS.CONSUMER_PROP_GRP_REF = DSPT.CONSUMER_PROP_GRP_REF
  LEFT JOIN DICT_TOPIC DT_PRD on DT_PRD.ID = DSPT.PRODUCER_TOPIC_ID and DT_PRD.CONSUMER_PROP_GRP_REF = DSPT.PRODUCER_PROP_GRP_REF),
srv_in as (
  select SERVICE_ID, profile_id, IN_TOPIC
    from full_srv_and_topic f1
  where IN_TOPIC != '-'
),
srv_out as (
    select SERVICE_ID, profile_id, OUT_TOPIC
    from full_srv_and_topic f1
    where OUT_TOPIC != '-'
    ),
all_topic as (
select srv_in.SERVICE_ID, srv_in.profile_id, srv_in.IN_TOPIC, srv_out.OUT_TOPIC from srv_in
 join srv_out on (srv_in.SERVICE_ID, srv_in.profile_id) = ((srv_out.SERVICE_ID, srv_out.profile_id))
)
select * from all_topic
--     connect by prior OUT_TOPIC=IN_TOPIC

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

