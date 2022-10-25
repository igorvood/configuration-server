create or replace view ck_env_prop_unique as
with a as (
    select SERVICE_ID, PROFILE_ID, PROP_ID, count(1)
    from FULL_FLINK_SERVICE_PROPERTY_STAND
    where SERVICE_ID = 'Filter' and STAND = 'DSO'
    having  count(1)>1
    group by SERVICE_ID, PROFILE_ID, PROP_ID
)
select a.SERVICE_ID, a.PROFILE_ID, a.PROP_ID, s.TYPE_PROPERTY
from a
         join FULL_FLINK_SERVICE_PROPERTY_STAND s on (a.SERVICE_ID, a.PROFILE_ID, a.PROP_ID) = ((s.SERVICE_ID, s.PROFILE_ID, s.PROP_ID))
group by a.SERVICE_ID, a.PROFILE_ID, a.PROP_ID, s.TYPE_PROPERTY
/
comment on table ck_env_prop_unique is 'Проверка уникальности ключей пропертей.'
/
comment on column ck_env_prop_unique.SERVICE_ID is 'Сервис.'
/
comment on column ck_env_prop_unique.PROFILE_ID is 'Профиль.'
/
comment on column ck_env_prop_unique.PROP_ID is 'Ключ проперти.'
/
comment on column ck_env_prop_unique.TYPE_PROPERTY is 'Источник проперти.'
/

