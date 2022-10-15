package ru.vood.configuration.server.controller.dto

sealed interface GraphNode {
    val alias: String
    fun pamlUmlText(): String
}

data class Topic(
    val name: String,
    val isOur: Boolean,
    val cntPartition: Int
) : GraphNode {
    override val alias: String
        get() = name.replace("-", "_")

    override fun pamlUmlText(): String {
        val color = if (isOur) "Green" else "FireBrick"
//        return """$alias [label="{<f0> $alias |<f1> partitionCnt_$cntPartition\n\n\n}" shape=box color=$color];"""
        return """$alias [label="$alias" shape=box color=$color];"""

    }

}

data class FlinkService(val name: String) : GraphNode {
    override val alias: String
        get() = name
            .replace("-", "_")
            .replace("~", "_")

    override fun pamlUmlText(): String {
//        """${d.serviceId} [label="{<f0> ${d.serviceId} |<f1> ${d.profileId}\n\n\n}" shape=Mrecord];"""

        return """${alias} [label="{<f0> ${alias} |<f1> ${alias}\n\n\n}" shape=Mrecord];"""


    }
}