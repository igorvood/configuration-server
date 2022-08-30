create or replace view dict_service_ins
as
select
  agn.GRAPH_ID,
  DSN.SERVICE_ID,
  DSN.PROFILE_ID
from DICT_ABSTRACT_GRAPH_NODE agn
  join DICT_SERVICE_NODE DSN on agn.NODE_TYPE = DSN.NODE_TYPE and agn.NODE_ID = DSN.ID
/
comment on table dict_service_ins is 'вьюха для update нод графов.'
/
comment on column dict_service_ins.graph_id is 'Идентификатор графа.'
/
comment on column dict_service_ins.SERVICE_ID is 'Идентификатор сервиса.'
/
comment on column dict_service_ins.PROFILE_ID is 'Идентификатор профиля.'
/