insert into dict_topic_producer_property(GRP_ID, PROP_ID, PROP_VALUE)
select 'DEFAULT_PRODUCER', 'acks', 'all' from dual union
select 'DEFAULT_PRODUCER', 'enable.idempotence', 'true' from dual union
select 'DEFAULT_PRODUCER', 'max.block.ms', '90000' from dual union
select 'DEFAULT_PRODUCER', 'retries', '1' from dual union
select 'DEFAULT_PRODUCER', 'transaction.timeout.ms', '30000' from dual
/