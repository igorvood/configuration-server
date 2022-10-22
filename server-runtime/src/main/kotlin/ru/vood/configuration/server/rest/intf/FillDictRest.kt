package ru.vood.configuration.server.rest.intf

import ru.vood.configuration.server.repo.dto.DirectionEnum
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.dto.TopicPut
import ru.vood.configuration.server.rest.TopicWithDirection

interface FillDictRest {

    fun dictServiceInsert(
        graphId: String, serviceId: String, mainClass: String,
        profileId: String,
    )

    fun dictServiceInsertPath(graphId: String, serviceId: String, profileId: String, mainClass: String)

    fun dictTopicInsert(graphId: String, topicName: String)
    fun flinkPropertyInsertByText(serviceId: String, profileId: String, propString: String)
    fun flinkPropertyInsertSingleProperty(serviceId: String, profileId: String, propId: String, propValue: String)
    fun flinkPropertyInsertList(serviceId: String, profileId: String, props: List<PropertyPut>)
    fun dictTopicListInsert(topics: List<TopicPut>)
    fun topicInsertListGraph(graphId: String, topics: List<String>)
    fun dictServiceInsertList(
        graphId: String,
        serviceId: String,
        mainClass: String,
        profileIds: List<String>
    )

    fun dictArrowInsertList(
        graphId: String,
        serviceId: String,
        profileId: String,
        topics: List<TopicWithDirection>
    )

    fun dictArrowInsert(
        graphId: String,
        serviceId: String,
        profileId: String,
        directionEnum: DirectionEnum,
        topicName: String,
        propertyKey: String
    )
}