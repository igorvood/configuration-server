package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.StandEnum

interface ReportTopicRepository {

    fun topicsByStand(standEnum: StandEnum): List<String>

    fun usedTopics(): List<String>

    fun unUsedTopics(): List<String>
}