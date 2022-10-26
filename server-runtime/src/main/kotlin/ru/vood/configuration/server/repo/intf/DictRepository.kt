package ru.vood.configuration.server.repo.intf

import ru.vood.configuration.server.repo.dto.DataBasePlaceHolder
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.Graph

interface DictRepository {

    fun graphList(): Set<Graph>

    fun serviceList(): Set<FlinkService>

    fun serviceById(serviceId: String): FlinkService

    fun serviceProfile(serviceId: String): Set<FlinkServiceProfile>

}