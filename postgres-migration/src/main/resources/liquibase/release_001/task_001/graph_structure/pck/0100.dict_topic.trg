create or replace function  dict_topic_ins_trg(GRAPH_ID_PAR varchar, NODE_ID_PAR varchar)
    returns  varchar
    language plpgsql
as $$
BEGIN
  insert into DICT_ABSTRACT_GRAPH_NODE(GRAPH_ID, NODE_TYPE, NODE_ID) values (GRAPH_ID_PAR, 'topic', NODE_ID_PAR);

  insert into DICT_TOPIC_NODE(id, DEV_NAME) values (NODE_ID_PAR, NODE_ID_PAR);
  RETURN '';
END;  $$
/
