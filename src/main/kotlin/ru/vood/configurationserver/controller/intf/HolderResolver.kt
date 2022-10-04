package ru.vood.configurationserver.controller.intf

import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

interface HolderResolver {

    val placeHolderName: Set<String>

    fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile): String
}