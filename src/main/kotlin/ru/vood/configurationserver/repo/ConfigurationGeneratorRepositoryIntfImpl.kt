package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf

@Service
class ConfigurationGeneratorRepositoryIntfImpl(
    private val jdbcTemplate: JdbcOperations
) : ConfigurationGeneratorRepositoryIntf {
    override fun property(
        serviceId: String,
        profileId: String,
        stand: String
    ): Set<EnvProperty> {
        val query = jdbcTemplate.query(
            """
           select PROP_ID, PROP_VALUE from full_flink_service_property_stand
            where SERVICE_ID = :1 and PROFILE_ID = :2 and STAND = :3
        """.trimIndent(),
            { rs, n ->
                EnvProperty(rs.getString(1), rs.getString(2))
            }, serviceId, profileId, stand
        ).toSet()
        return query

    }
}