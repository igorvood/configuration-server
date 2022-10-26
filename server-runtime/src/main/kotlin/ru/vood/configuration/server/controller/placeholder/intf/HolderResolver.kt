package ru.vood.configuration.server.controller.placeholder.intf

import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum

interface HolderResolver {

    val placeHolderName: Set<String>

    fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String, stand: StandEnum): String
}