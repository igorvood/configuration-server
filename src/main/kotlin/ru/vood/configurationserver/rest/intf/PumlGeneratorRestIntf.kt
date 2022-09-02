package ru.vood.configurationserver.rest.intf

import org.springframework.web.bind.annotation.GetMapping

interface PumlGeneratorRestIntf {

    fun plantUMLNew(graphId: String): String
}