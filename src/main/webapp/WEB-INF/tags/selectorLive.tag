<%@ tag language="java" pageEncoding="UTF-8" body-content="tagdependent"%>
<%@ tag import="java.util.ArrayList"%>
<%@ tag import="java.util.List"%>

<%@ attribute name="functionType" type="java.lang.String" %>
<%@ attribute name="op" type="java.lang.Integer" %>

<%
	List<String> options = new ArrayList<String>();
	String txt ="";	
	
	if(op == null)
		op = 0;
 
	switch(functionType)
	{
		case "shState":
		{
			txt="상태";
			options.add("예정");
			options.add("진행중");
			options.add("종료");
			break;
		}
		case "shDateOption":
		{
			txt="날짜구분";
			options.add("시작일");
			options.add("등록일");
			break;
		}
		case "shOption":
		{
			txt = "검색위치";
			options.add("TITLE");
			break;
		}
	};
	%>
	<select name="<%=functionType%>" class="form-control text-white">
	<option value="0" disabled selected hidden><%=txt%></option>
	<%
	for(int i = 0; i < options.size(); i++)
	{
			%><option value="<%=i+1%>" <%if(i+1 == op){%>selected<%}%> ><%=options.get(i)%></option><%		
	}
%>
</select>