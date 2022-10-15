package ru.vood.configuration.server.repo.intf

import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.GraphNode

interface PumlGeneratorRepositoryIntf {

    fun findByGraphId(graphId: String): Set<Arrow<out GraphNode, out GraphNode>>
}