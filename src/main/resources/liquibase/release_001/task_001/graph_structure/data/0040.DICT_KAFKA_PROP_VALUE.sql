

begin

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'bootstrap.servers', '172.20.219.153:9092,172.20.219.153:9091');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'security.protocol', 'PLAINTEXT');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'ssl.key.password', 'kafkauasppassword');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'ssl.keystore.location', 'C:\\Work\\secret\\kafka-trust.pfx');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'ssl.keystore.password', 'kafkauasppassword');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'ssl.truststore.location', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'ssl.truststore.password', 'kafkauasppassword');

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'auto.offset.reset', 'latest');

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'check.crcs', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'connections.max.idle.ms', '540000');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'enable.auto.commit', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'exclude.internal.topics', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.bytes', '52428800');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.wait.ms', '500');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.min.bytes', '50');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'group.id', '${SRV_AND_PROFILE}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'heartbeat.interval.ms', '3000');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'acks', 'all');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'enable.idempotence', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'max.block.ms', '90000');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'retries', '1');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'transaction.timeout.ms', '30000');

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'bootstrap.servers', '172.20.219.153:9092,172.20.219.153:9091');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'security.protocol', 'PLAINTEXT');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'ssl.key.password', 'kafkauasppassword');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'ssl.keystore.location', 'C:\\Work\\secret\\kafka-trust.pfx');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'ssl.keystore.password', 'kafkauasppassword');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'ssl.truststore.location', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'ssl.truststore.password', 'kafkauasppassword');

end;
/