package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile
import ru.vood.configuration.server.repo.intf.FillDictRepository

@Service
class FillDictControllerImpl(
    val fillDictRepository: FillDictRepository
) : FillDictController {
    override fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String) {
        val graphFlinkServiceProfile =
            GraphFlinkServiceProfile(graphId, FlinkServiceProfile(FlinkService(serviceId, mainClass), profileId))
        fillDictRepository.dictServiceInsert(graphFlinkServiceProfile)
    }



    override fun dictTopicInsert(graphId: String, topicName: String){
        fillDictRepository.dictTopicInsert( graphId, topicName)
    }


    override fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    ) = fillDictRepository.dictArrowInsert(  direction, graphId, serviceId, profileId, topicName, propertyKey)
}