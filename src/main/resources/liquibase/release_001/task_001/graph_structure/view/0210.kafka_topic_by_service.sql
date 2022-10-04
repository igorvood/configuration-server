create or replace view kafka_topic_by_service
as
with srv as ( select DAGN.GRAPH_ID, sn.SERVICE_ID, sn.PROFILE_ID, sn.NODE_TYPE, DAGN.NODE_ID
              from DICT_SERVICE_NODE sn
                join DICT_ABSTRACT_GRAPH_NODE DAGN on DAGN.NODE_TYPE = sn.NODE_TYPE and DAGN.NODE_ID = sn.ID
),
from_srv as (select DAGN.SERVICE_ID, DAGN.PROFILE_ID, DA.END_NODE_ID topic, 'prd' TYPE_PROP
             from  srv    DAGN
                       join DICT_ARROW DA on DAGN.GRAPH_ID = DA.GRAPH_ID and DAGN.NODE_TYPE = DA.BEG_NODE_TYPE and DAGN.NODE_ID = DA.BEG_NODE_ID
),
to_srv as (select DAGN.SERVICE_ID, DAGN.PROFILE_ID, DA.BEG_NODE_ID topic, 'cns' derrection
                  from  srv    DAGN
                            join DICT_ARROW DA on DAGN.GRAPH_ID = DA.GRAPH_ID and DAGN.NODE_TYPE = DA.end_NODE_TYPE and DAGN.NODE_ID = DA.end_NODE_ID
     ),
all_topic as (
select SERVICE_ID, PROFILE_ID, topic, TYPE_PROP from from_srv union all
select SERVICE_ID, PROFILE_ID, topic, derrection from to_srv)

select al.SERVICE_ID,al.PROFILE_ID,al.topic topic_id, tns.STAND,al.TYPE_PROP,tns.TOPIC_NAME,nvl(tn.PRODUCER_PROP_GRP_REF, tn1.CONSUMER_PROP_GRP_REF) grp_prop from all_topic al
join TOPIC_NAME_BY_STAND tns on tns.TOPIC_ID=al.topic
left join DICT_TOPIC_NODE tn on (tn.ID, tn.PRD_TYPE) = ((al.topic, al.TYPE_PROP))
left join DICT_TOPIC_NODE tn1 on (tn1.ID, tn1.CNS_TYPE) = ((al.topic, al.TYPE_PROP))
-- where SERVICE_ID = 'mdm-enrichment' and PROFILE_ID = 'way4'
-- and STAND='IFT'
-- order by 3,4
/
comment on table kafka_topic_by_service is 'вьюха для update нод графов.'
/
comment on column kafka_topic_by_service.SERVICE_ID is 'Идентификатор графа.'
/
comment on column kafka_topic_by_service.PROFILE_ID is 'Идентификатор сервиса.'
/
comment on column kafka_topic_by_service.topic_id is 'Идентификатор профиля.'
/
comment on column kafka_topic_by_service.STAND is 'Идентификатор профиля.'
/
comment on column kafka_topic_by_service.TYPE_PROP is 'Идентификатор профиля.'
/
comment on column kafka_topic_by_service.TOPIC_NAME is 'Идентификатор профиля.'
/

comment on column kafka_topic_by_service.grp_prop is 'Группа свойств кафки.'
/

