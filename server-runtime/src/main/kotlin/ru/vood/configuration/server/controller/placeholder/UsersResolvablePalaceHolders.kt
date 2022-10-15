package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

@Service
class UsersResolvablePalaceHolders : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf(
            "BOOTSTRAP_SERVERS",
            "KEYSTORE_LOCATION",
            "PARALLELISM",
            "TRUSTSTORE_LOCATION",
        )

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String): String = "\${" + ph + "}"
}