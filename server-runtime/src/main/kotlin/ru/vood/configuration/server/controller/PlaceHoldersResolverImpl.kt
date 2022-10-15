package ru.vood.configuration.server.controller

import arrow.core.Either
import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.dto.PlaceHolder
import ru.vood.configuration.server.controller.intf.extractNamesPlaceholder
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.controller.placeholder.intf.PlaceHoldersResolver
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

@Service
class PlaceHoldersResolverImpl(
    holderResolvers: List<HolderResolver>
) : PlaceHoldersResolver {

    private val holdersFuns = holderResolvers.flatMap { f -> f.placeHolderName.map { n -> n to f } }.toMap()
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
                    holdersFuns.get(ph)?.valuePlaceHolder(flinkServiceProfile, ph)
                        ?.let { value -> PlaceHolder(ph, value) }
                val fold = Either.fromNullable(valuePlaceHolder).fold({ listOf() }, { q -> listOf(q) })
                fold
            }

        return propertyWithPlaceHolder

    }
}