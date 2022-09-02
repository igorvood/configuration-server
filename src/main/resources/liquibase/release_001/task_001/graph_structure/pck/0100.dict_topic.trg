create or replace trigger dict_topic_ins_trg
    INSTEAD OF INSERT ON dict_topic_ins
    FOR EACH ROW
DECLARE

BEGIN
  insert into DICT_ABSTRACT_GRAPH_NODE(GRAPH_ID, NODE_TYPE, NODE_ID) values (:NEW.GRAPH_ID, 'topic', :NEW.NODE_ID);

  insert into DICT_TOPIC_NODE(id, DEV_NAME) values (:NEW.NODE_ID, :NEW.NODE_ID);

END;
/
