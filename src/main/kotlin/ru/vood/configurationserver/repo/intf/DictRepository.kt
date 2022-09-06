package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.repo.dto.Graph

interface DictRepository {

    fun graphList(): Set<Graph>
}