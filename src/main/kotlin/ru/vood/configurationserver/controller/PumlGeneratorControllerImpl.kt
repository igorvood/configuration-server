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

        val inTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.inTopics }.toSet()
        val outTopics = findBySrvIdAndProfileId.flatMap { d -> d.topics.outTopics }.toSet()
        val allTopic = inTopics.plus(outTopics)
//        """dev_ivr__uasp_realtime__mdm_enrichment__uaspdto [label="p0_ivr__uasp_realtime__mdm_enrichment__uaspdto" shape=box]"""
        val topics = allTopic.joinToString(separator = "\n") { t -> """$t [label="$t" shape=box]""" }

        val srvs = findBySrvIdAndProfileId
            .map { d -> d.srv }
            .joinToString(separator = "\n") { d -> """${d.serviceId} [label="{<f0> ${d.serviceId} |<f1> ${d.profileId}\n\n\n}" shape=Mrecord];""" }

//        """bevents_streaming_input_convertor_first_salary_transactions [label="{<f0> uasp-streaming-input-convertor |<f1> bevents-streaming-input-convertor-first-salary-transactions\n\n\n}" shape=Mrecord];"""


        return """$head
            |$topics
            |$srvs
            |$tail
        """.trimMargin()
    }
}