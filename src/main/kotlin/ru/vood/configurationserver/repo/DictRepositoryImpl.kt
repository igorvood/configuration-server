package ru.vood.configurationserver.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import ru.vood.configurationserver.repo.dto.Graph
import ru.vood.configurationserver.repo.intf.DictRepository

@Repository
class DictRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : DictRepository {
    override fun graphList(): Set<Graph> {
        return jdbcTemplate.query("""select distinct GRAPH_ID from DICT_ABSTRACT_GRAPH_NODE""") { rs, o ->
            Graph(rs.getString(1))
        }.toSet()
    }
}