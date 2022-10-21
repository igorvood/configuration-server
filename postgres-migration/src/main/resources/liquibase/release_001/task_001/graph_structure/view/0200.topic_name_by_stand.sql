create or replace view topic_name_by_stand
as
with t as (
  select c.id topic_id, t.topic_name, t.stand
  from DICT_TOPIC_NODE c
    cross join lateral (
        values
            (c.DEV_NAME, 'NOTEBOOK'),
            (c.DEV_NAME, 'NOTEBOOK_DSO'),
            (c.DEV_NAME, 'DSO'),
            (c.IFT_NAME_REAL, 'IFT'),
            (NT_NAME_REAL , 'NT'),
            (REAL_NAME_REAL , 'REAL'),
            (p0_NAME_REAL , 'P0')
        ) as t(topic_name, stand)
)
select t.topic_id, t.topic_name, t.stand from t
  join META_STAND s on s.ID = t.stand

/
comment on view topic_name_by_stand is 'Имена топиков в разрезе стендов.'
/
comment on column topic_name_by_stand.topic_id is 'Идентификатор графа.'
/
comment on column topic_name_by_stand.stand is 'Тип стенда.'
/
comment on column topic_name_by_stand.topic_name is 'Имя топика.'
/


