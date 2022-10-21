DO $$
    declare
        tuple2_v record;
        v varchar;
    begin
        for tuple2_v in
    select 'graph_1' GRAPH_ID, 'Additional_enrich' SERVICE_ID, 'case_65' PROFILE_ID, 'MainClass1' MAIN_CLASS from dual union
    select 'graph_1', 'Filter', 'case_65', 'MainClass2' from dual union
    select 'graph_1', 'Mutator', 'case_65', 'MainClass3' from dual union
    select 'way4', 'mdm-enrichment', 'way4', 'ru.vtb.uasp.mdm.enrichment.EnrichmentJob' from dual
            loop
            --                 null;
--                 call DICT_SERVICE_INS_trg(tuple2_v.GRAPH_ID, tuple2_v.SERVICE_ID, tuple2_v.PROFILE_ID, tuple2_v.MAIN_CLASS);
                select '1' into v from DICT_SERVICE_INS_trg(tuple2_v.GRAPH_ID, tuple2_v.SERVICE_ID, tuple2_v.PROFILE_ID, tuple2_v.MAIN_CLASS);
            end loop;

    end;
$$;
/
commit ;
/