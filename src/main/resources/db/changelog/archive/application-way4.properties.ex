mdm-enrichment.service.name=mdm-enrichment-way4

mdm-enrichment.uaspdto.local_id = local_id

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
mdm-enrichment.producer.property.transactional.id=enrichment_transactional_id_way4

mdm-enrichment.enrichOne.MainEnrichProperty$.fromTopic=dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.toTopicName=dev_ivr__uasp_realtime__mdm_enrichment__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.dlqTopic=dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto

mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldName=global_id
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldType=String
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.toFieldName=global_id
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.mainProcessTimestampField=way4_process_timestamp
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromTopic=dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto
mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.toTopicName=dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status

mdm-enrichment.enrich.hypothec.fromFieldName=is_mortgage
mdm-enrichment.enrich.hypothec.fromFieldType=Boolean
mdm-enrichment.enrich.hypothec.toFieldName=is_mortgage
mdm-enrichment.enrich.hypothec.fromTopic=dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto
mdm-enrichment.enrich.hypothec.toTopicName=dev_ivr__uasp_realtime__input_converter__mortgage__status
mdm-enrichment.enrich.hypothec.isOptionalEnrichValue=true
