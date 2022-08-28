package ru.vood.configurationserver.repo.dto

data class FlinkServiceDtoTemp(
    val serviceId: String,
    val profileId: String,
    val inTopic: String,
    val outTopic: String
)
