package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import ru.vood.configuration.server.controller.dto.Arrow
import ru.vood.configuration.server.controller.dto.FlinkName
import ru.vood.configuration.server.controller.dto.GraphNode
import ru.vood.configuration.server.controller.dto.Topic
import ru.vood.configuration.server.repo.intf.PumlGeneratorRepositoryIntf

@Repository
class PumlGeneratorRepositoryImpl(
    private val jdbcTemplate: JdbcTemplate
) : PumlGeneratorRepositoryIntf {

    override fun findByGraphId(graphId: String): Set<Arrow<out GraphNode, out GraphNode>> =
        jdbcTemplate.query(
            """
            select BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID 
            from DICT_ARROW
            where GRAPH_ID = ?
            """,
            { rs, _ ->
                Arrow(
                    getNode(rs.getString(1), rs.getString(2)),
                    getNode(rs.getString(3), rs.getString(4))
                )
            }, graphId
        ).toSet()


    private fun getNode(typeNode: String, name: String): GraphNode {
        val graphNode: GraphNode = if (typeNode == "topic")
        // TODO Очень плохо так делать, но времени нет, потом переделать
            findTopic(name)
        else FlinkName(name)
        return graphNode
    }

    private fun findTopic(topicId: String): Topic {
        val queryForObject = jdbcTemplate.queryForObject(
            """
            select ID, IS_OUR, CNT_PARTITION from dict_topic_node
            where ID = ?
        """, { rs, _ ->
                Topic(
                    rs.getString(1), rs.getBoolean(2), rs.getInt(3)
                )
            }, topicId
        )
        return queryForObject!!
    }


}