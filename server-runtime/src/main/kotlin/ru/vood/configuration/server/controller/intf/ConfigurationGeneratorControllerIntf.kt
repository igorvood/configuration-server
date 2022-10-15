package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.dto.EviromentService

interface ConfigurationGeneratorControllerIntf {

    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: String
    ): String


    fun generateAllServiceProfile(
        serviceId: String,
        stand: String
    ): List<EviromentService>
}