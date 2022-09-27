package ru.vood.configurationserver.controller

import arrow.core.Either
import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.HolderResolver
import ru.vood.configurationserver.controller.intf.PlaceHoldersResolver
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile
import java.util.Optional

@Service
class PlaceHoldersResolverImpl(
    holderResolvers: List<HolderResolver>
) : PlaceHoldersResolver {

    private val holdersFuns = holderResolvers.map { it.placeHolderName to it }.toMap()




//  TODO  сюда прикрутить хвостовую рекурсию при случае
    private fun extractNamesPlaceholder(propertyValue: String): List<String> {
        val beginIndex = propertyValue.indexOf("\${")
        val endIndex = propertyValue.indexOf("}")

        return if (beginIndex!=-1 && endIndex!=-1 && beginIndex<endIndex) {
            val substring = propertyValue.substring(beginIndex+2, endIndex)

            val propertyValue1 = propertyValue.substring(endIndex+1)
            listOf(substring).plus(extractNamesPlaceholder(propertyValue1))
        }
        else listOf()

    }

    override fun placeHolders(property: List<EnvProperty>, flinkServiceProfile: FlinkServiceProfile): List<PlaceHolder> {
        val propertyWithPlaceHolder = property
            .filter { it.propertyValue.contains("\${") && it.propertyValue.contains("}") }
            .flatMap { prop ->                extractNamesPlaceholder(prop.propertyValue)            }
            .distinct()
            .flatMap { ph -> val valuePlaceHolder = holdersFuns.get(ph)?.valuePlaceHolder(flinkServiceProfile)?.let { value-> PlaceHolder(ph, value)}
                Either.fromNullable(valuePlaceHolder).fold( { listOf() },{ q -> listOf(q) })
            }

        return propertyWithPlaceHolder

    }
}