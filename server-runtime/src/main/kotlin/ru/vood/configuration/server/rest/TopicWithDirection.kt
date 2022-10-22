package ru.vood.configuration.server.rest

import ru.vood.configuration.server.repo.dto.DirectionEnum

data class TopicWithDirection (
    val    directionEnum: DirectionEnum,

    val        topicName: String,
    val        propertyKey: String


)
