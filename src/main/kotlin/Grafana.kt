import dataClass.GrafanaData
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.http.*

object Grafana {
    private const val dashboardApi = "/api/dashboards/db"

    suspend fun sendDashboard(bodyJson: String, grafanaData: GrafanaData): Boolean {
        val client = HttpClient(CIO)

        val status = client.post("${grafanaData.url}${dashboardApi}") {
            header("Authorization","Bearer $grafanaData.token")
            contentType(ContentType.Application.Json)
            setBody(bodyJson)
        }.status

        return status == HttpStatusCode.OK
    }
}