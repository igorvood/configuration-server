package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.dto.StandEnum

interface ReportTopicController {
    fun topicsByStand(standEnum: StandEnum): List<String>

    fun usedTopics(): List<String>

    fun unUsedTopics(): List<String>
}