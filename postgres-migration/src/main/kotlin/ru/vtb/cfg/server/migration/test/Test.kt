package ru.vtb.cfg.server.migration.test

import org.springframework.boot.CommandLineRunner
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service

//@Service
class Test(
    val jdbcTemplate: JdbcTemplate
) : CommandLineRunner{
    override fun run(vararg args: String?) {
        val queryForObject = jdbcTemplate.queryForObject("select 1 from dual", {q,w->q.getString(1)})

        println(queryForObject)

    }
}