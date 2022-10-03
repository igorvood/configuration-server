package ru.vood.configurationserver.controller.intf

import org.springframework.stereotype.Service
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

@Service
class ProfileResolverImpl : HolderResolver {
    override val placeHolderName: String
        get() = "PROFILE"

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile): String =
        flinkServiceProfile.serviceId.id + "_" + flinkServiceProfile.profileId
}