insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID)
-- select 'way4', 'mdm-enrichment', 'way4' from DUAL
    select 'graph_1', 'Additional_enrich', 'case_65' from dual union
    select 'graph_1', 'Filter', 'case_65' from dual union
    select 'graph_1', 'Mutator', 'case_65' from dual union
    select 'way4', 'mdm-enrichment', 'way4' from dual

--
-- select *
-- from DICT_ABSTRACT_GRAPH_NODE agn
-- join DICT_SERVICE_NODE DSN on agn.NODE_TYPE = DSN.NODE_TYPE and agn.NODE_ID = DSN.ID
-- where agn.NODE_TYPE = 'flink_srv'
-- /
--
-- select --GRAPH_ID, NODE_ID,
--        'select '''||GRAPH_ID|| ''', '''||SERVICE_ID|| ''', '''||PROFILE_ID||''' from dual union'
-- from DICT_ABSTRACT_GRAPH_NODE agn
--          join DICT_SERVICE_NODE DSN on agn.NODE_TYPE = DSN.NODE_TYPE and agn.NODE_ID = DSN.ID
-- where agn.NODE_TYPE = 'flink_srv'
-- order by GRAPH_ID, NODE_ID
/
commit
/