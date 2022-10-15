create or replace view kafka_property_by_sevice
as
with srv as (select TOPIC_ID, DKPV.PROP_ID, DKPV.PROP_VALUE, sn.SERVICE_ID, PROFILE_ID,  STAND, sn.TYPE_PROP, TOPIC_NAME, GRP_PROP
             from kafka_topic_by_service sn
             join DICT_KAFKA_PROPERTY_GRP kpg on (kpg.TYPE_READ, kpg.ID) = ((sn.TYPE_PROP, sn.GRP_PROP))
             join DICT_KAFKA_PROP_VALUE DKPV on kpg.TYPE_READ = DKPV.TYPE_PROP and kpg.ID = DKPV.GRP_ID
)
select
    srv.SERVICE_ID, srv.PROFILE_ID,  srv.STAND, srv.PROP_ID, srv.TYPE_PROP,
    lower(srv.TYPE_PROP||'.'||srv.TOPIC_NAME)||'.'||srv.PROP_ID env_prop_name, prp.PROPERTY_VAL
from srv
join KAFKA_PROP_VALUE_by_STAND prp on (prp.GRP_ID, prp.TYPE_PROP, prp.PROP_ID, prp.STAND) = ((srv.GRP_PROP,srv.TYPE_PROP, srv.PROP_ID,  srv.STAND ))

-- where srv.SERVICE_ID = 'mdm-enrichment' and srv.PROFILE_ID = 'way4'
-- and srv.STAND='IFT'
--   and srv.TOPIC_ID = 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto'
order by SERVICE_ID, PROFILE_ID, STAND, env_prop_name
/
comment on table kafka_property_by_sevice is 'вьюха для update нод графов.'
/
comment on column kafka_property_by_sevice.SERVICE_ID is 'Идентификатор графа.'
/
comment on column kafka_property_by_sevice.PROFILE_ID is 'Идентификатор сервиса.'
/
comment on column kafka_property_by_sevice.STAND is 'Идентификатор профиля.'
/
comment on column kafka_property_by_sevice.ENV_PROP_NAME is 'кей для формирования env файла.'
/
comment on column kafka_property_by_sevice.PROP_ID is 'идентификатор свойства.'
/
comment on column kafka_property_by_sevice.PROPERTY_VAL is 'идентификатор свойства.'
/
comment on column kafka_property_by_sevice.TYPE_PROP is 'идентификатор свойства.'
/