package ru.vood.configurationserver.rest

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configurationserver.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configurationserver.rest.intf.PumlGeneratorRestIntf

@RestController
class PumlGeneratorRestImpl(
    val pumlGeneratorControllerIntf: PumlGeneratorControllerIntf
    ) : PumlGeneratorRestIntf {
    @GetMapping("/pumlFile")
    override fun plantUML(): String {
        return pumlGeneratorControllerIntf.generatePuml("","")
    }
}