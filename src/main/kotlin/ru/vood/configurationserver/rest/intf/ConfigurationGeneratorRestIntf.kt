package ru.vood.configurationserver.rest.intf

import org.springframework.web.bind.annotation.GetMapping

interface ConfigurationGeneratorRestIntf {
    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: String
    ): String


//    fun generateEnvBody(): String
}