package ru.vood.configurationserver.rest.intf

import org.springframework.web.bind.annotation.RequestParam
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