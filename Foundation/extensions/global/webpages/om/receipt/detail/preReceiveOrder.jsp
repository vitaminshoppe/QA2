<%/*******************************************************************************
Licensed Materials - Property of IBM
IBM Sterling Selling And Fulfillment Suite
(C) Copyright IBM Corp. 2005, 2013 All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 ********************************************************************************/%>
<%@ include file="/yfsjspcommon/yfsutil.jspf"%>

<%
	
	String inputStr = request.getParameter("YFCInput");
	YFCDocument inDoc = null;
	YFCElement inElem = null;
	YFCElement tempElem = null;

	if (!isVoid(inputStr)) {
		inDoc = YFCDocument.parse(inputStr);
		inElem = inDoc.getDocumentElement();
	}
	
%>

	<yfc:callAPI apiName="preReceiveOrder" inputElement="<%=inElem%>" />

<%
	
	YFCElement outElem = (YFCElement)request.getAttribute("Receipt");
	response.getWriter().write(outElem.getString());
	response.getWriter().flush();
	response.getWriter().close();

%>
