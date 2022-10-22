package ru.vood.configuration.server.controller

import io.mockk.every
import io.mockk.mockk
import io.mockk.verifyAll
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import ru.vood.configuration.server.check.CheckService
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.dto.PropertyPut
import ru.vood.configuration.server.repo.intf.FillDictRepository

internal class FillDictControllerImplTest {


    private var fillDictRepository: FillDictRepository = mockk(relaxed = true)


    private var checkService: CheckService = mockk(relaxed = true)

    private lateinit var fillDictController: FillDictController

    @BeforeEach
    fun init() {
        fillDictController = FillDictControllerImpl(fillDictRepository, checkService)
    }

    @Test
    fun dictServiceInsert() {
    }

    @Test
    fun dictTopicInsert() {
    }

    @Test
    fun dictArrowInsert() {
    }

    @Test
    fun dictFlinkPropertyInsert() {
    }

    @Test
    fun getFillDictRepository() {
        every { fillDictRepository.dictFlinkPropertyInsert(any(), any(), any()) } returns Unit
        every { checkService.check() } returns Unit

        val serviceId = "serviceId"
        val profileId = "ProfileId"
        fillDictController.flinkPropertyInsertByText(
            serviceId,
            profileId,
            """`"--mdm-enrichment.enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a05.toFieldName account_num "`
`"--mdm-enrichment.enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a06.fromFieldName is_virtual_card_flg "`
"""
        )

        verifyAll {
            fillDictRepository.dictFlinkPropertyInsert(
                serviceId,
                profileId,
                PropertyPut("enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a05.toFieldName", "account_num")
            )
            fillDictRepository.dictFlinkPropertyInsert(
                serviceId,
                profileId,
                PropertyPut(
                    "enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a06.fromFieldName",
                    "is_virtual_card_flg"
                )
            )
        }

    }
}