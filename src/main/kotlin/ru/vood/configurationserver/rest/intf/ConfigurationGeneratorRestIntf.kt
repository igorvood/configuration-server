package ru.vood.configurationserver.rest.intf

import ru.vood.configurationserver.repo.dto.EviromentService

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