package ru.vood.configuration.server.repo.dto

data class EnvProperty(
    val envPropertyName: String,
    val propertyValue: String,
    val priority: Int,
    val typeProperty: String
)
