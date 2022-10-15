package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

@Service
class ProfileResolverImpl : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("PROFILE")

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String): String =
        "${flinkServiceProfile.serviceId.id}_${flinkServiceProfile.profileId}"
}