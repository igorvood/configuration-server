package ru.vood.configurationserver.controller.dto

sealed interface GraphNode {
    val alias: String
    fun pamlUmlText(): String
}

data class Topic(val name: String) : GraphNode {
    override val alias: String
        get() = name.replace("-", "_")

    override fun pamlUmlText(): String {

        return """$alias [label="$alias" shape=box];"""
    }

}

data class FlinkService(val name: String) : GraphNode {
    override val alias: String
        get() = name.replace("-", "_")

    override fun pamlUmlText(): String {
//        """${d.serviceId} [label="{<f0> ${d.serviceId} |<f1> ${d.profileId}\n\n\n}" shape=Mrecord];"""

        return """${alias} [label="{<f0> ${alias} |<f1> ${alias}\n\n\n}" shape=Mrecord];"""


    }
}