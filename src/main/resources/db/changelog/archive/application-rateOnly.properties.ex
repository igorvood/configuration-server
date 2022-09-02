mdm-enrichment.service.name=mdm-enrichment-rate-only

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
mdm-enrichment.producer.property.transactional.id=enrichment_transactional_id_rate

mdm-enrichment.enrichOne.MainEnrichProperty$.fromTopic=dev_bevents__realtime__enrichment_prepare_transactions__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.toTopicName=dev_bevents__realtime__enrichment_first_salary_transactions__uaspdto
mdm-enrichment.enrichOne.MainEnrichProperty$.dlqTopic=dev_bevents__realtime__enrichment_first_salary_transactions_dlq

mdm-enrichment.enrichOne.RateEnrichProperty$.fromTopic=dev_ivr__uasp_realtime__outer_cbr_rates__json
mdm-enrichment.enrichOne.RateEnrichProperty$.toTopicName=dev_bevents__uasp_realtime__outer_cbr_rate__status
mdm-enrichment.enrichOne.RateEnrichProperty$.dlqTopic=dev_bevents__realtime__enrichment_first_salary_transactions_dlq
mdm-enrichment.enrichOne.RateEnrichProperty$.systemCode=1557_UASP
mdm-enrichment.enrichOne.RateEnrichProperty$.depthCount=14
mdm-enrichment.enrichOne.RateEnrichProperty$.depthOfDay=14
mdm-enrichment.enrichOne.RateEnrichProperty$.enrichRatesCurrencyAlphaCodeFieldName=exchange_currency
mdm-enrichment.enrichOne.RateEnrichProperty$.enrichCurrencyDateFieldName=exchange_dttm
mdm-enrichment.enrichOne.RateEnrichProperty$.reciptCurrencyPriceFieldName=currency_price
mdm-enrichment.enrichOne.RateEnrichProperty$.reciptCurrencyScaleFieldName=currency_scale
mdm-enrichment.enrichOne.RateEnrichProperty$.nationalCurrency=RUR
