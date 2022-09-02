package ru.vood.configurationserver.rest

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import ru.vood.configurationserver.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configurationserver.rest.intf.ConfigurationGeneratorRestIntf

@RestController
class ConfigurationGeneratorRestImpl(
    val configurationGeneratorControllerIntf: ConfigurationGeneratorControllerIntf
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
//        serviceId=mdm-enrichment&profileId=way4&stand=DSO
//        return configurationGeneratorControllerIntf.generateEnvBody("mdm-enrichment", "way4", "DSO")
        return configurationGeneratorControllerIntf.generateEnvBody(serviceId, profileId, stand)

    }
}