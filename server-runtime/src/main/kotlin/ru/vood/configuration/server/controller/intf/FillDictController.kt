package ru.vood.configuration.server.controller.intf

interface FillDictController {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)


    fun dictTopicInsert(graphId: String, topicName: String)
}