package ru.vood.configurationserver.rest.intf

interface ConfigurationGeneratorRestIntf {
    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: String
    ): String


//    fun generateEnvBody(): String
}