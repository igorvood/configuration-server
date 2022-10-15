package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

@Service
class NotResolvablePalaceHolders  : HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("IFT_KAFKA_SSL_KEY_PASSWORD",
            "P0_KAFKA_SSL_TRUSTSTORE_PASSWORD",
            "DSO_KAFKA_SSL_KEY_PASSWORD",
            "REAL_KAFKA_SSL_TRUSTSTORE_PASSWORD",
            "IFT_KAFKA_SSL_TRUSTSTORE_PASSWORD",
            "NT_KAFKA_SSL_KEYSTORE_PASSWORD",
            "REAL_KAFKA_SSL_KEY_PASSWORD",
            "IFT_KAFKA_SSL_KEYSTORE_PASSWORD",
            "DSO_KAFKA_SSL_KEYSTORE_PASSWORD",
            "NT_KAFKA_SSL_TRUSTSTORE_PASSWORD",
            "P0_KAFKA_SSL_KEY_PASSWORD",
            "REAL_KAFKA_SSL_KEYSTORE_PASSWORD",
            "DSO_KAFKA_SSL_TRUSTSTORE_PASSWORD",
            "NT_KAFKA_SSL_KEY_PASSWORD",
            "P0_KAFKA_SSL_KEYSTORE_PASSWORD",
        )

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String): String = "\${"+ph+"}"
}