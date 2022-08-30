package ru.vood.configurationserver.controller.intf

interface PumlGeneratorControllerIntf {

    @Deprecated("use generatePumlNew")
    fun generatePuml(srvId: String, profileId: String): String

    fun generatePumlNew(srvId: String, profileId: String): String
}