package ru.vood.configurationserver.check

import org.slf4j.LoggerFactory
import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configurationserver.controller.intf.HolderResolver
import ru.vood.configurationserver.controller.intf.extractNamesPlaceholder

@Service
class PlaceHolderCheck(
    val holderResolvers :List<HolderResolver>,
    private val jdbcTemplate: JdbcOperations
) : CheckService {

    private val logger = LoggerFactory.getLogger(PlaceHolderCheck::class.java)
    override fun check() {
        val phFun = holderResolvers.map { it.placeHolderName }
        val factPh = jdbcTemplate.query("""select PROP_VALUE from PLACEHOLDER""", { rs, _ -> rs.getString(1) })

        val factPhR = factPh.flatMap { extractNamesPlaceholder(it) }

        val phFunNotInFact = phFun.minus(factPhR)

        phFunNotInFact.forEach {
            logger.info("'$it' found function without place holders ")
        }


        val factNotInPhFun = factPhR.minus(phFun)

        require(factNotInPhFun.size==0){"place holders without function $factNotInPhFun"}

    }
}