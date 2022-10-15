package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.EnvProperty

interface ConfigurationGeneratorRepositoryIntf {

    fun propertyByService(
        serviceId: String,
        profileId: String,
        stand: String,
    ): List<EnvProperty>
}