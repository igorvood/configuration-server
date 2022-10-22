package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.Direction

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
}