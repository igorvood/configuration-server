package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile

@Service
class ParallelismResolverImpl: HolderResolver {
    override val placeHolderName: Set<String>
        get() = setOf("PARALLELISM")

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String): String =        8.toString()

}