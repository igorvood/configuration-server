insert into dict_topic_consumer_property(GRP_ID, PROP_ID, PROP_VALUE)
  select 'DEFAULT_CONSUMER', 'auto.offset.reset', 'latest' from dual union
select 'DEFAULT_CONSUMER', 'check.crcs', 'true' from dual union
select 'DEFAULT_CONSUMER', 'connections.max.idle.ms', '540000' from dual union
select 'DEFAULT_CONSUMER', 'enable.auto.commit', 'true' from dual union
select 'DEFAULT_CONSUMER', 'exclude.internal.topics', 'true' from dual union
select 'DEFAULT_CONSUMER', 'fetch.max.bytes', '52428800' from dual union
select 'DEFAULT_CONSUMER', 'fetch.max.wait.ms', '500' from dual union
select 'DEFAULT_CONSUMER', 'fetch.min.bytes', '50' from dual union
select 'DEFAULT_CONSUMER', 'group.id', '${SRV_AND_PROFILE}' from dual union
select 'DEFAULT_CONSUMER', 'heartbeat.interval.ms', '3000' from dual
/