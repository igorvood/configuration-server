package ru.vood.configuration.server.rest.intf

import ru.vood.configuration.server.repo.dto.EviromentService

interface ConfigurationGeneratorRestIntf {
    fun generateEnvBody(
        serviceId: String,
        profileId: String,
        stand: String
    ): String

    fun allServiceProfileByStand(
        serviceId: String,
        stand: String
    ): List<EviromentService>

}