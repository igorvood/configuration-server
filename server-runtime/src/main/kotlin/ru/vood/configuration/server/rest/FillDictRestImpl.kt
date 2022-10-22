package ru.vood.configuration.server.rest

import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.rest.intf.FillDictRest


@RestController
class FillDictRestImpl(
    val fillDictController: FillDictController
) : FillDictRest {

    @GetMapping("/serviceInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String): Unit {
        fillDictController.dictServiceInsert(graphId, serviceId, profileId, mainClass)
    }

    @GetMapping(
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


    @GetMapping("/topicInsert", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun dictTopicInsert(graphId: String, topicName: String){
        fillDictController.dictTopicInsert( graphId, topicName)
    }

}