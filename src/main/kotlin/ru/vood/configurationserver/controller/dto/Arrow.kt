package ru.vood.configurationserver.controller.dto

data class Arrow<F : GraphNode, T : GraphNode>(val from: F, val to: T)