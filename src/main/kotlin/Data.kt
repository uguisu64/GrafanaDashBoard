import dataClass.GroupData
import freemarker.template.Configuration
import freemarker.template.Template
import java.io.StringWriter

object Data {
    private val cfg = Configuration(Configuration.VERSION_2_3_31)
    private val templateFile: Template

    //初期化ブロック(freemarker用に、templateファイルを指定している)
    init {
        cfg.setClassForTemplateLoading(this::class.java,"/templates/")
        templateFile = cfg.getTemplate("requestBody.ftl")
    }

    fun jsonFileString(groupDatas: List<GroupData>) : String {
        val out = StringWriter()
        templateFile.process(mapOf("groupDatas" to groupDatas),out)
        out.flush()
        return out.toString()
    }
}