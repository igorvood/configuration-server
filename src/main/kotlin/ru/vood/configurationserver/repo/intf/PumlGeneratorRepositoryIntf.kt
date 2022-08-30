package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.GraphNode

interface PumlGeneratorRepositoryIntf {

//    fun findBySrvIdAndProfileId(srvId: String, profileId: String): Set<FlinkServiceDto>

    fun findByGraphId(graphId: String): Set<Arrow<out GraphNode, out GraphNode>>
}