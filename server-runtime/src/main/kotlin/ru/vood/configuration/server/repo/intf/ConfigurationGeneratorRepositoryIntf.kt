package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.StandEnum

interface ConfigurationGeneratorRepositoryIntf {

    fun propertyByService(
        serviceId: String,
        profileId: String,
        stand: StandEnum,
    ): List<EnvProperty>

}