package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.ConfigurationGeneratorControllerIntf
import ru.vood.configurationserver.controller.intf.PlaceHolderResolver
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.intf.ConfigurationGeneratorRepositoryIntf
import ru.vood.configurationserver.repo.intf.DictRepository


@Service
class ConfigurationGeneratorControllerImpl(
    val configurationGeneratorRepositoryIntf: ConfigurationGeneratorRepositoryIntf,
    val dictRepository: DictRepository,
    val placeHolderResolver: PlaceHolderResolver
) : ConfigurationGeneratorControllerIntf {
    override fun generateEnvBody(serviceId: String, profileId: String, stand: String): String {
        val property: List<EnvProperty> = configurationGeneratorRepositoryIntf.propertyByService(serviceId, profileId, stand)
        val sdsa : List<PlaceHolder> = placeHolderResolver.placeHolders(property)
        val s = when (stand) {
            "NOTEBOOK" -> property
                .joinToString(separator = "\n") { "${it.envPropertyName}=${it.propertyValue}" }
            else -> {
                val serviceById = dictRepository.serviceById(serviceId)

                val groupedBy = property.groupBy { it.priority.toString()+"_"+it.typyProperty }


                val propertiesEnvStr = groupedBy
                    .entries
                    .sortedBy { it.key }
                    .map {
                        it.value
                            .joinToString(separator = "`\n") { "`\"--${it.envPropertyName} ${it.propertyValue}  \"" }
                    }
                    .joinToString(separator = "\n\n")

                """
SERVICE_NAME=${serviceById.id}_${profileId}
MAIN_CLASS=${serviceById.mainClass}
                    
PROGRAMARGS=$propertiesEnvStr
""".trimIndent()
            }
        }
        return s
    }

}