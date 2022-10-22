package ru.vood.configuration.server.check

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service
import ru.vood.configuration.server.repo.intf.ReportTopicRepository

@Service
class NotUsedTopicChecker(
    val reportTopicRepository: ReportTopicRepository
) : CheckService {

    private val logger = LoggerFactory.getLogger(NotUsedTopicChecker::class.java)
    override fun check() {
        reportTopicRepository.unUsedTopics().forEach { logger.warn("'$it' found unused topic ") }

    }
}