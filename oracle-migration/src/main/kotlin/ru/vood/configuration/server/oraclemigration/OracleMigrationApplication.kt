package ru.vood.configuration.server.oraclemigration

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class OracleMigrationApplication

fun main(args: Array<String>) {
    runApplication<OracleMigrationApplication>(*args)
}
