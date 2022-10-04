package ru.vood.configurationserver.controller.intf

tailrec fun extractNamesPlaceholder(
    propertyValue: String,
    inListPlace: List<String> = listOf()
): List<String> {
    val beginIndex = propertyValue.indexOf("\${")
    val endIndex = propertyValue.indexOf("}")

    return if (beginIndex != -1 && endIndex != -1 && beginIndex < endIndex) {
        val substring = propertyValue.substring(beginIndex + 2, endIndex)
        val propertyName = propertyValue.substring(endIndex + 1)
        val plus = inListPlace.plus(substring)
        extractNamesPlaceholder(propertyName, plus)
    } else inListPlace
}