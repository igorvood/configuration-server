package ru.vood.configurationserver.controller.intf

interface PumlGeneratorControllerIntf {

//    @Deprecated("use generatePumlByGraphId")
//    fun generatePuml(srvId: String, profileId: String): String

    fun generatePumlByGraphId(graphId: String): String
}