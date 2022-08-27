create table dict_service_profile_topic
(
  service_id varchar2(256) not null,
  profile_id varchar2(256) not null,
  constraint dict_service_profile_topic_service_id_fk foreign key (service_id, profile_id) references dict_service_profile(service_id, id),
  producer_topic_id varchar2(256),
  producer_prop_grp_ref varchar2(256),
  consumer_topic_id varchar2(256),
  consumer_prop_grp_ref varchar2(256),
  constraint dict_service_profile_topic_prod_cns_ck check (
    ((producer_topic_id is not null and producer_prop_grp_ref is not null)
     or
     ( consumer_topic_id is not null and consumer_prop_grp_ref is not null )
    ) and (
        (producer_topic_id is null and consumer_topic_id is not null) or
        (producer_topic_id is not null and consumer_topic_id is null)
        )
  ),
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