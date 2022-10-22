package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.Direction
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile
import ru.vood.configuration.server.repo.dto.PropertyPut

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

    fun dictFlinkPropertyInsert(serviceId: String, profileId: String, propertyPut: PropertyPut)
}