package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum

@Service
class ServiceResolverImpl : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("SERVICE_NAME")

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String, stand: StandEnum): String =
        flinkServiceProfile.serviceId.id
}