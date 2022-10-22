package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional
import ru.vood.configuration.server.check.CheckService
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.Direction
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.GraphFlinkServiceProfile
import ru.vood.configuration.server.repo.intf.FillDictRepository

@Service
@Transactional(propagation = Propagation.REQUIRES_NEW)
class FillDictControllerImpl(
    val fillDictRepository: FillDictRepository,
    val checkService: CheckService
) : FillDictController {
    override fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String) {
        val graphFlinkServiceProfile =
            GraphFlinkServiceProfile(graphId, FlinkServiceProfile(FlinkService(serviceId, mainClass), profileId))
        fillDictRepository.dictServiceInsert(graphFlinkServiceProfile)
        checkService.check()
    }


    override fun dictTopicInsert(graphId: String, topicName: String) {
        fillDictRepository.dictTopicInsert(graphId, topicName)
        checkService.check()
    }


    override fun dictArrowInsert(
        direction: Direction,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    ): Unit {
        fillDictRepository.dictArrowInsert(direction, graphId, serviceId, profileId, topicName, propertyKey)
        checkService.check()
    }


    override fun flinkPropertyInsertByText(
        serviceId: String,
        profileId: String,
        propString: String
    ) {
        val split1 = propString
            .replace("`\"--", "")
            .replace("\"--", "")
            .replace(" \"`", "")
            .replace(" \"", "")
            .trim()
            .split("\n")

            .filter { it != "" }
        val map: List<Pair<String, String>> = split1
            .map { propKeyVal ->
                val split = propKeyVal.trim().split(" ")
                assert(split.size == 2) { "not compatible string '$propKeyVal'" }
                val key = split[0].substring(split[0].indexOf(".") + 1)
                val value = split[1]
                key to value
            }

        val map1 = map
            .map { it.first }
            .groupBy { it }
            .filter { it.value.size != 1 }
            .map { it.key }
        val dublicate = map1
            .joinToString(",")

        assert(dublicate.isEmpty()) { "dublicate keys $dublicate" }

        flinkPropertyInsertByList(serviceId, profileId, map)
    }

    override fun flinkPropertyInsertByList(
        serviceId: String,
        profileId: String,
        propsAndVal: List<Pair<String, String>>
    ) {
        propsAndVal.forEach { keyVal ->
            fillDictRepository.dictFlinkPropertyInsert(serviceId, profileId, keyVal.first, keyVal.second)
        }
        checkService.check()
    }

}