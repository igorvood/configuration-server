package ru.vood.configuration.server.check

import org.slf4j.LoggerFactory
import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Service
import ru.vood.configuration.server.controller.intf.extractNamesPlaceholder
import ru.vood.configuration.server.controller.placeholder.intf.HolderResolver

@Service
class PlaceHolderCheck(
    val holderResolvers: List<HolderResolver>,
    private val jdbcTemplate: JdbcOperations
) : CheckService {

    private val logger = LoggerFactory.getLogger(PlaceHolderCheck::class.java)
    override fun check() {
        val classAndPlaceholders = holderResolvers.associate { it.javaClass to it.placeHolderName }
        val revert = classAndPlaceholders
            .entries
            .flatMap { e -> e.value.map { e.key to it } }
            .groupBy { it.second }
            .map { it.key to it.value.map { cl -> cl.first }.toSet() }
            .filter { it.second.size > 1 }
            .map {
                "Place holder " + it.first + " resolve in several class " + it.second.map { cl -> cl.name }
                    .joinToString(", ")
            }

        require(revert.isEmpty()) { revert }


        val phFun = holderResolvers.flatMap { it.placeHolderName }
        val factPh =
            jdbcTemplate.query("""select distinct PROP_VALUE from all_PLACEHOLDER""", { rs, _ -> rs.getString(1) })

        val factPhR = factPh.flatMap { extractNamesPlaceholder(it) }.toSet()

        val phFunNotInFact = phFun.minus(factPhR)

        phFunNotInFact.forEach {
            logger.warn("'$it' found function without place holders ")
        }

        val factNotInPhFun = factPhR.minus(phFun).sorted()

        require(factNotInPhFun.isEmpty()) { "${factNotInPhFun.size} place holders without function $factNotInPhFun" }

    }
}