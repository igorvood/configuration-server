package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile
import ru.vood.configurationserver.repo.dto.Graph

interface DictRepository {

    fun graphList(): Set<Graph>

    fun serviceList(): Set<FlinkService>

    fun serviceById(serviceId: String): FlinkService

    fun serviceProfile(serviceId: String): Set<FlinkServiceProfile>
}