package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.repo.FlinkServiceDto
import ru.vood.configurationserver.repo.FlinkServiceDtoTemp

interface PumlGeneratorServiceRopository {

    fun findBySrvIdAndProfileId(srvId: String, profileId: String): Set<FlinkServiceDto>


}