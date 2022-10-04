package ru.vood.configurationserver.check

import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.intf.HolderResolver

@Service
class PlaceHolderCheck(
    val holderResolvers :List<HolderResolver>
) : CheckService {


    override fun check() {
//        TODO("Not yet implemented")
    }
}