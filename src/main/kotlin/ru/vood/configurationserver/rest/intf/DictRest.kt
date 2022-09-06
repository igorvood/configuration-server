package ru.vood.configurationserver.rest.intf

import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.Graph

interface DictRest {

    fun graphList(): Set<Graph>
}