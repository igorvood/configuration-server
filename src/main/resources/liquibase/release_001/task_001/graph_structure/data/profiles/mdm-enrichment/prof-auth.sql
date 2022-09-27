declare
    l_topics topics;
    l_graph_id  varchar2(256) := 'very_big';
    l_SERVICE_ID varchar2(256) := 'mdm_enrichment';
    l_PROFILE_ID varchar2(256) := 'prof_auth';
    l_MAIN_CLASS varchar2(256) := 'ru.vtb.uasp.mdm.enrichment.EnrichmentJob';

begin
    with t as (
        SELECT 'out' dirrection , 'dev_rto_batch_ca_customer_card_uaspdto__dlq' topic_name, 'enrichOne.GlobalIdEnrichProperty$.dlqTopic' prop_name from DUAL union
        SELECT 'in', 'dev_rto_batch_ca_customer_card_uaspdto', 'enrichOne.GlobalIdEnrichProperty$.fromTopic' from DUAL union
        SELECT 'out', 'dev_rto_batch_ca_customer_card_uaspdto__status', 'enrichOne.GlobalIdEnrichProperty$.toTopicName' from DUAL union
        SELECT 'out', 'dev_bevents_card_agreement_enrich_dlq', 'enrichOne.MainEnrichProperty$.dlqTopic' from DUAL union
        SELECT 'in', 'dev_bevents_streaming_input_convertor_profile_auth_uaspdto', 'enrichOne.MainEnrichProperty$.fromTopic' from DUAL union
        SELECT 'out', 'dev_bevents_card_agreement_enrich_out_uaspdto', 'enrichOne.MainEnrichProperty$.toTopicName' from DUAL
    )
    select TOPIC(dirrection, topic_name, prop_name) BULK COLLECT INTO l_topics
    from t;

    create_all.create_srv(
            l_graph_id,
            l_SERVICE_ID,
            l_PROFILE_ID,
            l_MAIN_CLASS,
            l_topics
        );
end;
/