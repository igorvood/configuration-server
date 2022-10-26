package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.DataBasePlaceHolder
import ru.vood.configuration.server.repo.dto.StandEnum

interface PlaceHolderRepository {

    fun dbPlaceHolders(): Set<DataBasePlaceHolder>

    fun placeHolderByService(
        serviceId: String,
        profileId: String,
        stand: StandEnum,
        placeHolderName: String
    ): String


}