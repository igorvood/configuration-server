package ru.vood.configuration.server.repo

enum class Direction(val nodeTypeBegin: String,
                     val nodeTypeEnd: String) {

    IN("topic", "flink_srv"), OUT("flink_srv", "topic")

}
