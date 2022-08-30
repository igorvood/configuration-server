package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.Arrow
import ru.vood.configurationserver.controller.dto.FlinkGraph
import ru.vood.configurationserver.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configurationserver.repo.intf.PumlGeneratorRepositoryIntf
import ru.vood.configurationserver.controller.dto.*
@Service
class PumlGeneratorControllerImpl(
    val pumlGeneratorRepositoryIntf: PumlGeneratorRepositoryIntf
) : PumlGeneratorControllerIntf {

    private val head = """@startuml
digraph dfd{
	node[shape=record]"""

    private val tail = """}
@enduml"""

    override fun generatePuml(srvId: String, profileId: String): String {
        val findBySrvIdAndProfileId = pumlGeneratorRepositoryIntf.findBySrvIdAndProfileId(srvId, profileId)


        val inTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.inTopics }.map { it.replace("-", "_") }.toSet()
        val outTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.outTopics }.map { it.replace("-", "_") }.toSet()
        val allTopic = inTopics.plus(outTopics)
//        """dev_ivr__uasp_realtime__mdm_enrichment__uaspdto [label="p0_ivr__uasp_realtime__mdm_enrichment__uaspdto" shape=box]"""
        val topics = allTopic.joinToString(separator = "\n") { t -> """$t [label="$t" shape=box];""" }

        //        """bevents_streaming_input_convertor_first_salary_transactions [label="{<f0> uasp-streaming-input-convertor |<f1> bevents-streaming-input-convertor-first-salary-transactions\n\n\n}" shape=Mrecord];"""
        val srvs = findBySrvIdAndProfileId
            .map { d -> d.srv }
            .joinToString(separator = "\n") { d -> """${d.serviceId} [label="{<f0> ${d.serviceId} |<f1> ${d.profileId}\n\n\n}" shape=Mrecord];""" }

        val topicToSrvArrow = findBySrvIdAndProfileId.flatMap { d ->
            d.topics.inTopics.map { t ->
                ArrowOld(
                    t.replace("-", "_"),
                    d.srv.serviceId
                )
            }
        }.toSet()
        val srvToTopicArrow = findBySrvIdAndProfileId.flatMap { d ->
            d.topics.outTopics.map { t ->
                ArrowOld(
                    d.srv.serviceId,
                    t.replace("-", "_")
                )
            }
        }.toSet()

        val arrows = topicToSrvArrow.plus(srvToTopicArrow)
//"""uasp_streaming_mdm_enrichment_rates:p1->dev_ivr__uasp_realtime__outer_cbr_rate__ask"""
        val arrowsStr = arrows.joinToString(separator = "\n") { d -> """${d.from} -> ${d.to}""" }


        val trimMargin = """$head
            |
            |$topics
            |
            |$srvs
            |
            |$arrowsStr
            |
            |$tail
            
        """.trimMargin()
        return trimMargin
    }

    override fun generatePumlNew(srvId: String, profileId: String): String {
        val findBySrvIdAndProfileId = pumlGeneratorRepositoryIntf.findBySrvIdAndProfileId(srvId, profileId)
        val arrows = findBySrvIdAndProfileId
            .flatMap { d ->
                val toSrv = d.topics.inTopics
                    .map { s -> Arrow(Topic(s), FlinkService(d.srv.serviceId)) }
                val fromSrv = d.topics.outTopics
                    .map { s -> Arrow(FlinkService(d.srv.serviceId), Topic(s)) }
                toSrv.plus(fromSrv)
            }
        val mutableListOf = listOf<FlinkGraph>()
        val graphs = calcGraphs(arrows, mutableListOf)
        graphs

        return ""
    }

    private /*tailrec*/ fun calcGraphs(arrows: List<Arrow<out GraphNode, out GraphNode>>, flinkGraphs: List<FlinkGraph>): List<FlinkGraph> {
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
} catch (e:Throwable){
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


