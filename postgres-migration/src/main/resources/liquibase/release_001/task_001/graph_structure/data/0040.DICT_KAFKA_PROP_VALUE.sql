DO $$

begin
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'bootstrap.servers', '${BOOTSTRAP_SERVERS}', '172.20.219.153:9092,172.20.219.153:9091', null, null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'bootstrap.servers', '${BOOTSTRAP_SERVERS}', '172.20.219.153:9092,172.20.219.153:9091', null, null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'security.protocol', 'SSL', 'PLAINTEXT', null, null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'security.protocol', 'SSL', 'PLAINTEXT', null, null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'ssl.key.password', '${DSO_KAFKA_SSL_KEY_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_KEY_PASSWORD}', '${NT_KAFKA_SSL_KEY_PASSWORD}', '${REAL_KAFKA_SSL_KEY_PASSWORD}', '${P0_KAFKA_SSL_KEY_PASSWORD}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'ssl.key.password', '${DSO_KAFKA_SSL_KEY_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_KEY_PASSWORD}', '${NT_KAFKA_SSL_KEY_PASSWORD}', '${REAL_KAFKA_SSL_KEY_PASSWORD}', '${P0_KAFKA_SSL_KEY_PASSWORD}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'ssl.keystore.location', '${KEYSTORE_LOCATION} ', 'C:\\Work\\secret\\kafka-trust.pfx', 'C:\\Work\\secret\\kafka-trust.pfx', null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'ssl.keystore.location', '${KEYSTORE_LOCATION} ', 'C:\\Work\\secret\\kafka-trust.pfx', 'C:\\Work\\secret\\kafka-trust.pfx', null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'ssl.keystore.password', '${DSO_KAFKA_SSL_KEYSTORE_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_KEYSTORE_PASSWORD}', '${NT_KAFKA_SSL_KEYSTORE_PASSWORD}', '${REAL_KAFKA_SSL_KEYSTORE_PASSWORD}', '${P0_KAFKA_SSL_KEYSTORE_PASSWORD}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'ssl.keystore.password', '${DSO_KAFKA_SSL_KEYSTORE_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_KEYSTORE_PASSWORD}', '${NT_KAFKA_SSL_KEYSTORE_PASSWORD}', '${REAL_KAFKA_SSL_KEYSTORE_PASSWORD}', '${P0_KAFKA_SSL_KEYSTORE_PASSWORD}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'ssl.truststore.location', '${TRUSTSTORE_LOCATION}', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx', null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'ssl.truststore.location', '${TRUSTSTORE_LOCATION}', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx', 'C:\\Work\\secret\\APD00.13.01-USBP-kafka-cluster-uasp.pfx', null, null, null, null);
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('consumer_default', 'cns', 'ssl.truststore.password', '${DSO_KAFKA_SSL_TRUSTSTORE_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${NT_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${REAL_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${P0_KAFKA_SSL_TRUSTSTORE_PASSWORD}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE, NOTEBOOK_VAL, NOTEBOOK_DSO_VAL, IFT_VAL, NT_VAL, REAL_VAL, P0_VAL) VALUES ('producer_default', 'prd', 'ssl.truststore.password', '${DSO_KAFKA_SSL_TRUSTSTORE_PASSWORD}', 'kafkauasppassword', 'kafkauasppassword', '${IFT_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${NT_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${REAL_KAFKA_SSL_TRUSTSTORE_PASSWORD}', '${P0_KAFKA_SSL_TRUSTSTORE_PASSWORD}');

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'auto.offset.reset', 'latest');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'check.crcs', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'connections.max.idle.ms', '540000');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'enable.auto.commit', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'exclude.internal.topics', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.bytes', '52428800');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.max.wait.ms', '500');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'fetch.min.bytes', '50');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'group.id', '${PROFILE}');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('consumer_default', 'cns', 'heartbeat.interval.ms', '3000');

INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'acks', 'all');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'enable.idempotence', 'true');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'max.block.ms', '90000');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'retries', '1');
INSERT INTO DICT_KAFKA_PROP_VALUE (GRP_ID, TYPE_PROP, PROP_ID, PROP_VALUE) VALUES ('producer_default', 'prd', 'transaction.timeout.ms', '30000');

end;
$$;
/
commit;
/