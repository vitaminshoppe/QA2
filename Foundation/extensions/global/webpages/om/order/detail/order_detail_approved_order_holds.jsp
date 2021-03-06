<%/*******************************************************************************
Licensed Materials - Property of IBM
IBM Sterling Selling And Fulfillment Suite
(C) Copyright IBM Corp. 2005, 2013 All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 ********************************************************************************/%>
<%@ page import="com.yantra.yfc.util.*" %>
<%@ page import="com.yantra.yfs.ui.backend.*" %>

<%@ include file="/yfsjspcommon/yfsutil.jspf" %>
<%@ include file="/console/jsp/modificationutils.jspf" %>
<%@ include file="/console/jsp/order.jspf" %>

<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/om.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/tools.js"></script>

<script language="javascript">
	document.body.attachEvent("onunload", processSaveRecords);

	function checkReasonText(checkboxObj, iCounter)	{
		var oReasonText = document.all("xml:/Order/OrderHoldTypes/OrderHoldType_" + iCounter + "/@ReasonText");
		oReasonText.value = "";
		oReasonText.disabled = !checkboxObj.checked;
	}

</script>

<%
	String sAlloModElementName = "xml:/Order/AllowedModifications";
	String sBindingPrefix = "xml:/Order/OrderHoldTypes";
	String sBinding = sBindingPrefix + "/@OrderHoldType";
	String sName = "Order";
	String sXMLListName = "OrderHoldTypes";
	String sXMLName = "OrderHoldType";

	String sForWorkOrder = getParameter("ForWorkOrder");
	if(YFCCommon.equals("Y", sForWorkOrder ))	{
		sAlloModElementName = "xml:/WorkOrder/AllowedModifications";
		sName = "WorkOrder";
		sBindingPrefix = "/WorkOrder/WorkOrderHoldTypes";
		sBinding = "xml:" + sBindingPrefix + "/@WorkOrderHoldType";
		sXMLListName = "WorkOrderHoldTypes";
		sXMLName = "WorkOrderHoldType";
	}	

	//formMasterHoldXML(sXMLName, getElement(sName).getChildElement(sXMLListName), getElement("HoldTypeList"), getElement("HoldStatus") );
%>

<table class="table" cellspacing="0" width="100%" ID="specialChange">
    <thead>
        <tr>
            <td class="tablecolumnheader" sortable="no">&nbsp;</td>
            <td class="tablecolumnheader" ><yfc:i18n>Hold_Description</yfc:i18n></td>
            <td class="tablecolumnheader" ><yfc:i18n>Reason</yfc:i18n></td>
        </tr>
    </thead>
	<%
		String sHoldType = "xml:HoldType:/" + sXMLName + "/@HoldType";
		String sReasonText = "xml:HoldType:/" + sXMLName + "/@ReasonText";
		String sStatus = "xml:HoldType:/" + sXMLName + "/@Status";
	%>
    <tbody>
        <yfc:loopXML name="<%=sName%>" binding="<%=sBinding%>" id="HoldType">
			<%	YFCElement eHoldType = getElement("HoldType");
				if(equals("1300", eHoldType.getAttribute("Status") ) )	{
					String extraParams = getExtraParamsForTargetBinding("HoldType", resolveValue(sHoldType) );
			%>

			<tr>
				<td class="tablecolumn" nowrap="true">
				<%	if(YFCCommon.equals("Y", sForWorkOrder ))	{	%>
						<yfc:makeXMLInput name="HoldHistoryKey">
							<yfc:makeXMLKey binding="xml:/WorkOrder/@WorkOrderKey" value="xml:/WorkOrder/@WorkOrderKey"/>
						</yfc:makeXMLInput>
				<%	}	else	{	%>
						<yfc:makeXMLInput name="HoldHistoryKey">
							<yfc:makeXMLKey binding="xml:/Order/@OrderHeaderKey" value="xml:/Order/@OrderHeaderKey"/>
						</yfc:makeXMLInput>
				<%	}	%>

					<a <%=getDetailHrefOptions("L01", getParameter("HoldHistoryKey"), extraParams)%>><img class="columnicon" <%=getImageOptions(YFSUIBackendConsts.HISTORY_ORDER, "View_History")%>></a>
				</td>


				<td class="tablecolumn" >
					 <%=getComboText("xml:/HoldTypeList/@HoldType" ,"HoldTypeDescription" ,"HoldType" , sHoldType, true)%>
				</td>
				<td class="tablecolumn" >
					<yfc:getXMLValueI18NDB binding='<%=sReasonText%>'/>
				</td>
			<%	}	%>
        </yfc:loopXML>
    </tbody>
</table>
