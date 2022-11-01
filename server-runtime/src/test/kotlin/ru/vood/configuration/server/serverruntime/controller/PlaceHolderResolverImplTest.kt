package ru.vood.configurationserver.controller

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import ru.vood.configuration.server.controller.PlaceHoldersResolverImpl
import ru.vood.configuration.server.controller.dto.PlaceHolder
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.controller.placeholder.intf.PlaceHoldersResolver

import ru.vood.configuration.server.repo.dto.EnvProperty
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.StandEnum

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
            FlinkServiceProfile(FlinkService("id_flinkService", "SomeMain"), "profileId"),
            StandEnum.NOTEBOOK
        )

        Assertions.assertEquals(1, placeHolders.size)

        Assertions.assertEquals(PlaceHolder("$placeHolder_2", "${placeHolder_2}_value"), placeHolders.first())


    }

    class HolderResolverTest : HolderResolver {
        override fun valuePlaceHolder(flinkServiceProfile: FlinkServiceProfile, ph: String, stand: StandEnum): String =
            "PlaceHolder_2_value"

        override val placeHolderName: Set<String>
            get() = setOf("PlaceHolder_2")

    }

}