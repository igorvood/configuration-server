create or replace trigger dict_topic_trg
    INSTEAD OF INSERT ON dict_nodes
    FOR EACH ROW
DECLARE

BEGIN
  insert into DICT_ABSTRACT_GRAPH_NODE(GRAPH_ID, NODE_TYPE, NODE_ID) values (:NEW.GRAPH_ID, :NEW.NODE_TYPE, :NEW.NODE_ID);

  if(:NEW.NODE_TYPE = 'topic') then
    insert into DICT_TOPIC_NODE(id) values (:NEW.NODE_ID);
  end if;

  if(:NEW.NODE_TYPE = 'flink_srv') then
      insert into DICT_SERVICE_NODE(id) values (:NEW.NODE_ID);
  end if;

END;
/
