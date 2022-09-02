create or replace view kafka_property_by_sevice
as
with srv as (select TOPIC_ID, DKPV.PROP_ID, DKPV.PROP_VALUE, sn.SERVICE_ID, PROFILE_ID,  STAND, sn.TYPE_PROP, TOPIC_NAME, GRP_PROP
             from kafka_topic_by_service sn
             join DICT_KAFKA_PROPERTY_GRP kpg on (kpg.TYPE_READ, kpg.ID) = ((sn.TYPE_PROP, sn.GRP_PROP))
             join DICT_KAFKA_PROP_VALUE DKPV on kpg.TYPE_READ = DKPV.TYPE_PROP and kpg.ID = DKPV.GRP_ID
)
select
    --SERVICE_ID||'_'||PROFILE_ID||'.'||
    lower(srv.TYPE_PROP||'.'||srv.TOPIC_NAME)||'.'||srv.PROP_ID   env_prop_name,
    srv.TOPIC_ID, srv.PROP_ID, prp.PROPERTY_VAL, srv.SERVICE_ID, srv.PROFILE_ID,  srv.STAND, srv.TYPE_PROP, srv.TOPIC_NAME, srv.GRP_PROP
from srv
join KAFKA_PROP_VALUE_by_STAND prp on (prp.GRP_ID, prp.TYPE_PROP, prp.PROP_ID, prp.STAND) = ((srv.GRP_PROP,srv.TYPE_PROP, srv.PROP_ID,  srv.STAND ))

where srv.SERVICE_ID = 'mdm-enrichment' and srv.PROFILE_ID = 'way4'
and srv.STAND='NOTEBOOK' and srv.TOPIC_ID = 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto'
order by 1,2
/
comment on table kafka_property_by_sevice is 'вьюха для update нод графов.'
/
comment on column kafka_property_by_sevice.SERVICE_ID is 'Идентификатор графа.'
/
comment on column kafka_property_by_sevice.PROFILE_ID is 'Идентификатор сервиса.'
/
comment on column kafka_property_by_sevice.topic_id is 'Идентификатор профиля.'
/
comment on column kafka_property_by_sevice.STAND is 'Идентификатор профиля.'
/
comment on column kafka_property_by_sevice.derrection is 'Идентификатор профиля.'
/
comment on column kafka_property_by_sevice.TOPIC_NAME is 'Идентификатор профиля.'
/
comment on column kafka_property_by_sevice.ENV_PROP_NAME is 'кей для формирования env файла.'
/
comment on column kafka_property_by_sevice.GRP_PROP is 'группа свойств.'
/
comment on column kafka_property_by_sevice.PROP_ID is 'идентификатор свойства.'
/
comment on column kafka_property_by_sevice.PROP_VALUE is 'Значение свойства.'
/
