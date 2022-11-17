package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.dto.EviromentService
import ru.vood.configuration.server.repo.dto.StandEnum

interface ConfigurationGeneratorControllerIntf {

    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: StandEnum
    ): String


    fun generateAllServiceProfile(
        serviceId: String,
        stand: StandEnum
    ): List<EviromentService>

    fun environmentZip(serviceId: String): ByteArray
}