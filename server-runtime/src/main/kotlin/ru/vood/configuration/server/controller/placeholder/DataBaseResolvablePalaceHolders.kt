package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.intf.DictRepository

@Service
class DataBaseResolvablePalaceHolders(
    private val dictRepository: DictRepository
) : HolderResolver {
    override val placeHolderName: Set<String>
        get() =            dictRepository.dbPlaceHolders().map { it.id }.toSet()

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String): String = "\${" + ph + "}"
}