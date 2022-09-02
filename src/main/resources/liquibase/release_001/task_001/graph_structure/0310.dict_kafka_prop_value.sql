create table dict_kafka_prop_value
(
    grp_id varchar2(256) not null,
    type_prop varchar2(256) not null,
    constraint dict_kafka_prop_value_type_prop_ck check ( type_prop in ('prd', 'cns') ),
    prop_id varchar2(256) not null,
    constraint dict_kafka_prop_value_pk primary key (type_prop, grp_id, prop_id) using index tablespace t_idx compress 1,
    prop_value varchar2(256) not null,
    producer_grp_ref as ( case when type_prop='prd' then grp_id end ),
    constraint dict_kafka_prop_value_producer_ref_fk foreign key (producer_grp_ref) references dict_kafka_prd_property_grp(id),
    consumer_grp_ref as ( case when type_prop='cns' then grp_id end ),
    constraint dict_kafka_prop_value_consumer_ref_fk foreign key (consumer_grp_ref) references dict_kafka_cns_property_grp(id),
    constraint dict_kafka_prop_value_prp_fk foreign key (type_prop, prop_id) references dict_kafka_prop (type_prop, prop_id)

)
/
comment on table dict_kafka_prop_value is 'Справочник групп настроек для консьюмера топиков.'
/
comment on column dict_kafka_prop_value.grp_id is 'Идентификатор группы свойств'
/
comment on column dict_kafka_prop_value.type_prop is 'Тип группы свойств.'
/
comment on column dict_kafka_prop_value.prop_id is 'Идентификатор свойства.'
/
comment on column dict_kafka_prop_value.prop_value is 'Значение свойства.'
/
comment on column dict_kafka_prop_value.producer_grp_ref is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.consumer_grp_ref is 'Идентификатор группы консьюмера.'
/
