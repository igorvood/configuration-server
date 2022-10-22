package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.intf.ReportTopicController
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.ReportTopicRepository

@Service
class ReportTopicControllerImpl(
    val reportTopicRepository: ReportTopicRepository
) : ReportTopicController {
    override fun topicsByStand(standEnum: StandEnum): List<String> {
        return reportTopicRepository.topicsByStand(standEnum)

    }

    override fun usedTopics(): List<String> {
        return reportTopicRepository.usedTopics()
    }

    override fun unUsedTopics(): List<String> {
        return reportTopicRepository.unUsedTopics()
    }
}