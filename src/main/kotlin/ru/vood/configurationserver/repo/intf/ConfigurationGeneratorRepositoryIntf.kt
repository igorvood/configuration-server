package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.repo.dto.EnvProperty

interface ConfigurationGeneratorRepositoryIntf {

    fun propertyByService(
        serviceId: String,
        profileId: String,
        stand: String,
    ): List<EnvProperty>
}