package ru.vood.configurationserver.controller.intf

interface ConfigurationGeneratorControllerIntf {

    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: String
    ): String
}