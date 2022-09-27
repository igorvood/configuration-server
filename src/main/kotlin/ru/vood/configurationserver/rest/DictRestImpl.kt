package ru.vood.configurationserver.rest

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.Graph
import ru.vood.configurationserver.repo.intf.DictRepository
import ru.vood.configurationserver.rest.intf.DictRest

@RestController
class DictRestImpl(
    private val dictRepository: DictRepository
) : DictRest {

    @GetMapping("/graphList")
    override fun graphList(): Set<Graph> {
        return dictRepository.graphList()
    }

    @GetMapping("/serviceList")
    override fun serviceList(): Set<FlinkService> {
        return dictRepository.serviceList()
    }
}