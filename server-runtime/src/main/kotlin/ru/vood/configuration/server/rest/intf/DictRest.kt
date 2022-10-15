package ru.vood.configuration.server.rest.intf

import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.Graph

interface DictRest {

    fun graphList(): Set<Graph>

    fun serviceList(): Set<FlinkService>
}