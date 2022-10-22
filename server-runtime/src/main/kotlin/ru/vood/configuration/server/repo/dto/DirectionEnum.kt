package ru.vood.configuration.server.repo.dto

enum class DirectionEnum(
    val nodeTypeBegin: String,
    val nodeTypeEnd: String
) {

    IN("topic", "flink_srv"), OUT("flink_srv", "topic")

}
