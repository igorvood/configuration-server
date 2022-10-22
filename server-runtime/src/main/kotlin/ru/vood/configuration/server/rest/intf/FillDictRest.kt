package ru.vood.configuration.server.rest.intf

import org.springframework.web.bind.annotation.RequestBody
import ru.vood.configuration.server.repo.dto.DirectionEnum
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.dto.TopicPut

interface FillDictRest {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)

    fun dictServiceInsertPath(graphId: String, serviceId: String, profileId: String, mainClass: String)

    fun dictTopicInsert(graphId: String, topicName: String)
    fun dictArrowInsert(
        directionEnum: DirectionEnum,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    )

    fun flinkPropertyInsertByText(serviceId: String, profileId: String, propString: String)
    fun flinkPropertyInsertSingleProperty(serviceId: String, profileId: String, propId: String, propValue: String)
    fun flinkPropertyInsertList(serviceId: String, profileId: String, props: List<PropertyPut>)
    fun dictTopicListInsert(@RequestBody topics: List<TopicPut>)
}