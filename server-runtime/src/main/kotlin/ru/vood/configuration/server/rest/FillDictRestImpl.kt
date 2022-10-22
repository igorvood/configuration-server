package ru.vood.configuration.server.rest

import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.rest.intf.FillDictRest


@RestController
class FillDictRestImpl(
    val fillDictController: FillDictController
) : FillDictRest {

    @PutMapping("/serviceInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String): Unit {
        fillDictController.dictServiceInsert(graphId, serviceId, profileId, mainClass)
    }

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


    @PutMapping("/topicInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictTopicInsert(graphId: String, topicName: String) {
        fillDictController.dictTopicInsert(graphId, topicName)
    }

    @PutMapping("/arrowInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    ) = fillDictController.dictArrowInsert(direction, graphId, serviceId, profileId, topicName, propertyKey)

    @PutMapping("/flinkPropertyInsertByText", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertByText(
        serviceId: String,
        profileId: String,
        @RequestBody propString: String
    ) = fillDictController.flinkPropertyInsertByText(serviceId, profileId, propString)

    @PutMapping("/flinkPropertyInsertSingleProperty", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertSingleProperty(
        serviceId: String,
        profileId: String,
        propId: String,
        propValue: String,
    ) = fillDictController.flinkPropertyInsertByList(serviceId, profileId, listOf(PropertyPut(propId, propValue)))

    @PutMapping("/flinkPropertyInsertList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun flinkPropertyInsertList(
        serviceId: String,
        profileId: String,
        @RequestBody props: List<PropertyPut>,

        ) = fillDictController.flinkPropertyInsertByList(serviceId, profileId, props)
}