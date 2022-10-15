package ru.vood.configuration.server.rest

import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.Graph
import ru.vood.configuration.server.repo.intf.DictRepository
import ru.vood.configuration.server.rest.intf.DictRest

@RestController
class DictRestImpl(
    private val dictRepository: DictRepository
) : DictRest {

    @GetMapping("/graphList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun graphList(): Set<Graph> {
        return dictRepository.graphList()
    }

    @GetMapping("/serviceList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun serviceList(): Set<FlinkService> {
        return dictRepository.serviceList()
    }
}