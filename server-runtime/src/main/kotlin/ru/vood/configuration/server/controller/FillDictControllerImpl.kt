package ru.vood.configuration.server.controller

import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional
import ru.vood.configuration.server.check.CheckRunner
import ru.vood.configuration.server.controller.intf.FillDictController
import ru.vood.configuration.server.repo.dto.*
import ru.vood.configuration.server.repo.intf.FillDictRepository

@Service
@Transactional(propagation = Propagation.REQUIRES_NEW)
class FillDictControllerImpl(
    val fillDictRepository: FillDictRepository,
    val checkService: CheckRunner
) : FillDictController {
    override fun dictServiceInsert(graphId: String, serviceId: String, profileId: String, mainClass: String) {
        val graphFlinkServiceProfile =
            GraphFlinkServiceProfile(graphId, FlinkServiceProfile(FlinkService(serviceId, mainClass), profileId))
        fillDictRepository.dictServiceInsert(graphFlinkServiceProfile)
        checkService.checkAll()
    }


    override fun dictTopicInsertList(topics: List<TopicPut>) {
        topics.forEach {
            fillDictRepository.dictTopicInsert(it.graphId, it.topicName)
        }
        checkService.checkAll()
    }

    override fun dictArrowInsert(
        directionEnum: DirectionEnum,
        graphId: String,
        serviceId: String,
        profileId: String,
        topicName: String,
        propertyKey: String
    ): Unit {
        fillDictRepository.dictArrowInsert(directionEnum, graphId, serviceId, profileId, topicName, propertyKey)
        checkService.checkAll()
    }


    override fun flinkPropertyInsertByTextEnv(
        serviceId: String,
        profileId: String,
        propString: String
    ) {
        insert(" ", serviceId, profileId, propString)
    }

    override fun flinkPropertyInsertByTextProp(
        serviceId: String,
        profileId: String,
        propString: String
    ) {
        insert("=", serviceId, profileId, propString)
    }

    private fun insert(
        delimiters: String,
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
        val map = split1
            .map { propKeyVal ->

                val split = propKeyVal.trim().split(delimiters)
                assert(split.size == 2) { "not compatible string '$propKeyVal'" }
                val key = split[0].substring(split[0].indexOf(".") + 1)
                val value = split[1]
                key to value
            }.map { PropertyPut(it.first, it.second) }

        val map1 = map
            .map { it.name }
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
        propsAndVal: List<PropertyPut>
    ) {
        propsAndVal.forEach { keyVal ->
            fillDictRepository.dictFlinkPropertyInsert(serviceId, profileId, keyVal)
        }
        checkService.checkAll()
    }

}