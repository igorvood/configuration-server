package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.dto.PlaceHolder
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.FlinkService

@Service
class PropertyFileGenerator {
    fun gererate(service: FlinkService, property: List<EnvProperty>, placeHolders: List<PlaceHolder>): String {

        val groupedBy = property.groupBy { it.priority.toString() + "_" + it.typeProperty }
        val propertiesEnvStr = groupedBy
            .entries
            .sortedBy { it.key }
            .map {
                it.value
                    .joinToString(separator = "\n") { "${service.id}.${it.envPropertyName}=${it.propertyValue}" }
            }
            .joinToString(separator = "\n\n")

        return propertiesEnvStr
//        return property
//            .joinToString(separator = "\n") { "${it.envPropertyName}=${it.propertyValue}" }


    }

}
