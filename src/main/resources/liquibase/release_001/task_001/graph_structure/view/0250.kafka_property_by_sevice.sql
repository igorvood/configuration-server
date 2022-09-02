-- create or replace view kafka_property_by_sevice
-- as
with srv as ( select DAGN.GRAPH_ID, sn.SERVICE_ID, sn.PROFILE_ID, sn.NODE_TYPE, DAGN.NODE_ID
              from DICT_SERVICE_NODE sn
                join DICT_ABSTRACT_GRAPH_NODE DAGN on DAGN.NODE_TYPE = sn.NODE_TYPE and DAGN.NODE_ID = sn.ID
),
from_srv as (select DAGN.SERVICE_ID, DAGN.PROFILE_ID, DA.END_NODE_ID topic, 'out' derrection
             from  srv    DAGN
                       join DICT_ARROW DA on DAGN.GRAPH_ID = DA.GRAPH_ID and DAGN.NODE_TYPE = DA.BEG_NODE_TYPE and DAGN.NODE_ID = DA.BEG_NODE_ID
),
to_srv as (select DAGN.SERVICE_ID, DAGN.PROFILE_ID, DA.BEG_NODE_ID topic, 'in' derrection
                  from  srv    DAGN
                            join DICT_ARROW DA on DAGN.GRAPH_ID = DA.GRAPH_ID and DAGN.NODE_TYPE = DA.end_NODE_TYPE and DAGN.NODE_ID = DA.end_NODE_ID
     ),
all_topic as (
select SERVICE_ID, PROFILE_ID, topic, derrection from from_srv union all
select SERVICE_ID, PROFILE_ID, topic, derrection from to_srv)

select SERVICE_ID, PROFILE_ID, topic, derrection from all_topic

where SERVICE_ID = 'mdm-enrichment' and PROFILE_ID = 'way4'
-- order by 3,4
/
select *
from DICT_ARROW where GRAPH_ID = 'way4'
/
-- comment on table kafka_property_by_sevice is 'вьюха для update нод графов.'
-- /
-- comment on column kafka_property_by_sevice.graph_id is 'Идентификатор графа.'
-- /
-- comment on column kafka_property_by_sevice.SERVICE_ID is 'Идентификатор сервиса.'
-- /
-- comment on column kafka_property_by_sevice.PROFILE_ID is 'Идентификатор профиля.'
-- /
