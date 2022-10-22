package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile

interface FillDictRepository {

    fun dictServiceInsert(graphFlinkServiceProfile: GraphFlinkServiceProfile)


    fun dictTopicInsert(graphId: String, topicName: String)
}