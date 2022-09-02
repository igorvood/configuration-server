mdm-enrichment.uaspdto.local_id = local_id
mdm-enrichment.service.name=mdm-enrichment-step2

mdm-enrichment.savepoint.pref=profileSecond

#mdm-enrichment.consumer.property.bootstrap.servers=d5uasp-apc003lk.corp.dev.vtb:9092,d5uasp-apc003lk.corp.dev.vtb:9092,d5uasp-apc004lk.corp.dev.vtb:9092,d5uasp-apc018lk.corp.dev.vtb:9092,d5uasp-apc025lk.corp.dev.vtb:9092
#mdm-enrichment.consumer.property.security.protocol=SSL

mdm-enrichment.consumer.property.bootstrap.servers=172.20.219.153:9092,172.20.219.153:9091
mdm-enrichment.consumer.property.security.protocol=PLAINTEXT

mdm-enrichment.consumer.property.ssl.key.password=kafkauasppassword
mdm-enrichment.consumer.property.ssl.keystore.location=C:\\Work\\uasp-streaming-mdm-enrichment\\src\\main\\resources\\kafka-trust.pfx
mdm-enrichment.consumer.property.ssl.keystore.password=kafkauasppassword
mdm-enrichment.consumer.property.ssl.truststore.location=C:\\Work\\uasp-streaming-mdm-enrichment\\src\\main\\resources\\APD00.13.01-USBP-kafka-cluster-uasp.pfx
mdm-enrichment.consumer.property.ssl.truststore.password=kafkauasppassword

mdm-enrichment.producer.property.bootstrap.servers=172.20.219.153:9092,172.20.219.153:9091
mdm-enrichment.producer.property.security.protocol=PLAINTEXT

mdm-enrichment.producer.property.ssl.key.password=kafkauasppassword
mdm-enrichment.producer.property.ssl.keystore.location=C:\\Work\\uasp-streaming-mdm-enrichment\\src\\main\\resources\\kafka-trust.pfx
mdm-enrichment.producer.property.ssl.keystore.password=kafkauasppassword
mdm-enrichment.producer.property.ssl.truststore.location=C:\\Work\\uasp-streaming-mdm-enrichment\\src\\main\\resources\\APD00.13.01-USBP-kafka-cluster-uasp.pfx
mdm-enrichment.producer.property.ssl.truststore.password=kafkauasppassword
mdm-enrichment.producer.property.transactional.id=enrichment_transactional_id_second

mdm-enrichment.enrichOne.MainEnrichProperty$.fromTopic=dev_bevents__realtime__enrichment__prof__contract_num__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.toTopicName=dev_bevents__realtime__enrichment__prof__mdm_id__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.dlqTopic=dev_bevents__realtime__enrichment__prof__transactions_with_clientid__dlq

mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldName=customer_id
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldType=String
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.toFieldName=calculate-customer_id
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.mainProcessTimestampField=way4_process_timestamp
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromTopic=dev_bevents__batch__ca_regulatory_client_id_of_profile__uaspdto
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.toTopicName=dev_bevents__batch__regulatory_client_id_of_profile__clientid__status

