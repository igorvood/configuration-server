package ru.vood.configuration.server.repo.dto

enum class StandEnum(val local: Boolean) {
    NOTEBOOK(true),
    NOTEBOOK_DSO(true),
    DSO(false),
    IFT(false),
    NT(false),
    REAL(false),
    P0(false),

}
