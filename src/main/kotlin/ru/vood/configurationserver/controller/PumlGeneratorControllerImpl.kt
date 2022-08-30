package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.FlinkGraph
import ru.vood.configurationserver.controller.dto.GraphNode
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

    private /*tailrec*/ fun calcGraphs(
        arrows: List<Arrow<out GraphNode, out GraphNode>>,
        flinkGraphs: List<FlinkGraph>
    ): List<FlinkGraph> {
        if (arrows.isEmpty()) return flinkGraphs

        val nextArrow = arrows.first()

        val onlyOneGraph = flinkGraphs.withIndex()
            .filter { indexedGr: IndexedValue<FlinkGraph> ->
                val gr: FlinkGraph = indexedGr.value
                gr.arrows
                    .flatMap { q -> listOf(q.from, q.to) }
                    .any { n -> n == nextArrow.from || n == nextArrow.to }
            }

        try {
            require(onlyOneGraph.isEmpty() || onlyOneGraph.size == 1) { "added arrow must be only ine or none $onlyOneGraph" }
        } catch (e: Throwable) {
            e.printStackTrace()
        }


        return if (onlyOneGraph.isEmpty())
            calcGraphs(arrows.drop(1), flinkGraphs.plus(FlinkGraph(listOf(nextArrow))))
        else {
            val currentGraph = onlyOneGraph.first().value
            val minus = flinkGraphs.minus(currentGraph)
            val newGraph = currentGraph.copy(arrows = currentGraph.arrows.plus(nextArrow))
            calcGraphs(arrows.drop(1), minus.plus(newGraph))
        }
    }
}

data class ArrowOld(val from: String, val to: String)


