create or replace view KAFKA_PROP_VALUE_by_STAND
as
select GRP_ID,TYPE_PROP, PROP_ID, stand, property_val FROM DICT_KAFKA_PROP_VALUE
    UNPIVOT(
    property_val  -- unpivot_clause
    FOR stand --  unpivot_for_clause
    IN ( -- unpivot_in_clause
        USED_NOTEBOOK_VAL AS 'NOTEBOOK',
        USED_NOTEBOOK_DSO_VAL AS 'NOTEBOOK_DSO',
        PROP_VALUE AS 'DSO',
        USED_IFT_VAL AS 'IFT',
        USED_NT_VAL AS 'NT',
        USED_REAL_VAL AS 'REAL',
        USED_P0_VAL AS 'P0'
        )
    )
/
comment on table KAFKA_PROP_VALUE_by_STAND is 'Значения свойств топиков в разрезе стендов.'
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
