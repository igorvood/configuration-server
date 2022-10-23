package ru.vood.configuration.server.check

import org.slf4j.LoggerFactory
import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service

@Service
class UniquePropertyChecker(
    private val jdbcTemplate: JdbcOperations
) : CheckService {

    private val logger = LoggerFactory.getLogger(UniquePropertyChecker::class.java)
    override fun check() {

        val query =
            jdbcTemplate.query(
                """select SERVICE_ID, PROFILE_ID, PROP_ID, TYPE_PROPERTY from CK_ENV_PROP_UNIQUE"""
            ) { rs, _ ->
                PropertyCheckerDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4))
            }

        // TODO не читабельный текс об ошибке, сделать читабельнее
        if (query.isNotEmpty())
            throw IllegalStateException("dublicate property key $query")

    }

    internal data class PropertyCheckerDto(
        val SERVICE_ID: String,
        val PROFILE_ID: String,
        val PROP_ID: String,
        val TYPE_PROPERTY: String,
    )
}

