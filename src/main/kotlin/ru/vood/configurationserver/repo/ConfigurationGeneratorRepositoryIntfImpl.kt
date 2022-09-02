package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf

@Service
class ConfigurationGeneratorRepositoryIntfImpl(
    private val jdbcTemplate: JdbcTemplate
)  : ConfigurationGeneratorRepositoryIntf {
    override fun property(
        serviceId: String,
        profileId: String,
        stand: String
    ): Set<EnvProperty> {
        val query = jdbcTemplate.query(
            """
           select ENV_PROP_NAME, PROPERTY_VAL from KAFKA_PROPERTY_BY_SEVICE
            where SERVICE_ID = :1 and PROFILE_ID = :2 and STAND = :3
        """.trimIndent(),
            { rs, n ->
                EnvProperty(rs.getString(1), rs.getString(2))
            }, serviceId, profileId, stand
        ).toSet()
return query

    }
}