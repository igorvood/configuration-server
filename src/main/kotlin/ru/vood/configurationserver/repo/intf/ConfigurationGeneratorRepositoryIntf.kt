package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.GraphNode
import ru.vood.configurationserver.repo.dto.EnvProperty

interface ConfigurationGeneratorRepositoryIntf {

    fun property(serviceId: String,
                 profileId: String,
                 stand: String
    ): Set<EnvProperty>
}