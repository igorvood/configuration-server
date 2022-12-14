package ru.vood.configuration.server.rest

import io.swagger.v3.oas.annotations.Operation
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.dto.DirectionEnum
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.dto.TopicPut
import ru.vood.configuration.server.rest.intf.FillDictRest


@RestController
class FillDictRestImpl(
    val fillDictController: FillDictController
) : FillDictRest {

    @Operation(summary = "Создание сервиса с профилем", tags = ["Заполнение таблиц. Сервис."])
    @PutMapping("/serviceInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictServiceInsert(
        graphId: String,
        serviceId: String,
        mainClass: String,
        profileId: String,
    ): Unit {
        fillDictController.dictServiceInsert(graphId, serviceId, profileId, mainClass)
    }

    @Operation(summary = "Создание сервиса с профилем", tags = ["Заполнение таблиц. Сервис."])
    @PutMapping("/dictServiceInsertList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictServiceInsertList(
        graphId: String,
        serviceId: String,
        mainClass: String,
        @RequestBody profileIds: List<String>
    ): Unit {
        profileIds.forEach { fillDictController.dictServiceInsert(graphId, serviceId, it, mainClass) }
    }


    @Operation(
        summary = "Создание сервиса с профилем, альтернативный способ, Посмотрим что больше понравится Девопс",
        tags = ["Заполнение таблиц. Сервис."]
    )
    @PutMapping(
        "/serviceInsertPath/{graphId}/{serviceId}/{profileId}/{mainClass}",
        produces = [MediaType.APPLICATION_JSON_VALUE]
    )
    override fun dictServiceInsertPath(
        @PathVariable graphId: String,
        @PathVariable serviceId: String,
        @PathVariable profileId: String,
        @PathVariable mainClass: String
    ): Unit {
        dictServiceInsert(graphId, serviceId, profileId, mainClass)
    }


    @Operation(summary = "Создание топика", tags = ["Заполнение таблиц. Топик"])
    @PutMapping("/topicInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictTopicInsert(graphId: String, topicName: String) {
        fillDictController.dictTopicInsertList(listOf(TopicPut(graphId, topicName)))
    }

    @Operation(summary = "Создание топиков", tags = ["Заполнение таблиц. Топик"])
    @PutMapping("/topicInsertList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictTopicListInsert(
        @RequestBody topics: List<TopicPut>
    ) {
        fillDictController.dictTopicInsertList(topics)
    }

    @Operation(summary = "Создание топиков", tags = ["Заполнение таблиц. Топик"])
    @PutMapping("/topicInsertListGraph", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun topicInsertListGraph(
        graphId: String,
        @RequestBody topics: List<String>
    ) {
        fillDictController.dictTopicInsertList(topics.map { TopicPut(graphId, it) })
    }

    @Operation(summary = "Создание топиков", tags = ["Заполнение таблиц. Топик"])
    @PutMapping("/topicInsertListGraphProp", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun topicInsertListGraphProp(
        graphId: String,
        @RequestBody propFile: String
    ) {
        fillDictController.topicInsertListGraphProp(graphId, propFile)
    }


    @Operation(summary = "Создание связи топика и сервиса", tags = ["Заполнение таблиц. Связи"])
    @PutMapping("/arrowInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictArrowInsert(
        graphId: String,
        serviceId: String,
        profileId: String,
        directionEnum: DirectionEnum,
        topicName: String,
        propertyKey: String
    ) = fillDictController.dictArrowInsert(directionEnum, graphId, serviceId, profileId, topicName, propertyKey)

    @Operation(summary = "Создание связи топика и сервиса", tags = ["Заполнение таблиц. Связи"])
    @PutMapping("/dictArrowInsertList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictArrowInsertList(
        graphId: String,
        serviceId: String,
        profileId: String,
        @RequestBody topics: List<TopicWithDirection>

    ) {
        topics.forEach {
            fillDictController.dictArrowInsert(
                it.directionEnum,
                graphId,
                serviceId,
                profileId,
                it.topicName,
                it.propertyKey
            )
        }

    }

    @Operation(
        summary = "Создание настроек сервиса, вытаскиваются из текста ENV свойств",
        tags = ["Заполнение таблиц. Свойства сервиса"]
    )
    @PutMapping("/flinkPropertyInsertByTextEnv", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertByTextEnv(
        serviceId: String,
        profileId: String,
        @RequestBody propString: String
    ) = fillDictController.flinkPropertyInsertByTextEnv(serviceId, profileId, propString)

    @Operation(
        summary = "Создание настроек сервиса, вытаскиваются из текста PROP свойств",
        tags = ["Заполнение таблиц. Свойства сервиса"]
    )
    @PutMapping("/flinkPropertyInsertByTextProp", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertByTextProp(
        serviceId: String,
        profileId: String,
        @RequestBody propString: String
    ) = fillDictController.flinkPropertyInsertByTextProp(serviceId, profileId, propString)


    @Operation(summary = "Создание настройки сервиса", tags = ["Заполнение таблиц. Свойства сервиса"])
    @PutMapping("/flinkPropertyInsertSingleProperty", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertSingleProperty(
        serviceId: String,
        profileId: String,
        propId: String,
        propValue: String,
    ) = fillDictController.flinkPropertyInsertByList(serviceId, profileId, listOf(PropertyPut(propId, propValue)))

    @Operation(summary = "Создание настроек  сервиса из списка", tags = ["Заполнение таблиц. Свойства сервиса"])
    @PutMapping("/flinkPropertyInsertList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertList(
        serviceId: String,
        profileId: String,
        @RequestBody props: List<PropertyPut>,

        ) = fillDictController.flinkPropertyInsertByList(serviceId, profileId, props)
}