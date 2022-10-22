package ru.vood.configuration.server.rest

import io.swagger.v3.oas.annotations.Operation
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

    @Operation(summary = "Список графов", tags = ["Отчеты."])
    @GetMapping("/graphList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun graphList(): Set<Graph> {
        return dictRepository.graphList()
    }

    @Operation(summary = "Список вервисов", tags = ["Отчеты."])
    @GetMapping("/serviceList", produces = [MediaType.APPLICATION_JSON_VALUE])
    override fun serviceList(): Set<FlinkService> {
        return dictRepository.serviceList()
    }
}