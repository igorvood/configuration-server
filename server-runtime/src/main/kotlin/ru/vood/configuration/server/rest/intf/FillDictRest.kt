package ru.vood.configuration.server.rest.intf

import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.PropertyPut

interface FillDictRest {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)

    fun dictServiceInsertPath(graphId: String, serviceId: String, profileId: String, mainClass: String)

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
    fun flinkPropertyInsertSingleProperty(serviceId: String, profileId: String, propId: String, propValue: String)
    fun flinkPropertyInsertList(serviceId: String, profileId: String, props: List<PropertyPut>)
}