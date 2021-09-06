package ${packageName}.mq.processor;

<#if isAutoImport?exists && isAutoImport==true>
import com.aifocus.base.common.dto.MqConfigDTO;
import com.aifocus.base.mq.processor.MessageProcessor;
import com.alibaba.fastjson.JSONObject;
import com.aliyun.openservices.ons.api.Message;
import ${packageName}.domain.dto.mq.WorkWxRedpackReceiveMQDTO;
import ${packageName}.service.WorkWxRedpackReceiveRecordService;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Slf4j
public class ${classInfo.className}Processor implements MessageProcessor<${classInfo.className}MQDTO> {

    @Resource
    private ${classInfo.className}Service ${classInfo.lcHeadClassName}Service;

    private List<MqConfigDTO> mqConfig;

    private static final String processorType = "${classInfo.className}Processor";

    @Override
    public void process(${classInfo.className}MQDTO data) {
        log.info("消息进来了=======>${classInfo.className}, data:{}", JSONObject.toJSONString(data));
    }

    @Override
    public boolean needIdempotent() {
        return true;
    }

    @Override
    public String getProcessType() {
        return processorType;
    }

    @Override
    public ${classInfo.className}MQDTO convertData(Object sourceData) {
        return (${classInfo.className}MQDTO) sourceData;
    }

    @Override
    public String getBusinessKey(${classInfo.className}MQDTO data, Message message) {
        return null;
    }

    @Override
    public List<MqConfigDTO> getMqConfig() {
        return mqConfig;
    }

    public void setMqConfig(List<MqConfigDTO> mqConfig) {
        this.mqConfig = mqConfig;
    }

}