package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configurationserver.controller.intf.PlaceHoldersResolver
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.EviromentService
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf
import ru.vood.configurationserver.repo.intf.DictRepository


@Service
class ConfigurationGeneratorControllerImpl(
    val configurationGeneratorRepositoryIntf: ConfigurationGeneratorRepositoryIntf,
    val dictRepository: DictRepository,
    val placeHoldersResolver: PlaceHoldersResolver
) : ConfigurationGeneratorControllerIntf {
    override fun generateEnvBody(serviceId: String, profileId: String, stand: String): String {
        val property: List<EnvProperty> =
            configurationGeneratorRepositoryIntf.propertyByService(serviceId, profileId, stand)
        val serviceById = dictRepository.serviceById(serviceId)
        val plaseHolders: List<PlaceHolder> =
            placeHoldersResolver.placeHolders(property, FlinkServiceProfile(serviceById, profileId))
        val s = when (stand) {
            "NOTEBOOK" -> property
                .joinToString(separator = "\n") { "${it.envPropertyName}=${it.propertyValue}" }
            else -> {

                val plaseHoldersStr =
                    plaseHolders.map { it.placeHolderName + "=" + it.placeHolderValue }.joinToString("\n")
                val groupedBy = property.groupBy { it.priority.toString() + "_" + it.typyProperty }
                val propertiesEnvStr = groupedBy
                    .entries
                    .sortedBy { it.key }
                    .map {
                        it.value
                            .joinToString(separator = "`\n") { "`\"--${serviceId}.${it.envPropertyName} ${it.propertyValue}  \"" }
                    }
                    .joinToString(separator = "\n\n")

                """
$plaseHoldersStr                    
MAIN_CLASS=${serviceById.mainClass}
                    
PROGRAMARGS=$propertiesEnvStr
""".trimIndent()
            }
        }
        return s
    }

    override fun generateAllServiceProfile(serviceId: String, stand: String): List<EviromentService> {
        val serviceProfile = dictRepository.serviceProfile(serviceId)
        return serviceProfile.map { s ->
            EviromentService(s, generateEnvBody(s.serviceId.id, s.profileId, stand))
        }
    }
}