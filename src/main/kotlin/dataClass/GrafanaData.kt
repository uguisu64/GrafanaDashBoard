package dataClass

@kotlinx.serialization.Serializable
data class GrafanaData(
    val url: String,
    val token: String,
)
