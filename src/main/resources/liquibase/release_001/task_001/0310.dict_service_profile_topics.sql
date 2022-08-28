create table dict_service_profile_topic
(
  service_id varchar2(256) not null,
  profile_id varchar2(256) not null,
  constraint dict_service_profile_topic_service_id_fk foreign key (service_id, profile_id) references dict_service_profile(service_id, id),
  type_topic varchar2(16) not null,
  constraint dict_service_profile_topic_type_topic_ck check ( type_topic in ('in', 'out', 'unknown') ),
  topic_id varchar2(256) not null,
  topic_grp_ref varchar2(256) not null,

  producer_topic_id as (case when type_topic='out' then topic_id end ),
  producer_prop_grp_ref as (case when type_topic='out' then topic_grp_ref end ),
  consumer_topic_id as (case when type_topic='in' then topic_id end ),
  consumer_prop_grp_ref as (case when type_topic='in' then topic_grp_ref end ),

  constraint dict_service_profile_topic_producer_fk foreign key (producer_topic_id, producer_prop_grp_ref) references dict_topic(id, producer_prop_grp_ref),
  constraint dict_service_profile_topic_consumer_fk foreign key (consumer_topic_id, consumer_prop_grp_ref) references dict_topic(id, consumer_prop_grp_ref)
)
/
comment on table dict_service_profile_topic is 'Справочник топиков сервиса.'
/
comment on column dict_service_profile_topic.profile_id is 'Идентификатор профиля.'
/
comment on column dict_service_profile_topic.service_id is 'Идентификатор сервиса.'
/
comment on column dict_service_profile_topic.consumer_topic_id is 'Идентификатор топика консьюмера.'
/
comment on column dict_service_profile_topic.CONSUMER_PROP_GRP_REF is 'Идентификатор группы свойств консьюмера.'
/
comment on column dict_service_profile_topic.producer_topic_id is 'Идентификатор топика продьюсера.'
/
comment on column dict_service_profile_topic.PRODUCER_PROP_GRP_REF is 'Идентификатор группы свойств продьюсера.'
/
comment on column dict_service_profile_topic.TYPE_TOPIC is 'Тип топика, in, out, unknown.'
/
comment on column dict_service_profile_topic.TOPIC_ID is 'Идентификатор топика.'
/
comment on column dict_service_profile_topic.TOPIC_GRP_REF is 'Идентификатор группы свойств топика.'
/