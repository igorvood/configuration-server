package ru.vood.configuration.server.rest

import io.swagger.v3.oas.annotations.Operation
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configuration.server.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configuration.server.rest.intf.PumlGeneratorRestIntf

@RestController
class PumlGeneratorRestImpl(
    val pumlGeneratorControllerIntf: PumlGeneratorControllerIntf
) : PumlGeneratorRestIntf {
    //    @ApiResponses(
//        value = [ApiResponse(
//            responseCode = "200",
//            description = "Формирует puml файл по всему графу",
//            content = [Content(
//                mediaType = "application/json",
//                array = ArraySchema(
//                    schema = Schema(
//                        implementation = String::class
//                    )
//                )
//            )]
//        )]
//    )
    @Operation(summary = "Формирует puml файл по всему графу", tags = ["plantUML"])
    @GetMapping("/pumlFileByGraph")
    override fun plantUMLNew(graphId: String): String {

        return pumlGeneratorControllerIntf.generatePumlByGraphId(graphId)
//        return pumlGeneratorControllerIntf.generatePumlByGraphId("graph_1")
    }

}