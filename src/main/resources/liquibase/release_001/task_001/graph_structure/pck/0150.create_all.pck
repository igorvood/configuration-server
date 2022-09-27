create or replace package create_all as

    procedure create_srv(
        p_graph_id  varchar2,
        p_SERVICE_ID varchar2,
        P_PROFILE_ID varchar2,
        P_MAIN_CLASS varchar2,
        p_topics topics,
        p_propepies_flink PROPERTIES
    );
end;
/
create or replace package body create_all as
    procedure create_srv(
        p_graph_id  varchar2,
        p_SERVICE_ID varchar2,
        P_PROFILE_ID varchar2,
        P_MAIN_CLASS varchar2,
        p_topics topics,
        p_propepies_flink PROPERTIES
    ) as
    begin
        insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID, MAIN_CLASS)
        SELECT p_graph_id, p_SERVICE_ID, P_PROFILE_ID, P_MAIN_CLASS from DUAL;

        insert into dict_topic_ins(GRAPH_ID, NODE_ID)
        select p_graph_id, topic_name from table ( p_topics);


        insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID, PROPERTY_KEY)
        select p_graph_id GRAPH_ID,
               case dirrection
                   when 'in' then 'topic'
                   when 'out' then 'flink_srv'
                   end BEG_NODE_TYPE,
               case dirrection
                   when 'in' then topic_name
                   when 'out' then p_SERVICE_ID||'~'||P_PROFILE_ID
                   end BEG_NODE_ID,
               case dirrection
                   when 'out' then 'topic'
                   when 'in' then 'flink_srv'
                   end END_NODE_TYPE,
               case dirrection
                   when 'out' then topic_name
                   when 'in' then p_SERVICE_ID||'~'||P_PROFILE_ID
                   end END_NODE_ID,
               prop_name PROPERTY_KEY
        from table ( p_topics);
        
        insert into DICT_FLINK_PROP_VALUE(SERVICE_ID, PROFILE_ID, PROP_ID, PROP_VALUE, IS_FUNCTION)
        select p_SERVICE_ID, P_PROFILE_ID, prop_id, prop_value, is_function
        from table(p_propepies_flink);


        commit;
    end;
end;
/
