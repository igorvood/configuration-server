create table dict_kafka_prop_value
(
    grp_id varchar2(256) not null,
    type_prop varchar2(256) not null,
    constraint dict_kafka_prop_value_type_prop_ck check ( type_prop in ('prd', 'cns') ),
    prop_id varchar2(256) not null,
    constraint dict_kafka_prop_value_pk primary key (type_prop, grp_id, prop_id) using index tablespace t_idx compress 1,
    prop_value varchar2(256) not null,
    constraint dict_kafka_prop_value_prop_value_ref_fk foreign key (type_prop, grp_id ) references dict_kafka_property_grp(type_read, id),
    constraint dict_kafka_prop_value_prp_fk foreign key (type_prop, prop_id) references dict_kafka_prop (type_prop, prop_id),
    notebook_val varchar2(256),
    notebook_used_val as (nvl(notebook_val, prop_value)),
    notebook_dso_val varchar2(256),
    notebook_dso_used_val as (nvl(notebook_dso_val, prop_value)),
    ift_val varchar2(256),
    ift_used_val as (nvl(ift_val, prop_value)),
    nt_val varchar2(256),
    nt_used_val as (nvl(nt_val, prop_value)),
    real_val varchar2(256),
    real_used_val as (nvl(real_val, prop_value)),
    p0_val varchar2(256),
    p0_used_val as (nvl(p0_val, prop_value))
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
comment on column dict_kafka_prop_value.notebook_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.notebook_used_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.notebook_dso_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.notebook_dso_used_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.ift_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.ift_used_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.nt_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.nt_used_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.real_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.real_used_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.p0_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.p0_used_val is 'Идентификатор группы продьюсера.'
/