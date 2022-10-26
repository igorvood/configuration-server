package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.ConfigurationGeneratorRepositoryIntf

@Repository
class ConfigurationGeneratorRepositoryIntfImpl(
    private val jdbcTemplate: JdbcOperations
) : ConfigurationGeneratorRepositoryIntf {
    override fun propertyByService(
        serviceId: String,
        profileId: String,
        stand: StandEnum
    ): List<EnvProperty> {
        val query = jdbcTemplate.query(
            """
           select PROP_ID, PROP_VALUE, PRIORITY, type_property from full_flink_service_property_stand
            where SERVICE_ID = ? and PROFILE_ID = ? and STAND = ?
           order by PRIORITY, PROP_ID
        """.trimIndent(),
            { rs, _ ->
                EnvProperty(
                    envPropertyName = rs.getString(1),
                    propertyValue = rs.getString(2),
                    priority = rs.getInt(3),
                    typeProperty = rs.getString(4),
                )
            }, serviceId, profileId, stand.name
        )
        return query

    }
}