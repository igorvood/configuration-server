package ru.vood.configurationserver.controller.intf

import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf


@Service
class ConfigurationGeneratorControllerImpl(
    val configurationGeneratorRepositoryIntf: ConfigurationGeneratorRepositoryIntf
) : ConfigurationGeneratorControllerIntf {
    override fun generateEnvBody(serviceId: String, profileId: String, stand: String): String {
        val property = configurationGeneratorRepositoryIntf.property(serviceId, profileId, stand)
        return if (stand == "NOTEBOOK")
            property.joinToString(separator = "\n") { "${it.envPropertyName}=${it.propertyValue}" }
        else property.map { "`\"--${it.envPropertyName} ${it.propertyValue}  \"" }
            .joinToString(separator = "`\n")
    }
}