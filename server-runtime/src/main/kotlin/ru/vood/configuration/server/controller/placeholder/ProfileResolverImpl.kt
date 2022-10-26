package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum

@Service
class ProfileResolverImpl : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("PROFILE", "PROFILE_NAME")

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String, stand: StandEnum): String =
        flinkServiceProfile.profileId
}