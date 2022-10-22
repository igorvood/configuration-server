package ru.vood.configuration.server.controller

import com.ninjasquad.springmockk.MockkBean
import io.mockk.every
import io.mockk.verifyAll
import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.extension.ExtendWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.junit.jupiter.SpringExtension
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.intf.FillDictRepository

@ExtendWith(SpringExtension::class)
@SpringBootTest
internal class FillDictControllerImplTest {

    @MockkBean(relaxed = true)
    private lateinit var fillDictRepository: FillDictRepository

    @Autowired
    private lateinit var fillDictController: FillDictController

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
        every { fillDictRepository.dictFlinkPropertyInsert(any(),any(),any(),any() ) } returns Unit

        val serviceId = "serviceId"
        val profileId = "ProfileId"
        fillDictController.dictFlinkPropertyInsert(
            serviceId, profileId, """`"--mdm-enrichment.enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a05.toFieldName account_num "`
`"--mdm-enrichment.enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a06.fromFieldName is_virtual_card_flg "`
"""
        )

        verifyAll {
            fillDictRepository.dictFlinkPropertyInsert(serviceId, profileId, "enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a05.toFieldName", "account_num")
            fillDictRepository.dictFlinkPropertyInsert(serviceId, profileId, "enrichOne.GlobalIdEnrichProperty${'$'}.fieldsList.a06.fromFieldName", "is_virtual_card_flg")
        }

    }
}