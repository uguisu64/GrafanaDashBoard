package dataClass

@kotlinx.serialization.Serializable
data class GroupData(
    val name: String,
    val userList: List<Int>
)
