create table dict_kafka_prop_value
(
    grp_id varchar(256) not null,
    type_prop varchar(256) not null,
    constraint dict_kafka_prop_value_type_prop_ck check ( type_prop in ('prd', 'cns') ),
    prop_id varchar(256) not null,
    constraint dict_kafka_prop_value_pk primary key (type_prop, grp_id, prop_id),
    prop_value varchar(256) not null,
    constraint dict_kafka_prop_value_prop_value_ref_fk foreign key (type_prop, grp_id ) references dict_kafka_property_grp(type_read, id),
    constraint dict_kafka_prop_value_prp_fk foreign key (type_prop, prop_id) references dict_kafka_prop (type_prop, prop_id),
    notebook_val varchar(256),
    used_notebook_val varchar(256) generated always as (coalesce(notebook_val, prop_value)) stored,
    notebook_dso_val varchar(256),
    used_notebook_dso_val varchar(256) generated always as (coalesce(notebook_dso_val, prop_value)) stored,
    ift_val varchar(256),
    used_ift_val varchar(256) generated always as (coalesce(ift_val, prop_value)) stored,
    nt_val varchar(256),
    used_nt_val varchar(256) generated always as (coalesce(nt_val, prop_value)) stored,
    real_val varchar(256),
    used_real_val varchar(256) generated always as (coalesce(real_val, prop_value)) stored,
    p0_val varchar(256),
    used_p0_val varchar(256) generated always as (coalesce(p0_val, prop_value)) stored
)
/
comment on table dict_kafka_prop_value is 'Справочник групп настроек для топиков.'
/
comment on column dict_kafka_prop_value.grp_id is 'Идентификатор группы свойств'
/
comment on column dict_kafka_prop_value.type_prop is 'Тип группы свойств prd - продьюссер, cns-консьюмер.'
/
comment on column dict_kafka_prop_value.prop_id is 'Идентификатор свойства.'
/
comment on column dict_kafka_prop_value.prop_value is 'Значение свойства.'
/
comment on column dict_kafka_prop_value.notebook_val is 'Значения для стенда notebook пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_notebook_val is 'Используемое значения для стенда notebook.'
/
comment on column dict_kafka_prop_value.notebook_dso_val is 'Значения для стенда notebook_dso пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_notebook_dso_val is 'Используемое значения для стенда notebook_dso.'
/
comment on column dict_kafka_prop_value.ift_val is 'Значения для стенда ift пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_ift_val is 'Используемое значения для стенда ift.'
/
comment on column dict_kafka_prop_value.nt_val is 'Значения для стенда nt пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_nt_val is 'Используемое значения для стенда nt.'
/
comment on column dict_kafka_prop_value.real_val is 'Значения для стенда real пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_real_val is 'Используемое значения для стенда real.'
/
comment on column dict_kafka_prop_value.p0_val is 'Значения для стенда p0 пусто - будет использоваться зн по умолчанию из prop_value.'
/
comment on column dict_kafka_prop_value.used_p0_val is 'Используемое значения для стенда po.'
/