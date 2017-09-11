package ***.bd.cmm;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;
import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMapping;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.scope.SessionScope;
import com.ibatis.sqlmap.engine.scope.StatementScope;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BizlogRecordDAO")
public class BizlogRecordDAO extends EgovAbstractDAO{

    @Override
    @Resource(name="oracleSqlMapClient")
    public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        // TODO Auto-generated method stub
        super.setSuperSqlMapClient(sqlMapClient);
    }


    /**
     * bizLog를 입력한다.
     * @param appId 업무ID (RS:동계, VM:모바일, MA:지도서비스)
     * @param programeID 프로그램ID
     * @param viewID 화면ID
     * @param sqlID sqlID
     * @param Object vo sql에 바인딩 되는 Object
     * @exception Exception
     */
	@Async
	public void insertBizLog(String appId, String programeId, String viewId, String sqlId, Object vo) throws Exception{

		try{
			BizLogVO bizLogVo = new BizLogVO();
			bizLogVo.setAppId(appId);
			bizLogVo.setProgrameId(programeId);
			bizLogVo.setViewId(viewId);
			bizLogVo.setLogInfo(objectToString(vo, "^"));
			bizLogVo.setBizSql(getSqlString(sqlId, vo));
			insert("BizlogRecordDAO.insertBizLog", bizLogVo);

		}catch(Exception e){
			e.printStackTrace();
		}

	}

    /**
     * bizLog를 입력한다.
     * @param appId 업무ID (RS:동계, VM:모바일, MA:지도서비스)
     * @param programeID 프로그램ID
     * @param viewID 화면ID
     * @param sqlID sqlID
     * @exception Exception
     */
	@Async
	public void insertBizLog(String appId, String programeId, String viewId, String sqlId) throws Exception{

		try{

			BizLogVO bizLogVo = new BizLogVO();
			bizLogVo.setAppId(appId);
			bizLogVo.setProgrameId(programeId);
			bizLogVo.setViewId(viewId);
			bizLogVo.setLogInfo("");
			bizLogVo.setBizSql(getSqlString(sqlId, null));
			insert("BizlogRecordDAO.insertBizLog", bizLogVo);

		}catch(RuntimeException e){
			System.out.println(e);
		}

	}

	private static class BizLogVO{

		private String appId;             // CTGRY_LCLAS
		private String programeId;        // CTGRY_MLSFC
		private String viewId;            // CTGRY_SCLAS
		private String logInfo;
		private String bizSql;

		public String getAppId() {
			return padRight(appId, 3);
		}

		public void setAppId(String appId) {
			this.appId = "O"+appId;
		}

		public String getProgrameId() {
			return programeId;
		}

		public void setProgrameId(String programeId) {
			this.programeId = programeId;
		}

		public String getViewId() {
			return viewId;
		}

		public void setViewId(String viewId) {
			this.viewId = viewId;
		}

		public String getLogInfo() {
			return logInfo;
		}

		public void setLogInfo(String logInfo) {
			this.logInfo = logInfo;
		}

		public String getBizSql() {
			return bizSql;
		}
		public void setBizSql(String bizSql) {
			this.bizSql = bizSql;
		}

		public String padRight(String str, int len){
			return String.format("%-"+len+"s", str).replace(' ', 'x');
		}

	}


	private String getSqlString(String sqlId, Object vo) throws Exception{

	    MappedStatement mappedStatement;
	    StatementScope statementScope;
	    SessionScope sessionScope;
	    mappedStatement = ((ExtendedSqlMapClient) getSqlMapClient()).getMappedStatement(sqlId);
	    sessionScope = new SessionScope();
	    statementScope = new StatementScope(sessionScope);

	    if(vo == null){

	    	return getTrimSql(mappedStatement.getSql().getSql(statementScope,vo));

	    }else{

	    	mappedStatement.initRequest(statementScope);
	    	ParameterMap parameterMap= mappedStatement.getSql().getParameterMap(statementScope, vo);
		    Object[] bindParameter = parameterMap.getParameterObjectValues(statementScope, vo);
		    ParameterMapping[] parameterMapping = parameterMap.getParameterMappings();

		    String preparedStatement = mappedStatement.getSql().getSql(statementScope, vo);

		    for(int i=0; i < bindParameter.length; i++){
		    	if(parameterMapping[i].getJdbcType() == 0){
		    		preparedStatement = preparedStatement.replaceFirst("[?]", "'"+bindParameter[i].toString()+"'");
		    	}else{
		    		preparedStatement = preparedStatement.replaceFirst("[?]", bindParameter[i].toString());
		    	}
		    }

		    return getTrimSql(preparedStatement);
	    }

   }

	private String getTrimSql(String sql){

		char[] toCharArray =  sql.toCharArray();
		int index = 1;

		for(int i=0; i< toCharArray.length; i++){
			toCharArray[index] = toCharArray[i];
			if(toCharArray[index] != ' '){
				index++;
			}else if(toCharArray[index - 1] != ' '){
				index++;
			}

		}
		return new String(toCharArray,0,index).trim();
	}

	 private String objectToString(Object obj, String separator) {
		 if (obj == null)
	         return "";

        String reflectionString = ReflectionToStringBuilder.toString(obj);
        Matcher m = Pattern.compile("\\[([^]]+)\\]").matcher(reflectionString);
        String result = "";

	    while (m.find()) {
	    	result = m.group(1);
	        break;
	    }

	    return result.replaceAll("\\,", separator).replaceAll("\\<null\\>", "");

	 }

}
