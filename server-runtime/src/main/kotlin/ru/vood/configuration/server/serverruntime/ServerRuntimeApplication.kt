package ru.vood.configuration.server.serverruntime

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class ServerRuntimeApplication

fun main(args: Array<String>) {
    runApplication<ServerRuntimeApplication>(*args)
}
