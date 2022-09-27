package ru.vood.configurationserver.controller.intf

import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.repo.dto.EnvProperty

interface PlaceHolderResolver {

    fun placeHolders(property: List<EnvProperty>): List<PlaceHolder>

}
