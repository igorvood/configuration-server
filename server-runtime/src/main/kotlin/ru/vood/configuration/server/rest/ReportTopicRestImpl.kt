package ru.vood.configuration.server.rest

import io.swagger.v3.oas.annotations.Operation
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.ReportTopicController
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.rest.intf.ReportTopicRest

@RestController
class ReportTopicRestImpl(val reportTopicController: ReportTopicController) : ReportTopicRest {

    @Operation(summary = "Топики по стенду", tags = ["Отчеты."])
    @GetMapping("/topicsByStand")
    override fun topicsByStand(standEnum: StandEnum): List<String> {
        return reportTopicController.topicsByStand(standEnum)
    }

    @Operation(summary = "Список используемых топиков", tags = ["Отчеты."])
    @GetMapping("/usedTopics")
    override fun usedTopics(): List<String> {
        return reportTopicController.usedTopics()
    }

    @Operation(summary = "Список НЕ используемых топиков", tags = ["Отчеты."])
    @GetMapping("/unUsedTopics")
    override fun unUsedTopics(): List<String> {
        return reportTopicController.unUsedTopics()
    }
}