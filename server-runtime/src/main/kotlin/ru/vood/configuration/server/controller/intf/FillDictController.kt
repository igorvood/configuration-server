package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.dto.DirectionEnum
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.dto.TopicPut

interface FillDictController {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)
    fun dictTopicInsertList(topics: List<TopicPut>)

    fun dictArrowInsert(
        directionEnum: DirectionEnum,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    )

    fun flinkPropertyInsertByText(serviceId: String, profileId: String, propString: String)
    fun flinkPropertyInsertByList(serviceId: String, profileId: String, propsAndVal: List<PropertyPut>)
}