package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.intf.ConfigurationGeneratorRepositoryIntf

@Service
class ConfigurationGeneratorRepositoryIntfImpl(
    private val jdbcTemplate: JdbcOperations
) : ConfigurationGeneratorRepositoryIntf {
    override fun propertyByService(
        serviceId: String,
        profileId: String,
        stand: String
    ): List<EnvProperty> {
        val query = jdbcTemplate.query(
            """
           select PROP_ID, PROP_VALUE, PRIORITY, type_property from full_flink_service_property_stand
            where SERVICE_ID = :1 and PROFILE_ID = :2 and STAND = :3
           order by PRIORITY, PROP_ID
        """.trimIndent(),
            { rs, _ ->
                EnvProperty(
                    envPropertyName = rs.getString(1),
                    propertyValue = rs.getString(2),
                    priority = rs.getInt(3),
                    typeProperty = rs.getString(4),
                )
            }, serviceId, profileId, stand
        )
        return query

    }
}