package ru.vood.configurationserver.controller

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.intf.PumlGeneratorControllerIntf
import ru.vood.configurationserver.repo.intf.PumlGeneratorRepositoryIntf

@Service
class PumlGeneratorControllerImpl(
    val pumlGeneratorRepositoryIntf: PumlGeneratorRepositoryIntf
) : PumlGeneratorControllerIntf {

    override fun generatePuml(srvId: String, profileId: String): String {
        val findBySrvIdAndProfileId = pumlGeneratorRepositoryIntf.findBySrvIdAndProfileId(srvId, profileId)


        TODO("Not yet implemented")
    }
}