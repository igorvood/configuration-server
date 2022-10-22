package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile

interface FillDictRepository {

    fun dictServiceInsert(graphFlinkServiceProfile: GraphFlinkServiceProfile)


    fun dictTopicInsert(graphId: String, topicName: String)
    fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    )
}