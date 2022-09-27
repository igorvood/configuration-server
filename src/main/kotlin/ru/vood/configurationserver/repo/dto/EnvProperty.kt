package ru.vood.configurationserver.repo.dto

data class EnvProperty(
    val envPropertyName: String,
    val propertyValue: String,
    val priority: Int,
    val typyProperty: String
)
