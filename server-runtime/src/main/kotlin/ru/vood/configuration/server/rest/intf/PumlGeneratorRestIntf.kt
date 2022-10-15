package ru.vood.configuration.server.rest.intf

interface PumlGeneratorRestIntf {

    fun plantUMLNew(graphId: String): String
}