package ru.vood.configuration.server.controller.intf

interface PumlGeneratorControllerIntf {

    fun generatePumlByGraphId(graphId: String): String
}