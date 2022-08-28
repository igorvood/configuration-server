package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.dto.FlinkServiceDto
import ru.vood.configurationserver.repo.dto.FlinkServiceDtoTemp
import ru.vood.configurationserver.repo.dto.FlinkServiceProfileDto
import ru.vood.configurationserver.repo.dto.Topics
import ru.vood.configurationserver.repo.intf.PumlGeneratorServiceRopository

@Service
class PumlGeneratorServiceRopositoryImpl(
    private val jdbcTemplate: JdbcTemplate
) : PumlGeneratorServiceRopository {
    override fun findBySrvIdAndProfileId(srvId: String, profileId: String): Set<FlinkServiceDto> {

        val queryRes = jdbcTemplate.query("""
            select SERVICE_ID, PROFILE_ID, IN_TOPIC, OUT_TOPIC 
            from report_order_service
            where SERVICE_ID = :1 and PROFILE_ID = :2 """,
            { rs, _ ->
                FlinkServiceDtoTemp(
                    serviceId = rs.getString(1),
                    profileId = rs.getString(2),
                    inTopic = rs.getString(3),
                    outTopic = rs.getString(4)
                )
            }, srvId, profileId
        )

        return queryRes
            .groupBy(keySelector = { d: FlinkServiceDtoTemp -> FlinkServiceProfileDto(d.serviceId, d.profileId) })
            .map<FlinkServiceProfileDto, List<FlinkServiceDtoTemp>, FlinkServiceDto> { d ->
                FlinkServiceDto(
                srv = d.key,
                topics = Topics(
                    d.value.map { q -> q.inTopic }.distinct(),
                    d.value.map { q -> q.outTopic }.distinct()
                )
            )
            }.toSet()
    }
}