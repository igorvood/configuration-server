package ru.vood.configurationserver.rest.intf

import org.springframework.web.bind.annotation.GetMapping

interface PumlGeneratorRestIntf {

//    fun plantUML(): String

    fun plantUMLNew(): String
}