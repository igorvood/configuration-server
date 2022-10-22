package ru.vood.configuration.server.check

import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Service


@Service
class CheckRunner(
    val checks: List<CheckService>
) : CommandLineRunner {

    override fun run(vararg args: String?) {

        checkAll()


    }

    fun checkAll() {

        checks.forEach { ch ->

            ch.check()
        }


    }
}