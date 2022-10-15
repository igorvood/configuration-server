package ru.vood.configuration.server.rest.intf

import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.Graph

interface DictRest {

    fun graphList(): Set<Graph>

    fun serviceList(): Set<FlinkService>
}