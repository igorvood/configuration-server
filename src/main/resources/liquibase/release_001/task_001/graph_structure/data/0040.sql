
begin
    INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'auto.offset.reset', 'latest');

INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'check.crcs', 'true');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'connections.max.idle.ms', '540000');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'enable.auto.commit', 'true');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'exclude.internal.topics', 'true');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.bytes', '52428800');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.wait.ms', '500');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.min.bytes', '50');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'group.id', '${SRV_AND_PROFILE}');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'heartbeat.interval.ms', '3000');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'acks', 'all');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'enable.idempotence', 'true');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'max.block.ms', '90000');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'retries', '1');
INSERT INTO LOCALDEV.DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'transaction.timeout.ms', '30000');
end;
/