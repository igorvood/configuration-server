package ru.vood.configuration.server.check

import org.slf4j.LoggerFactory
import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.intf.extractNamesPlaceholder
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.intf.ReportTopicRepository

@Service
class NotUsedTopicCheker(
    val reportTopicRepository: ReportTopicRepository
) : CheckService {

    private val logger = LoggerFactory.getLogger(NotUsedTopicCheker::class.java)
    override fun check() {
        reportTopicRepository.unUsedTopics().forEach { logger.warn("'$it' found unused topic ") }

    }
}