package ru.vood.configurationserver.controller

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

    override fun generatePuml(srvId: String, profileId: String): String {
        val findBySrvIdAndProfileId = pumlGeneratorRepositoryIntf.findBySrvIdAndProfileId(srvId, profileId)

        val inTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.inTopics }.map { it.replace("-","_") }.toSet()
        val outTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.outTopics }.map { it.replace("-","_") }.toSet()
        val allTopic = inTopics.plus(outTopics)
//        """dev_ivr__uasp_realtime__mdm_enrichment__uaspdto [label="p0_ivr__uasp_realtime__mdm_enrichment__uaspdto" shape=box]"""
        val topics = allTopic.joinToString(separator = "\n") { t -> """$t [label="$t" shape=box];""" }

        //        """bevents_streaming_input_convertor_first_salary_transactions [label="{<f0> uasp-streaming-input-convertor |<f1> bevents-streaming-input-convertor-first-salary-transactions\n\n\n}" shape=Mrecord];"""
        val srvs = findBySrvIdAndProfileId
            .map { d -> d.srv }
            .joinToString(separator = "\n") { d -> """${d.serviceId} [label="{<f0> ${d.serviceId} |<f1> ${d.profileId}\n\n\n}" shape=Mrecord];""" }

        val topicToSrvArrow = findBySrvIdAndProfileId.flatMap { d -> d.topics.inTopics.map { t -> Arrow(t .replace("-","_") , d.srv.serviceId) } }.toSet()
        val srvToTopicArrow = findBySrvIdAndProfileId.flatMap { d -> d.topics.outTopics.map { t -> Arrow( d.srv.serviceId, t.replace("-","_") ) } }.toSet()

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
}

data class Arrow(val from: String, val to: String)
