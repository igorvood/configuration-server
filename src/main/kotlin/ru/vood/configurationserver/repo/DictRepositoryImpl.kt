package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import ru.vood.configurationserver.repo.dto.FlinkService
import ru.vood.configurationserver.repo.dto.Graph
import ru.vood.configurationserver.repo.intf.DictRepository
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
        return jdbcTemplate.queryForObject("""select ID, MAIN_CLASS from DICT_SERVICE where ID = :1 """, rowMapperFlinkService,serviceId)!!
    }
}