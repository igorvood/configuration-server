package ru.vood.configuration.server.controller.intf

import ru.vood.configuration.server.controller.dto.PlaceHolder

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

 tailrec fun replaceDifficultPlaceHolders(
    propertyValue: String,
    placeHolders: List<PlaceHolder>
): String{

    val extractNamesPlaceholder = extractNamesPlaceholder(propertyValue)

    return if (extractNamesPlaceholder.isEmpty())
        propertyValue
    else{
        val filter = placeHolders.filter { it.placeHolderName == extractNamesPlaceholder.get(0) }.first()
        val replace = propertyValue.replace("\${" + filter.placeHolderName + "}", filter.placeHolderValue)
        if (replace==propertyValue)
            propertyValue
        else
            replaceDifficultPlaceHolders(replace,placeHolders)
    }


}