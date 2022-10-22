package ru.vood.configuration.server.rest.intf

import ru.vood.configuration.server.repo.dto.EviromentService
import ru.vood.configuration.server.repo.dto.StandEnum

interface ConfigurationGeneratorRestIntf {
    fun allServiceProfileByStand(
        serviceId: String,
        stand: StandEnum
    ): List<EviromentService>

    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: StandEnum
    ): String
}