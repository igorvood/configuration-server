package ru.vood.configuration.server.controller.placeholder

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.PlaceHolderRepository

@Service
class DataBaseResolvablePalaceHolders(
    private val dictRepository: PlaceHolderRepository
) : HolderResolver {
    override val placeHolderName: Set<String>
        get() = dictRepository.dbPlaceHolders().map { it.id }.toSet()

    override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String, stand: StandEnum): String {
        val placeHolderValue = dictRepository.placeHolderByService(
            flinkServiceProfile.serviceId.id,
            flinkServiceProfile.profileId,
            stand,
            ph
        )
        return placeHolderValue
    }
}