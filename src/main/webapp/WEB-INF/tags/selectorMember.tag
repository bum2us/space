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
		case "shGender":
		{
			txt="성별";
			options.add("남");
			options.add("여");
			options.add("기타");
			break;
		}
		case "shDateOption":
		{
			txt="검색구분";
			options.add("등록일");
			options.add("생년월일");
			break;
		}
		case "shOption":
		{
			txt = "검색위치";
			options.add("이름");
			options.add("ID");
			options.add("닉네임");
			options.add("Email");
			options.add("휴대전화");
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