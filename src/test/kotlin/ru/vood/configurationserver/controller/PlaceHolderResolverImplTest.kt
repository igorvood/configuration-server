package ru.vood.configurationserver.controller

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import ru.vood.configurationserver.controller.dto.PlaceHolder
import ru.vood.configurationserver.controller.intf.HolderResolver
import ru.vood.configurationserver.controller.intf.PlaceHoldersResolver

import ru.vood.configurationserver.repo.dto.EnvProperty
import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.FlinkServiceProfile

internal class PlaceHolderResolverImplTest {

    private val placeHolder_1 = "PlaceHolder_1"
    private val placeHolder_2 = "PlaceHolder_2"
    private val placeHolder_3 = "PlaceHolder_3"

    val sd = HolderResolverTest()

    val placeHoldersResolverImpl: PlaceHoldersResolver = PlaceHoldersResolverImpl(
        listOf(sd)
    )

    @Test
    fun placeHolders() {
        val listOf =
            listOf(
                EnvProperty("somePropertyName", "\${$placeHolder_1}___\${$placeHolder_2}_some_letters", 1, ""),
                EnvProperty("somePropertyName", "\${$placeHolder_1}___\${$placeHolder_3}_some_letters", 1, "")
            )

        val placeHolders = placeHoldersResolverImpl.placeHolders(
            listOf,
            FlinkServiceProfile(FlinkService("id_flinkService", "SomeMain"), "profileId")
        )

        Assertions.assertEquals(1, placeHolders.size)

        Assertions.assertEquals(PlaceHolder("$placeHolder_2", "${placeHolder_2}_value"), placeHolders.first())


    }

    class HolderResolverTest : HolderResolver {
        override val placeHolderName: String
            get() = "PlaceHolder_2"

        override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile): String = "PlaceHolder_2_value"
    }

}