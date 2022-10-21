create or replace view dict_service_ins
as
select
  agn.GRAPH_ID,
  DSN.SERVICE_ID,
  DSN.PROFILE_ID,
  ds.MAIN_CLASS
from DICT_ABSTRACT_GRAPH_NODE agn
  join DICT_SERVICE_NODE DSN on agn.NODE_TYPE = DSN.NODE_TYPE and agn.NODE_ID = DSN.ID
  join DICT_SERVICE ds on ds.ID = dsn.SERVICE_ID
/
comment on view dict_service_ins is 'вьюха для update нод графов.'
/
comment on column dict_service_ins.graph_id is 'Идентификатор графа.'
/
comment on column dict_service_ins.SERVICE_ID is 'Идентификатор сервиса.'
/
comment on column dict_service_ins.PROFILE_ID is 'Идентификатор профиля.'
/
comment on column dict_service_ins.MAIN_CLASS is 'Имя главного класса.'
/