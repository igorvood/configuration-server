package ru.vood.configuration.server.check

import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Service


@Service
class CheckRunner(
    val checks: List<CheckService>
): CommandLineRunner {

    override fun run(vararg args: String?) {

        checks.forEach { ch ->

            ch.check()
        }


    }
}