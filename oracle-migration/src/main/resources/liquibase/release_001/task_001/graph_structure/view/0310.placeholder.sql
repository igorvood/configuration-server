create or replace view placeholder as
with ph as (
    select SERVICE_ID, PROFILE_ID, STAND, PROP_ID, PROP_VALUE, INSTR(PROP_VALUE, '${') begin_index, INSTR(PROP_VALUE, '}') end_index
    from FULL_FLINK_SERVICE_PROPERTY_STAND
)
select distinct SERVICE_ID, PROFILE_ID, STAND, PROP_VALUE from ph
where ph.begin_index>0 and ph.end_index>0 and ph.begin_index<ph.end_index
/
comment on table placeholder is 'Все значения свойств с плейсхолдерами.'
/
comment on column placeholder.PROP_VALUE is 'Значение свойства.'
/

