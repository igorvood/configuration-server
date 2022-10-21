DO $$
    declare
        tuple2_v record;
        v varchar;
    begin
        for tuple2_v in

select 'graph_1' as f1, 'dev_ivr__uasp_realtime__business_rules__uaspdto' as f2 from dual union
select 'graph_1', 'Filter_producer_1' from dual union
select 'graph_1', 'Filter_producer_2' from dual union
select 'graph_1', 'ivr__uasp_realtime__bussiness_rules__uaspdto__dlq' from dual union
select 'graph_1', 'mutator_consumer_2' from dual union
select 'graph_1', 'uasp_mutator_filter_input' from dual union
select 'graph_1', 'uasp_mutator_filter_input_2' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mdm_cross_link__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__status' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__mortgage__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__input_converter__way4_issuing_operation__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__for_additional_enrichment__uaspdto' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__mdm_cross_link__status' from dual union
select 'way4', 'dev_ivr__uasp_realtime__mdm_enrichment__uaspdto' from dual
            loop
            --                 null;

--                call dict_topic_ins_trg(tuple2_v.f1, tuple2_v.f2);
                select '1' into v from dict_topic_ins_trg(tuple2_v.f1, tuple2_v.f2);
--                commit;
            end loop;
    end;
$$;
/

commit;
/
