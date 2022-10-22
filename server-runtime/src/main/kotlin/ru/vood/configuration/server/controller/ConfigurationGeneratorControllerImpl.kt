package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.dto.PlaceHolder
import ru.vood.configuration.server.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configuration.server.controller.intf.extractNamesPlaceholder
import ru.vood.configuration.server.controller.placeholder.intf.PlaceHoldersResolver
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.EviromentService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.ConfigurationGeneratorRepositoryIntf
import ru.vood.configuration.server.repo.intf.DictRepository


@Service
class ConfigurationGeneratorControllerImpl(
    val configurationGeneratorRepositoryIntf: ConfigurationGeneratorRepositoryIntf,
    val dictRepository: DictRepository,
    val placeHoldersResolver: PlaceHoldersResolver,
    val propertyFileGenerator: PropertyFileGenerator
) : ConfigurationGeneratorControllerIntf {
    override fun generateEnvBody(serviceId: String, profileId: String, stand: StandEnum): String {
        val property: List<EnvProperty> =
            configurationGeneratorRepositoryIntf.propertyByService(serviceId, profileId, stand)
        val serviceById = dictRepository.serviceById(serviceId)
        val placeHolders: List<PlaceHolder> =
            placeHoldersResolver.placeHolders(property, FlinkServiceProfile(serviceById, profileId))
        val s = when (stand) {
            StandEnum.NOTEBOOK, StandEnum.NOTEBOOK_DSO ->
                propertyFileGenerator.gererate(serviceById, property, placeHolders)
            else -> {

                val placeHoldersStr =
                    placeHolders
                        .filter { extractNamesPlaceholder(it.placeHolderValue).isEmpty() }
                        .map { it.placeHolderName + "=" + it.placeHolderValue }.joinToString("\n")
                val groupedBy = property.groupBy { it.priority.toString() + "_" + it.typeProperty }

                val propertiesEnvStr = groupedBy
                    .entries
                    .sortedBy { it.key }
                    .map { entry ->
                        entry.value
                            .joinToString(separator = "`\n") { envPrp -> "`\"--${serviceId}.${envPrp.envPropertyName} ${envPrp.propertyValue}  \"" }
                    }
                    .joinToString(separator = "\n\n")

                """
$placeHoldersStr                    
MAIN_CLASS=${serviceById.mainClass}
                    
PROGRAMARGS=$propertiesEnvStr
""".trimIndent()
            }
        }
        return s
    }

    override fun generateAllServiceProfile(serviceId: String, stand: StandEnum): List<EviromentService> {
        val serviceProfile = dictRepository.serviceProfile(serviceId)
        return serviceProfile.map { s ->
            EviromentService(s, generateEnvBody(s.serviceId.id, s.profileId, stand))
        }
    }
}