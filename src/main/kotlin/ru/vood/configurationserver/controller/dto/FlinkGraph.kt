package ru.vood.configurationserver.controller.dto


data class FlinkGraph(val arrows: List<Arrow<out GraphNode, out GraphNode>>)