import dataClass.GrafanaData
import dataClass.GroupData
import kotlinx.coroutines.runBlocking
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import java.io.File

fun main(args: Array<String>) {
    val filePathGroupData = args[1]
    val filePathGrafanaData = args[0]
    val jsonStringGroupData = File(filePathGroupData).readText()
    val jsonStringGrafanaData = File(filePathGrafanaData).readText()
    val groupData = Json.decodeFromString<List<GroupData>>(jsonStringGroupData)
    val grafanaData = Json.decodeFromString<GrafanaData>(jsonStringGrafanaData)

    val jsonData = Data.jsonFileString(groupData)

    println(jsonData)

    val isSuccess = runBlocking { Grafana.sendDashboard(jsonData, grafanaData) }

    println(isSuccess)
}