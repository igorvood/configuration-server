package ru.vood.configuration.server.controller.intf

import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

interface PlaceHoldersResolver {

    fun placeHolders(property: List<EnvProperty>, flinkServiceProfile: FlinkServiceProfile): List<PlaceHolder>

}
