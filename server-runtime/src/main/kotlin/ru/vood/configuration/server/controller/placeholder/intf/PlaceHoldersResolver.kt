package ru.vood.configuration.server.controller.placeholder.intf

import ru.vood.configuration.server.controller.dto.PlaceHolder
import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

interface PlaceHoldersResolver {

    fun placeHolders(property: List<EnvProperty>, flinkServiceProfile: FlinkServiceProfile): List<PlaceHolder>

}
