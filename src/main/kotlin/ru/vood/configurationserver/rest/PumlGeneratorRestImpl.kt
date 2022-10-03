package ru.vood.configurationserver.rest

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import ru.vood.configurationserver.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configurationserver.rest.intf.PumlGeneratorRestIntf

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
//    @Operation(summary = "Формирует puml файл по всему графу", tags = ["plantUML"])
    @GetMapping("/pumlFileByGraph")
    override fun plantUMLNew(graphId: String): String {

        return pumlGeneratorControllerIntf.generatePumlByGraphId(graphId)
//        return pumlGeneratorControllerIntf.generatePumlByGraphId("graph_1")
    }

}