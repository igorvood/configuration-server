package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.ReportTopicRepository

@Repository
class ReportTopicRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : ReportTopicRepository {

    override fun topicsByStand(standEnum: StandEnum): List<String> {
        return jdbcTemplate.query(
            """select TOPIC_NAME 
                                    from REP_TOPIC_NAME_BY_STAND
                                    where USED = 1 and STAND = ?""",
            { rs, _ -> rs.getString(1) }, standEnum.name
        )
    }

    override fun usedTopics(): List<String> {
        return jdbcTemplate.query(
            """select TOPIC_ID 
                                    from REP_TOPIC_USE
                                    where USED = 1"""
        ) { rs, _ -> rs.getString(1) }
    }

    override fun unUsedTopics(): List<String> {
        return jdbcTemplate.query(
            """select TOPIC_ID 
                                    from REP_TOPIC_USE
                                    where USED = 0"""
        ) { rs, _ -> rs.getString(1) }
    }
}