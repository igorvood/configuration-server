package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configurationserver.repo.intf.PumlGeneratorRepositoryIntf

@Service
class PumlGeneratorControllerImpl(
    val pumlGeneratorRepositoryIntf: PumlGeneratorRepositoryIntf
) : PumlGeneratorControllerIntf {

    private val head = """@startuml
digraph dfd{
	node[shape=record]"""

    private val tail = """}
@enduml"""

    override fun generatePumlByGraphId(graphId: String): String {
        val arrows = pumlGeneratorRepositoryIntf.findByGraphId(graphId)
        val nodesStr = arrows
            .flatMap { it -> listOf(it.from, it.to) }
            .toSet()
            .joinToString(separator = "\n") { it.pamlUmlText() }

        val joinToString = arrows
            .joinToString(separator = "\n") { it.pamlUmlText() }

        val trimMargin = """$head
            |
            |$nodesStr
            |
            |$joinToString
            |
            |$tail
        """.trimMargin()
        return trimMargin
    }

}


