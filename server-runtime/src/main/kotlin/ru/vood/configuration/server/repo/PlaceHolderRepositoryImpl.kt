package ru.vood.configuration.server.repo

import org.springframework.jdbc.core.JdbcOperations
import org.springframework.stereotype.Repository
import ru.vood.configuration.server.repo.dto.DataBasePlaceHolder
import ru.vood.configuration.server.repo.dto.StandEnum
import ru.vood.configuration.server.repo.intf.PlaceHolderRepository

@Repository
class PlaceHolderRepositoryImpl(
    private val jdbcTemplate: JdbcOperations
) : PlaceHolderRepository {
    override fun dbPlaceHolders(): Set<DataBasePlaceHolder> {
        return jdbcTemplate.query(
            """select id, DESCRIPTION, DEFAULT_VALUE from DICT_PLACE_HOLDER 
            """,
            { rs, _ -> DataBasePlaceHolder(rs.getString(1), rs.getString(2), rs.getString(3)) }

        ).toSet()
    }

    override fun placeHolderByService(
        serviceId: String,
        profileId: String,
        stand: StandEnum,
        placeHolderName: String
    ): String {

        val queryForObject = jdbcTemplate.queryForObject("""
            select PLACEHOLDER_VALUE from RESOLVABLE_PLACEHOLDER
            where SERVICE_ID = ? and PROFILE_ID = ? and STAND = ? and PLACEHOLDER_ID = ?
        """, { rs, r ->
            rs.getString(1)
        }, serviceId, profileId, stand.name, placeHolderName
        )!!
        return queryForObject
    }

}