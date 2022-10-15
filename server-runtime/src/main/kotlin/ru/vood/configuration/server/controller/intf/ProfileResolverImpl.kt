package ru.vood.configuration.server.controller.intf

import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

@Service
class ProfileResolverImpl : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("PROFILE")

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile): String =
        "${flinkServiceProfile.serviceId.id}_${flinkServiceProfile.profileId}"
}