package ru.vood.configuration.server.controller.intf

interface PumlGeneratorControllerIntf {

//    @Deprecated("use generatePumlByGraphId")
//    fun generatePuml(srvId: String, profileId: String): String

    fun generatePumlByGraphId(graphId: String): String
}