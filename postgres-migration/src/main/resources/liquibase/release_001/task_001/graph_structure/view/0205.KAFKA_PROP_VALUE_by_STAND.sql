create or replace view KAFKA_PROP_VALUE_by_STAND
as
with t as (
select GRP_ID,TYPE_PROP, PROP_ID, stand, property_val
FROM DICT_KAFKA_PROP_VALUE c
         cross join lateral (
    values
        (c.USED_NOTEBOOK_VAL, 'NOTEBOOK'),
        (c.USED_NOTEBOOK_DSO_VAL, 'NOTEBOOK_DSO'),
        (c.PROP_VALUE, 'DSO'),
        (c.USED_IFT_VAL, 'IFT'),
        (USED_NT_VAL , 'NT'),
        (USED_REAL_VAL , 'REAL'),
        (USED_P0_VAL , 'P0')
    ) as t(property_val, stand)
)
select t.GRP_ID, t.TYPE_PROP, t.PROP_ID, t.stand, t.property_val  from t
  join META_STAND s on s.ID = t.stand
/
comment on view KAFKA_PROP_VALUE_by_STAND is 'Значения свойств топиков в разрезе стендов.'
/
comment on column KAFKA_PROP_VALUE_by_STAND.GRP_ID is 'Группа топика.'
/
comment on column KAFKA_PROP_VALUE_by_STAND.TYPE_PROP is 'Тип свойства, для прольюсера или консьюмера.'
/
comment on column KAFKA_PROP_VALUE_by_STAND.PROP_ID is 'идентификатор свойства.'
/
comment on column KAFKA_PROP_VALUE_by_STAND.stand is 'идентификатор стенда.'
/
comment on column KAFKA_PROP_VALUE_by_STAND.property_val is 'Значение свойства.'
/
