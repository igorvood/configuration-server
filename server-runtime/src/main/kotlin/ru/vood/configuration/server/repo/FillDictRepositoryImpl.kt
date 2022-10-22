package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.jdbc.core.PreparedStatementCallback
import org.springframework.jdbc.core.PreparedStatementCreator
import org.springframework.stereotype.Repository
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.intf.FillDictRepository
import java.sql.CallableStatement

@Repository
class FillDictRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : FillDictRepository {

    override fun dictServiceInsert(graphFlinkServiceProfile: GraphFlinkServiceProfile) {
        jdbcTemplate.execute(PreparedStatementCreator { con ->
            val cs: CallableStatement = con.prepareCall(
                """
                insert into DICT_SERVICE_INS(GRAPH_ID, SERVICE_ID, PROFILE_ID, MAIN_CLASS)
                values (?, ?, ?, ?)"""
            )
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
            val cs: CallableStatement = con.prepareCall(
                """
                insert into dict_topic_ins(GRAPH_ID, NODE_ID)
                values (?, ?)"""
            )
            cs.setString(1, graphId)
            cs.setString(2, topicName)
            cs
        }, PreparedStatementCallback { ps ->
            ps.execute()
            1
        })
    }

    override fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    ) {
        val beginNode = if (direction == Direction.IN) {
            topicName
        } else "$serviceId~$profileId"

        val endNode = if (direction == Direction.IN) {
            "$serviceId~$profileId"
        } else topicName


        jdbcTemplate.execute(PreparedStatementCreator { con ->
            val cs: CallableStatement = con.prepareCall(
                """
                insert into DICT_ARROW(GRAPH_ID, BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID, PROPERTY_KEY)
                values (?, ?, ?, ?, ?, ?)
                """
            )
            cs.setString(1, graphId)
            cs.setString(2, direction.nodeTypeBegin)
            cs.setString(3, beginNode)
            cs.setString(4, direction.nodeTypeEnd)
            cs.setString(5, endNode)
            cs.setString(6, propertyKey)
            cs
        }, PreparedStatementCallback { ps ->
            ps.execute()
            1
        })
    }

    override fun dictFlinkPropertyInsert(
        serviceId: String,
        profileId: String,
        propertyPut: PropertyPut,
    ) {
        jdbcTemplate.execute(PreparedStatementCreator { con ->
            val cs: CallableStatement = con.prepareCall(
                """
                insert into DICT_FLINK_PROP_VALUE(SERVICE_ID, PROFILE_ID, PROP_ID, PROP_VALUE, IS_FUNCTION)
                values (?, ?, ?, ?, ?)
                """
            )
            cs.setString(1, serviceId)
            cs.setString(2, profileId)
            cs.setString(3, propertyPut.name)
            cs.setString(4, propertyPut.value)
            cs.setInt(5, 0)
            cs
        }, PreparedStatementCallback { ps ->
            ps.execute()
            1
        })

    }


}