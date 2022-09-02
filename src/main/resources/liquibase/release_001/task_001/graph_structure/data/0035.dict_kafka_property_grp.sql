insert into dict_kafka_property_grp(ID, TYPE_READ, DESCRIPTION)
SELECT 'consumer_default', 'cns', 'consumer_default' from DUAL union
SELECT 'producer_default', 'prd', 'producer_default' from DUAL
/