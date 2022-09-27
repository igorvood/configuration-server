declare
    l_topics topics;
begin
    with t as (
        SELECT 'out' dirrection , 'dev_rto_batch_ca_customer_card_uaspdto__dlq' topic_name, 'enrichOne.GlobalIdEnrichProperty$.dlqTopic' prop_name from DUAL union
        SELECT 'in', 'dev_rto_batch_ca_customer_card_uaspdto', 'enrichOne.GlobalIdEnrichProperty$.fromTopic' from DUAL union
        SELECT 'out', 'dev_rto_batch_ca_customer_card_uaspdto__status', 'enrichOne.GlobalIdEnrichProperty$.toTopicName' from DUAL union
        SELECT 'out', 'dev_bevents_card_agreement_enrich_dlq', 'enrichOne.MainEnrichProperty$.dlqTopic' from DUAL union
        SELECT 'in', 'dev_bevents_streaming_input_convertor_profile_auth_uaspdto', 'enrichOne.MainEnrichProperty$.fromTopic' from DUAL union
        SELECT 'out', 'dev_bevents_card_agreement_enrich_out_uaspdto', 'enrichOne.MainEnrichProperty$.toTopicName' from DUAL
    )
    select * BULK COLLECT INTO l_topics
    from t;

    create_all.create_srv(
            'very_big111',
        'enrichment111',
        'prof_auth111',
            'ru.vtb.uasp.mdm.enrichment.EnrichmentJob1111',
            l_topics
        );
end;
/
    declare
    graph_id_l  varchar2 := 'very_big';
begin

    insert into dict_topic_ins(GRAPH_ID, NODE_ID)
    SELECT 'very_big', 'dev_rto_batch_ca_customer_card_uaspdto__dlq' from DUAL union
    SELECT 'very_big', 'dev_rto_batch_ca_customer_card_uaspdto' from DUAL union
    SELECT 'very_big', 'dev_rto_batch_ca_customer_card_uaspdto__status' from DUAL union
    SELECT 'very_big', 'dev_bevents_card_agreement_enrich_dlq' from DUAL union
    SELECT 'very_big', 'dev_bevents_streaming_input_convertor_profile_auth_uaspdto' from DUAL union
    SELECT 'very_big', 'dev_bevents_card_agreement_enrich_out_uaspdto' from DUAL

end;

/
insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID, MAIN_CLASS)
SELECT 'very_big', 'mdm-enrichment', 'prof-auth', 'ru.vtb.uasp.mdm.enrichment.EnrichmentJob' from DUAL
/
with topic as (
SELECT 'out' dirrection , 'dev_rto_batch_ca_customer_card_uaspdto__dlq' topic_name, 'enrichOne.GlobalIdEnrichProperty$.dlqTopic' prop_name from DUAL union
SELECT 'in', 'dev_rto_batch_ca_customer_card_uaspdto', 'enrichOne.GlobalIdEnrichProperty$.fromTopic' from DUAL union
SELECT 'out', 'dev_rto_batch_ca_customer_card_uaspdto__status', 'enrichOne.GlobalIdEnrichProperty$.toTopicName' from DUAL union
SELECT 'out', 'dev_bevents_card_agreement_enrich_dlq', 'enrichOne.MainEnrichProperty$.dlqTopic' from DUAL union
SELECT 'in', 'dev_bevents_streaming_input_convertor_profile_auth_uaspdto', 'enrichOne.MainEnrichProperty$.fromTopic' from DUAL union
SELECT 'out', 'dev_bevents_card_agreement_enrich_out_uaspdto', 'enrichOne.MainEnrichProperty$.toTopicName' from DUAL
)
select 'very_big' GRAPH_ID,
       case dirrection
         when 'in' then topic_name
         when 'out' then 'mdm-enrichment'
       end BEG_NODE_TYPE,
       from topic

/

insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID, PROPERTY_KEY)
commit
/