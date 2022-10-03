package ru.vood.configurationserver.controller.intf

import org.springframework.web.bind.annotation.RequestParam
import ru.vood.configurationserver.repo.dto.EviromentService

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