package ru.vood.configurationserver.controller.intf

import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

interface HolderResolver {

    val placeHolderName: String

    fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile) : String
}