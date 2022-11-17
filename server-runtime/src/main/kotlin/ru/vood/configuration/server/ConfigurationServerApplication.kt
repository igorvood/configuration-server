package ru.vood.configuration.server

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.transaction.annotation.EnableTransactionManagement

@SpringBootApplication
@EnableTransactionManagement
class ConfigurationServerApplication

fun main(args: Array<String>) {
    runApplication<ConfigurationServerApplication>(*args)
}
