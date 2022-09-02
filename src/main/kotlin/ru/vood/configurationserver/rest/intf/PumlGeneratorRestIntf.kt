package ru.vood.configurationserver.rest.intf

interface PumlGeneratorRestIntf {

    fun plantUMLNew(graphId: String): String
}