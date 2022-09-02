package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf


@Service
class ConfigurationGeneratorControllerImpl(
    val configurationGeneratorRepositoryIntf: ConfigurationGeneratorRepositoryIntf
) : ConfigurationGeneratorControllerIntf {
    override fun generateEnvBody(serviceId: String, profileId: String, stand: String): String {
        val property = configurationGeneratorRepositoryIntf.property(serviceId, profileId, stand)
        return when (stand) {
            "NOTEBOOK" -> property
                .joinToString(separator = "\n") { "${it.envPropertyName}=${it.propertyValue}" }
            else -> property
                .joinToString(separator = "`\n") { "`\"--${it.envPropertyName} ${it.propertyValue}  \"" }
        }
    }
}