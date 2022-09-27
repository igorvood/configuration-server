create or replace view full_flink_service_property_stand as
with
    al as
        (
            select 20 priority, s.service_id, s.profile_id, s.stand, s.prop_id, s.prop_value, 'business' type_property
            from flink_property_by_stand s
            union
            select 100 priority, k.service_id, k.profile_id, k.stand, k.ENV_PROP_NAME, k.PROPERTY_VAL, 'kafka'
            from kafka_property_by_sevice k
            union
            select 10 priority, q.service_id, q.profile_id, q.stand, q.prop_id, q.prop_value, 'topic_name'
            from SERVICE_TOPIC_NAME_BY_STAND q
        )
select * from al
-- where STAND = 'DSO' and SERVICE_ID = 'mdm-enrichment' and PROFILE_ID = 'way4'
-- order by 1, 6
/
select k.service_id, k.profile_id, k.stand, k.prop_id, k.PROPERTY_VAL from kafka_property_by_sevice k
where STAND = 'DSO' and SERVICE_ID = 'mdm-enrichment' and PROFILE_ID = 'way4'
/

comment on table full_flink_service_property_stand is 'вьюха значения всех свойств сервиса.'
/
comment on column full_flink_service_property_stand.priority is 'приоритет для группировки.'
/
comment on column full_flink_service_property_stand.SERVICE_ID is 'Идентификатор сервиса.'
/
comment on column full_flink_service_property_stand.PROFILE_ID is 'Идентификатор профиля.'
/
comment on column full_flink_service_property_stand.STAND is 'Идентификатор стенда.'
/
comment on column full_flink_service_property_stand.PROP_ID is 'идентификатор свойства.'
/
comment on column full_flink_service_property_stand.PROP_VALUE is 'значение свойства.'
/
comment on column full_flink_service_property_stand.type_property is 'тип свойства.'
/
