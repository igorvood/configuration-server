package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.PlaceHolderResolver
import ru.vood.configurationserver.repo.dto.EnvProperty

@Service
class PlaceHolderResolverImpl : PlaceHolderResolver {


//  TODO  сюда прикрутить хвостовую рекурсию при случае
    private fun extractNamesPlaceholder(propertyValue: String): List<String> {
        val beginIndex = propertyValue.indexOf("\${")
        val endIndex = propertyValue.indexOf("}")

        return if (beginIndex!=-1 && endIndex!=-1 && beginIndex>endIndex) {
            val substring = propertyValue.substring(beginIndex, endIndex)

            val propertyValue1 = propertyValue.substring(endIndex)
            listOf(substring).plus(extractNamesPlaceholder(propertyValue1))
        }
        else listOf()

    }

    override fun placeHolders(property: List<EnvProperty>): List<PlaceHolder> {
        val propertyWithPlaceHolder = property
            .filter { it.propertyValue.contains("\${") && it.propertyValue.contains("}") }
            .flatMap { prop->
                val placeHolders: List<String> = extractNamesPlaceholder(prop.propertyValue)
                placeHolders.map { place -> place to  prop} }

        TODO("Not yet implemented")
    }
}