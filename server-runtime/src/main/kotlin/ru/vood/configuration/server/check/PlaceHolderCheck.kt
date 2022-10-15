package ru.vood.configuration.server.check

import org.slf4j.LoggerFactory
import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver
import ru.vood.configuration.server.controller.intf.extractNamesPlaceholder

@Service
class PlaceHolderCheck(
    val holderResolvers :List<HolderResolver>,
    private val jdbcTemplate: JdbcOperations
) : CheckService {

    private val logger = LoggerFactory.getLogger(PlaceHolderCheck::class.java)
    override fun check() {



        val phFun = holderResolvers.flatMap { it.placeHolderName }
        val factPh = jdbcTemplate.query("""select distinct PROP_VALUE from PLACEHOLDER""", { rs, _ -> rs.getString(1) })

        val factPhR = factPh.flatMap { extractNamesPlaceholder(it) }.toSet()

        val phFunNotInFact = phFun.minus(factPhR)

        phFunNotInFact.forEach {
            logger.info("'$it' found function without place holders ")
        }

        val factNotInPhFun = factPhR.minus(phFun).sorted()

        require(factNotInPhFun.isEmpty()){"${factNotInPhFun.size} place holders without function $factNotInPhFun"}

    }
}