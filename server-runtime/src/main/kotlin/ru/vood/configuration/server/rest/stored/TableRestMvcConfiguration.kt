package ru.vood.configuration.server.rest.stored

import io.swagger.v3.oas.annotations.Operation
import org.springdoc.core.Constants
import org.springdoc.webmvc.ui.SwaggerWelcomeCommon
import org.springframework.data.rest.core.config.RepositoryRestConfiguration
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer
import org.springframework.http.MediaType
import org.springframework.stereotype.Component
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.config.annotation.CorsRegistry
import javax.servlet.http.HttpServletRequest


@RestController
class TableRestMvcConfiguration {

    @Operation(hidden = true)
    @GetMapping(value = ["/tables/{tableName}"], produces = [MediaType.APPLICATION_JSON_VALUE])
    @RequestMapping
    fun openapiJson(request: HttpServletRequest): Map<String, Any> {
        val httpServletMapping = request.httpServletMapping

        return mapOf("q" to "qw")
    }

//    override fun configureRepositoryRestConfiguration(config: RepositoryRestConfiguration, cors: CorsRegistry) {
//
//        config.setBasePath("/api");
//        config.
//
//        super.configureRepositoryRestConfiguration(config, cors)
//    }

    //    @Bean
//    fun repositoryRestConfigurer(): RepositoryRestConfigurer? {
//        return object : RepositoryRestConfigurer() {
//            fun configureRepositoryRestConfiguration(config: RepositoryRestConfiguration, cors: CorsRegistry?) {
//                config.setBasePath("/api")
//            }
//        }
//    }
}

//class SwaggerConfigResource
///**
// * Instantiates a new Swagger config resource.
// *
// * @param swaggerWelcomeCommon the swagger welcome common
// */(
//    /**
//     * The Swagger welcome common.
//     */
//    private val swaggerWelcomeCommon: SwaggerWelcomeCommon
//) {
//    /**
//     * Openapi yaml map.
//     *
//     * @param request the request
//     * @return the map
//     */
//    @Operation(hidden = true)
//    @GetMapping(value = [Constants.SWAGGER_CONFIG_URL], produces = [MediaType.APPLICATION_JSON_VALUE])
//    fun openapiJson(request: HttpServletRequest?): Map<String, Any> {
//        return swaggerWelcomeCommon.openapiJson(request)
//    }
//}