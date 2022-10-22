package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.jdbc.core.PreparedStatementCallback
import org.springframework.jdbc.core.PreparedStatementCreator
import org.springframework.stereotype.Repository
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile
import ru.vood.configuration.server.repo.intf.FillDictRepository
import java.sql.CallableStatement

@Repository
class FillDictRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : FillDictRepository {

    override fun dictServiceInsert(graphFlinkServiceProfile: GraphFlinkServiceProfile) {
        jdbcTemplate.execute(PreparedStatementCreator { con ->
            val cs: CallableStatement = con.prepareCall("""
                insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID, MAIN_CLASS)
                values (?, ?, ?, ?)""")
            cs.setString(1, graphFlinkServiceProfile.graphId)
            cs.setString(2, graphFlinkServiceProfile.flinkServiceProfile.serviceId.id)
            cs.setString(3, graphFlinkServiceProfile.flinkServiceProfile.profileId)
            cs.setString(4, graphFlinkServiceProfile.flinkServiceProfile.serviceId.mainClass)
            cs
        }, PreparedStatementCallback { ps ->
            ps.execute()
            1
        })
    }

    override fun dictTopicInsert(graphId: String, topicName: String) {
        jdbcTemplate.execute(PreparedStatementCreator { con ->
            val cs: CallableStatement = con.prepareCall("""
                insert into dict_topic_ins(GRAPH_ID, NODE_ID)
                values (?, ?)""")
            cs.setString(1, graphId)
            cs.setString(2, topicName)
            cs
        }, PreparedStatementCallback { ps ->
            ps.execute()
            1
        })
    }


//    insert into dict_topic_ins(GRAPH_ID, NODE_ID)
//    select p_graph_id, topic_name from  p_topics;


}