package ru.vood.configurationserver.rest

import org.slf4j.LoggerFactory
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import ru.vood.configurationserver.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configurationserver.repo.dto.EviromentService
import ru.vood.configurationserver.rest.intf.ConfigurationGeneratorRestIntf

@RestController
class ConfigurationGeneratorRestImpl(
    val configurationGeneratorControllerIntf: ConfigurationGeneratorControllerIntf,
) : ConfigurationGeneratorRestIntf {

   @GetMapping("/envBody")
    override fun generateEnvBody(
        @RequestParam
        serviceId: String,
        @RequestParam
        profileId: String,
        @RequestParam
        stand: String
    ): String {
        return configurationGeneratorControllerIntf.generateEnvBody(serviceId, profileId, stand)
    }

    @GetMapping("/allProfilesEnvBodies", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun allServiceProfileByStand(
        @RequestParam
        serviceId: String,
        @RequestParam
        stand: String
    ): List<EviromentService> {
        return configurationGeneratorControllerIntf.generateAllServiceProfile(serviceId, stand)
    }
}