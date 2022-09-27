create or replace procedure enrich is
    l_graph_id  varchar2(256);
    l_SERVICE_ID varchar2(256);
    l_PROFILE_ID varchar2(256);
    l_MAIN_CLASS varchar2(256);
    l_topics topics;
    l_propperties PROPERTIES;
begin
    l_graph_id   := 'very_big';
    l_SERVICE_ID  := 'mdm_enrichment';
    l_PROFILE_ID  := 'prof_auth';
    l_MAIN_CLASS  := 'ru.vtb.uasp.mdm.enrichment.EnrichmentJob';

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

    with p as (
        SELECT 'prop_id' prop_id , 'prop_value' prop_value, 0 is_function from DUAL union
        SELECT 'checkpoint.time.milliseconds', '300000', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a01.fromFieldName', 'mask_card_number', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a01.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a01.toFieldName', 'MASK_CARD_NUMBER', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a02.fromFieldName', 'customer_id', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a02.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a02.toFieldName', 'customer_id', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a03.fromFieldName', 'source_system_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a03.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a03.toFieldName', 'source_system_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a04.fromFieldName', 'pos_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a04.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a04.toFieldName', 'pos_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a05.fromFieldName', 'account_num', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a05.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a05.toFieldName','account_num', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a06.fromFieldName', 'is_virtual_card_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a06.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a06.toFieldName', 'is_virtual_card_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a07.fromFieldName', 'card_expiration_dt', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a07.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a07.toFieldName', 'card_expiration_dt', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a08.fromFieldName', 'payment_system_desc', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a08.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a08.toFieldName', 'payment_system_desc', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a09.fromFieldName', 'card_type_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a09.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a09.toFieldName', 'card_type_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a10.fromFieldName', 'salary_serv_pack_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a10.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a10.toFieldName', 'salary_serv_pack_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a11.fromFieldName', 'salary_project_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a11.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a11.toFieldName', 'salary_project_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a12.fromFieldName','salary_account_scheme_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a12.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a12.toFieldName', 'salary_account_scheme_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a13.fromFieldName', 'salary_card_type_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a13.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a13.toFieldName', 'salary_card_type_flg', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a14.fromFieldName', 'contract_card_type_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a14.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.fieldsList.a14.toFieldName', 'contract_card_type_cd', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.globalEnrichFields.fromFieldName', 'mdm_id', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.globalEnrichFields.fromFieldType', 'String', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.globalEnrichFields.toFieldName', 'calculate-mdm_id', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.isLeftJoin', 'false', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.keySelectorEnrich.isId', 'true', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.keySelectorMain.isId', 'false', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.keySelectorMain.mapKey', 'card_number_sha_256', 0 from DUAL union
        SELECT 'enrichOne.GlobalIdEnrichProperty$.keySelectorMain.mapType', 'String', 0 from DUAL union
        SELECT 'service.name', '${PROFILE_NAME}_${SERVICE_NAME}', 0 from DUAL union
        SELECT 'state.checkpoints.num-retained', '4', 0 from DUAL union
        SELECT 'sync.parallelism', '${PARALLELISM}', 0 from DUAL
    )
    select PROPERTY(prop_id, prop_value, is_function) bulk collect into l_propperties from p;

    create_all.create_srv(
            l_graph_id,
            l_SERVICE_ID,
            l_PROFILE_ID,
            l_MAIN_CLASS,
            l_topics,
            l_propperties
        );
end;
/
begin
    enrich;
end;
/
