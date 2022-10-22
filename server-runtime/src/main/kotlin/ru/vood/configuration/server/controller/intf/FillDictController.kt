package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.PropertyPut

interface FillDictController {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)


    fun dictTopicInsert(graphId: String, topicName: String)
    fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    )

    fun flinkPropertyInsertByText(serviceId: String, profileId: String, propString: String)
    fun flinkPropertyInsertByList(serviceId: String, profileId: String, propsAndVal: List<PropertyPut>)
}