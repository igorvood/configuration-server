create or replace view flink_property_by_stand as
with stand as (
    select COLUMN_VALUE stand
    from table ( sys.ODCIVARCHAR2LIST(
       'NOTEBOOK',
       'NOTEBOOK_DSO',
       'DSO',
        'IFT',
        'NT',
        'REAL',
        'P0'
        )
        )
)
select s.ID SERVICE_ID, DSN.PROFILE_ID, st.STAND, DFPV.PROP_ID, DFPV.PROP_VALUE from DICT_SERVICE s
    join DICT_SERVICE_NODE DSN on s.ID = DSN.SERVICE_ID
    join DICT_FLINK_PROP_VALUE DFPV on DSN.SERVICE_ID = DFPV.SERVICE_ID and DSN.PROFILE_ID = DFPV.PROFILE_ID
    cross join stand st
/
comment on table flink_property_by_stand is 'вьюха для update нод графов.'
/
comment on column flink_property_by_stand.SERVICE_ID is 'Идентификатор графа.'
/
comment on column flink_property_by_stand.PROFILE_ID is 'Идентификатор сервиса.'
/
comment on column flink_property_by_stand.STAND is 'Идентификатор профиля.'
/
comment on column flink_property_by_stand.PROP_ID is 'идентификатор свойства.'
/
comment on column flink_property_by_stand.PROP_VALUE is 'идентификатор свойства.'
/
