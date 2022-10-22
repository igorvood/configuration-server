package ru.vood.configuration.server.rest

import io.swagger.v3.oas.annotations.Operation
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configuration.server.repo.dto.EviromentService
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.rest.intf.ConfigurationGeneratorRestIntf

@RestController
class ConfigurationGeneratorRestImpl(
    val configurationGeneratorControllerIntf: ConfigurationGeneratorControllerIntf,
) : ConfigurationGeneratorRestIntf {

    @Operation(summary = "Настройки по профилю сервиса ", tags = ["Генерация"])
    @GetMapping("/envBody")
    override fun generateEnvBody(
        @RequestParam
        serviceId: String,
        @RequestParam
        profileId: String,
        @RequestParam
        stand: StandEnum
    ): String {
        return configurationGeneratorControllerIntf.generateEnvBody(serviceId, profileId, stand)
    }

    @Operation(summary = "Настройки сервиса, по всем его профилям", tags = ["Генерация"])
    @GetMapping("/allProfilesEnvBodies", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun allServiceProfileByStand(
        @RequestParam
        serviceId: String,
        @RequestParam
        stand: StandEnum
    ): List<EviromentService> {
        return configurationGeneratorControllerIntf.generateAllServiceProfile(serviceId, stand)
    }
}