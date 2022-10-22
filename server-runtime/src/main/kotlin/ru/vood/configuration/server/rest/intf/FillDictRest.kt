package ru.vood.configuration.server.rest.intf

import org.springframework.web.bind.annotation.GetMapping

interface FillDictRest {

    fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String)

    fun dictServiceInsertPath(graphId: String, serviceId: String, profileId: String, mainClass: String)
}