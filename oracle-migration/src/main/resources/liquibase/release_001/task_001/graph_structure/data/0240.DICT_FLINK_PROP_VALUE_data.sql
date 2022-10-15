begin
INSERT INTO DICT_FLINK_PROP_VALUE (SERVICE_ID, PROFILE_ID, PROP_ID, PROP_VALUE, IS_FUNCTION)
select 'mdm-enrichment', 'way4', 'mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldName', 'global_id', 0 from dual union all
select 'mdm-enrichment', 'way4', 'mdm-enrichment.enrichOne.GlobalIdEnrichProperty$.fromFieldType', 'String', 0 from dual union all
select 'mdm-enrichment', 'way4', 'mdm-enrichment.service.name', 'SERVICE_NAME', 1 from dual;
end;
/