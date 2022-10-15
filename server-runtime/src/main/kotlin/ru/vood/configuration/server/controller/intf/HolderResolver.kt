package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

interface HolderResolver {

    val placeHolderName: Set<String>

    fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile): String
}