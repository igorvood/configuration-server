create or replace view topic_name_by_stand
as
select id topic_id, stand, topic_name FROM DICT_TOPIC_NODE
    UNPIVOT(
    topic_name  -- unpivot_clause
    FOR stand --  unpivot_for_clause
    IN ( -- unpivot_in_clause
        DEV_NAME AS 'DSO',
        IFT_NAME_REAL AS 'IFT',
        NT_NAME_REAL AS 'NT',
        REAL_NAME_REAL AS 'REAL',
        p0_NAME_REAL AS 'P0'
        )
    )
/
comment on table topic_name_by_stand is 'Имена топиков в разрезе стендов.'
/
comment on column topic_name_by_stand.topic_id is 'Идентификатор графа.'
/
comment on column topic_name_by_stand.stand is 'Тип стенда.'
/
comment on column topic_name_by_stand.topic_name is 'Имя топика.'
/

