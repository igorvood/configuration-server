package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import ru.vood.configuration.server.repo.dto.DataBasePlaceHolder
import ru.vood.configuration.server.repo.dto.FlinkService
import ru.vood.configuration.server.repo.dto.FlinkServiceProfile
import ru.vood.configuration.server.repo.dto.Graph
import ru.vood.configuration.server.repo.intf.DictRepository
import java.sql.ResultSet

@Repository
class DictRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : DictRepository {

    private val rowMapperFlinkService: (rs: ResultSet, rowNum: Int) -> FlinkService = { rs, _ ->
        FlinkService(
            rs.getString(1),
            rs.getString(2)
        )
    }

    override fun graphList(): Set<Graph> {
        return jdbcTemplate.query("""select distinct GRAPH_ID from DICT_ABSTRACT_GRAPH_NODE""") { rs, _ ->
            Graph(rs.getString(1))
        }.toSet()
    }

    override fun serviceList(): Set<FlinkService> {
        return jdbcTemplate.query("""select ID, MAIN_CLASS from DICT_SERVICE""", rowMapperFlinkService).toSet()
    }

    override fun serviceById(serviceId: String): FlinkService {
        return jdbcTemplate.queryForObject(
            """select ID, MAIN_CLASS from DICT_SERVICE where ID = ? """,
            rowMapperFlinkService,
            serviceId
        )!!
    }

    override fun serviceProfile(serviceId: String): Set<FlinkServiceProfile> {
        return jdbcTemplate.query(
            """select id, PROFILE_ID, MAIN_CLASS from dict_service_profile 
               where ID = ? 
            """,
            { rs, _ -> FlinkServiceProfile(FlinkService(rs.getString(1), rs.getString(2)), rs.getString(3)) },
            serviceId
        ).toSet()
    }

    override fun dbPlaceHolders(): Set<DataBasePlaceHolder> {
        return jdbcTemplate.query(
            """select id, DESCRIPTION, DEFAULT_VALUE from DICT_PLACE_HOLDER 
            """,
            { rs, _ -> DataBasePlaceHolder(rs.getString(1), rs.getString(2), rs.getString(3)) }

        ).toSet()
    }
}