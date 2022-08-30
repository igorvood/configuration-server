package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.FlinkService
import ru.vood.configurationserver.controller.dto.GraphNode
import ru.vood.configurationserver.controller.dto.Topic
import ru.vood.configurationserver.repo.intf.PumlGeneratorRepositoryIntf

@Service
class PumlGeneratorRepositoryImpl(
    private val jdbcTemplate: JdbcTemplate
) : PumlGeneratorRepositoryIntf {

    override fun findByGraphId(graphId: String): Set<Arrow<out GraphNode, out GraphNode>> =
        jdbcTemplate.query(
            """
            select BEG_NODE_TYPE, BEG_NODE_ID, END_NODE_TYPE, END_NODE_ID 
            from DICT_ARROW
            where GRAPH_ID = :1
            """,
            { rs, _ ->
                Arrow(
                    getNode(rs.getString(1), rs.getString(2)),
                    getNode(rs.getString(3), rs.getString(4))
                )
            }, graphId
        ).toSet()


    private fun getNode(typeNode: String?, name: String): GraphNode {
        val graphNode: GraphNode = if (typeNode == "topic")
            Topic(name)
        else FlinkService(name)
        return graphNode
    }

//    override fun findBySrvIdAndProfileId(srvId: String, profileId: String): Set<FlinkServiceDto> {
//
//        val queryRes = jdbcTemplate.query(
//            """
//            select SERVICE_ID, PROFILE_ID, IN_TOPIC, OUT_TOPIC
//            from report_order_service
//            --where SERVICE_ID = :1 and PROFILE_ID = :2
//            """,
//            { rs, _ ->
//                FlinkServiceDtoTemp(
//                    serviceId = rs.getString(1),
//                    profileId = rs.getString(2),
//                    inTopic = rs.getString(3),
//                    outTopic = rs.getString(4)
//                )
//            }//, srvId, profileId
//        )
//
//        return queryRes
//            .groupBy(keySelector = { d: FlinkServiceDtoTemp -> FlinkServiceProfileDto(d.serviceId, d.profileId) })
//            .map<FlinkServiceProfileDto, List<FlinkServiceDtoTemp>, FlinkServiceDto> { d ->
//                FlinkServiceDto(
//                    srv = d.key,
//                    topics = Topics(
//                        d.value.map { q -> q.inTopic }.distinct(),
//                        d.value.map { q -> q.outTopic }.distinct()
//                    )
//                )
//            }.toSet()
//    }
}