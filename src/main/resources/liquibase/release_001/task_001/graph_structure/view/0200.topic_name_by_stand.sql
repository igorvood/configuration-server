-- create or replace view topic_name_by_stand
-- as
 select *
              from DICT_TOPIC_NODE
/
select *
from DICT_ARROW where GRAPH_ID = 'way4'
/
comment on table kafka_property_by_sevice is 'вьюха для update нод графов.'
/
comment on column kafka_property_by_sevice.graph_id is 'Идентификатор графа.'
/
comment on column kafka_property_by_sevice.SERVICE_ID is 'Идентификатор сервиса.'
/
comment on column kafka_property_by_sevice.PROFILE_ID is 'Идентификатор профиля.'
/
