package ru.vood.configurationserver.controller.intf

interface PumlGeneratorControllerIntf {

    fun generatePuml(srvId: String, profileId: String): String
}