package ru.vood.generatechangelog

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class GenerateChangelogApplication

fun main(args: Array<String>) {
    runApplication<GenerateChangelogApplication>(*args)
}
