import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.6.21"
//    application
}

group = "ru.vood"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_11

repositories {
    mavenCentral()
}

//extra["snippetsDir"] = file("build/generated-snippets")
//
//dependencies {
//    implementation("org.springframework.boot:spring-boot-starter-web")
//    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
//    implementation("org.jetbrains.kotlin:kotlin-reflect")
//    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
//    implementation("org.liquibase:liquibase-core")
//    implementation("org.springframework.boot:spring-boot-starter-jdbc")
//    implementation("org.springframework.boot:spring-boot-starter-data-jpa")
//    implementation("org.hibernate:hibernate-core")
//    implementation("io.arrow-kt:arrow-core:1.1.3")
//
////    implementation("io.swagger.core.v3:swagger-annotations:2.1.6")
////    implementation("io.swagger.codegen.v3:swagger-codegen-maven-plugin:3.0.24")
//
//    implementation("javax.validation:validation-api:2.0.1.Final")
//    implementation("org.springdoc:springdoc-openapi-data-rest:1.6.0")
//    implementation("org.springdoc:springdoc-openapi-ui:1.6.0")
//    implementation("org.springdoc:springdoc-openapi-kotlin:1.6.0")
//
//
//    developmentOnly("org.springframework.boot:spring-boot-devtools")
//    runtimeOnly("com.oracle.database.jdbc:ojdbc8")
//    annotationProcessor("org.springframework.boot:spring-boot-configuration-processor")
//    testImplementation("org.springframework.boot:spring-boot-starter-test")
//    testImplementation("org.springframework.restdocs:spring-restdocs-mockmvc")
//}
//
//tasks.withType<KotlinCompile> {
//    kotlinOptions {
//        freeCompilerArgs = listOf("-Xjsr305=strict")
//        jvmTarget = "11"
//    }
//}

//
//tasks.withType<Test> {
//    useJUnitPlatform()
//}

