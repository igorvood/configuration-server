package ru.vood.configurationserver.controller.dto

sealed interface GraphNode

data class Topic(val name: String) : GraphNode

data class FlinkService(val name: String) : GraphNode