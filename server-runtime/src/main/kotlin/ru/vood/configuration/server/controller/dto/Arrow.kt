package ru.vood.configuration.server.controller.dto

data class Arrow<F : GraphNode, T : GraphNode>(val from: F, val to: T) {
    fun pamlUmlText(): String = """${from.alias} -> ${to.alias}"""
}