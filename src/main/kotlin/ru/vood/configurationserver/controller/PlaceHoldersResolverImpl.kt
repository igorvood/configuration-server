package ru.vood.configurationserver.controller

import arrow.core.Either
import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.HolderResolver
import ru.vood.configurationserver.controller.intf.PlaceHoldersResolver
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

@Service
class PlaceHoldersResolverImpl(
    holderResolvers: List<HolderResolver>
) : PlaceHoldersResolver {

    private val holdersFuns = holderResolvers.map { it.placeHolderName to it }.toMap()
    private tailrec fun extractNamesPlaceholder(
        propertyValue: String,
        inListPlace: List<String> = listOf()
    ): List<String> {
        val beginIndex = propertyValue.indexOf("\${")
        val endIndex = propertyValue.indexOf("}")

        return if (beginIndex != -1 && endIndex != -1 && beginIndex < endIndex) {
            val substring = propertyValue.substring(beginIndex + 2, endIndex)
            val propertyName = propertyValue.substring(endIndex + 1)
            val plus = inListPlace.plus(substring)
            extractNamesPlaceholder(propertyName, plus)
        } else inListPlace
    }


    override fun placeHolders(
        property: List<EnvProperty>,
        flinkServiceProfile: FlinkServiceProfile
    ): List<PlaceHolder> {
        val flatMap = property
            .filter { it.propertyValue.contains("\${") && it.propertyValue.contains("}") }
            .flatMap { prop -> extractNamesPlaceholder(prop.propertyValue) }
        val propertyWithPlaceHolder = flatMap
            .distinct()
            .flatMap { ph ->
                val valuePlaceHolder =
                    holdersFuns.get(ph)?.valuePlaceHolder(flinkServiceProfile)?.let { value -> PlaceHolder(ph, value) }
                val fold = Either.fromNullable(valuePlaceHolder).fold({ listOf() }, { q -> listOf(q) })
                fold
            }

        return propertyWithPlaceHolder

    }
}