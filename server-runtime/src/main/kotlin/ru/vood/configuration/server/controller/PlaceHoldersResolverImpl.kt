package ru.vood.configuration.server.controller

import arrow.core.Either
import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.HolderResolver
import ru.vood.configurationserver.controller.intf.PlaceHoldersResolver
import ru.vood.configurationserver.controller.intf.extractNamesPlaceholder
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

@Service
class PlaceHoldersResolverImpl(
    holderResolvers: List<HolderResolver>
) : PlaceHoldersResolver {

    private val holdersFuns = holderResolvers.flatMap { f-> f.placeHolderName.map { n-> n to f  } }.toMap()
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