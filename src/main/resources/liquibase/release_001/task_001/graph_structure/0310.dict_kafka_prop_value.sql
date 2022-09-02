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
    used_notebook_val as (nvl(notebook_val, prop_value)),
    notebook_dso_val varchar2(256),
    used_notebook_dso_val as (nvl(notebook_dso_val, prop_value)),
    ift_val varchar2(256),
    used_ift_val as (nvl(ift_val, prop_value)),
    nt_val varchar2(256),
    used_nt_val as (nvl(nt_val, prop_value)),
    real_val varchar2(256),
    used_real_val as (nvl(real_val, prop_value)),
    p0_val varchar2(256),
    used_p0_val as (nvl(p0_val, prop_value))
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
comment on column dict_kafka_prop_value.used_notebook_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.notebook_dso_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.used_notebook_dso_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.ift_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.used_ift_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.nt_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.used_nt_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.real_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.used_real_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.p0_val is 'Идентификатор группы продьюсера.'
/
comment on column dict_kafka_prop_value.used_p0_val is 'Идентификатор группы продьюсера.'
/