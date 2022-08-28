package ru.vood.configurationserver.repo.intf

import ru.vood.configurationserver.repo.dto.FlinkServiceDto

interface PumlGeneratorServiceRopository {

    fun findBySrvIdAndProfileId(srvId: String, profileId: String): Set<FlinkServiceDto>


}