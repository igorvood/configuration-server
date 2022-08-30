create or replace trigger dict_service_ins_trg
    INSTEAD OF INSERT ON dict_service_ins
    FOR EACH ROW
DECLARE

BEGIN
  insert into DICT_ABSTRACT_GRAPH_NODE(GRAPH_ID, NODE_TYPE, NODE_ID) values (:NEW.GRAPH_ID, 'flink_srv', :NEW.service_id||'~'||:NEW.profile_id);

  insert into DICT_SERVICE_NODE(SERVICE_ID, PROFILE_ID) values (:NEW.SERVICE_ID, :NEW.PROFILE_ID);

END;
/
