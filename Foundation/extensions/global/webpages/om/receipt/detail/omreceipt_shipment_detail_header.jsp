<%/*******************************************************************************
Licensed Materials - Property of IBM
IBM Sterling Selling And Fulfillment Suite
(C) Copyright IBM Corp. 2005, 2013 All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 ********************************************************************************/%>
<%@include file="/yfsjspcommon/yfsutil.jspf"%>
<%@ include file="/console/jsp/modificationutils.jspf" %>
<%@ page import="com.yantra.yfs.ui.backend.*" %>
<% String sMode="byattr";
request.setAttribute("xml:/Receipt/@Mode", sMode);
%>
<% String sTransactionId="RECEIVE_ORDER";%>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/tools.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/modificationreason.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/om.js"></script>


<script language="javascript">

    function setHidden(obj) {
        var cssText = obj.style.cssText;
        if (cssText)
            obj.style.visibility = "hidden";
        else
            obj.style.cssText = "visibility:hidden";
    }

    function setVisible(obj) {
        var cssText = obj.style.cssText;
        if (cssText)
            obj.style.visibility = "visible";
        else
            obj.style.cssText = "visibility:visible";
    }

	function setpalletattributes(){
		var var1 = document.all("receive_pallet_id");
		var var2 = document.all("receive_case_id");
		setVisible(var1);
		setHidden(var2);
		document.all("xml:/Receipt/@CaseId").value="";
		document.all["xml:/Receipt/@CloseCase"].checked=false;
				
	}
	function setcaseattributes(){

		var var1 = document.all("receive_case_id");
		var var2 = document.all("receive_pallet_id");
		setVisible(var1);
		setHidden(var2);
		document.all("xml:/Receipt/@PalletId").value="";
		document.all["xml:/Receipt/@ClosePallet"].checked=false;
		
	}

	function setnoneattributes() {
		var var1 = document.all("receive_case_id");
		var var2 = document.all("receive_pallet_id");
		setHidden(var1);
		setHidden(var2);
		document.all("xml:/Receipt/@CaseId").value="";
		document.all["xml:/Receipt/@CloseCase"].checked=false;
		document.all("xml:/Receipt/@PalletId").value="";
		document.all["xml:/Receipt/@ClosePallet"].checked=false;
	}
</script>

<table class="view" width="100%">
<yfc:makeXMLInput name="inventoryKey">
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptNo" value="xml:/Receipt/@ReceiptNo"></yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingNode" value="xml:/Receipt/@ReceivingNode"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptHeaderKey" value="xml:/Receipt/@ReceiptHeaderKey"> </yfc:makeXMLKey>
</yfc:makeXMLInput>
<yfc:makeXMLInput name="receiptKey">
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptHeaderKey" value="xml:/Receipt/@ReceiptHeaderKey"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptNo" value="xml:/Receipt/@ReceiptNo"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingDock" value="xml:/Receipt/@ReceivingDock"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingNode" value="xml:/Receipt/@ReceivingNode"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@DocumentType" value="xml:/Receipt/Shipment/@DocumentType"> </yfc:makeXMLKey>
</yfc:makeXMLInput>
<yfc:makeXMLInput name="closeReceiptKey">
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptHeaderKey" value="xml:/Receipt/@ReceiptHeaderKey"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptNo" value="xml:/Receipt/@ReceiptNo"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingDock" value="xml:/Receipt/@ReceivingDock"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingNode" value="xml:/Receipt/@ReceivingNode"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@DocumentType" value="xml:/Receipt/Shipment/@DocumentType"> </yfc:makeXMLKey>
</yfc:makeXMLInput>
<yfc:makeXMLInput name="shipmentKey">
		<yfc:makeXMLKey binding="xml:/Shipment/@ShipmentKey" value="xml:/Receipt/Shipment/@ShipmentKey"> </yfc:makeXMLKey>
</yfc:makeXMLInput>
<yfc:makeXMLInput name="orderKey">
		<yfc:makeXMLKey binding="xml:/Order/@OrderHeaderKey" value="xml:/Receipt/Shipment/@OrderHeaderKey"> </yfc:makeXMLKey>
</yfc:makeXMLInput>
<tr>
	<yfc:makeXMLInput name="receiptKeyForReceive">
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptHeaderKey" value="xml:/Receipt/@ReceiptHeaderKey"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceiptNo" value="xml:/Receipt/@ReceiptNo"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingDock" value="xml:/Receipt/@ReceivingDock"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ReceivingNode" value="xml:/Receipt/@ReceivingNode"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@DocumentType" value="xml:/Receipt/Shipment/@DocumentType"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ShipmentKey" value="xml:/Receipt/@ShipmentKey"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@ShipmentNo" value="xml:/Receipt/Shipment/@ShipmentNo"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@OrderNo" value="xml:/Receipt/Shipment/@OrderNo"> </yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@EnterpriseCode" value="xml:/Receipt/Shipment/@EnterpriseCode"> 
		</yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@BuyerOrganizationCode" value="xml:/Receipt/Shipment/@BuyerOrganizationCode"> 
		</yfc:makeXMLKey>
		<yfc:makeXMLKey binding="xml:/Receipt/@SellerOrganizationCode" value="xml:/Receipt/Shipment/@SellerOrganizationCode">
		</yfc:makeXMLKey>
	</yfc:makeXMLInput>
	<input type="hidden" value='<%=getParameter("receiptKeyForReceive")%>' name="receiveEntityKey"
	ReceiptOpenKey='<%=resolveValue("xml:/Receipt/@OpenReceiptFlag")%>'/>
    <td class="detaillabel" ><yfc:i18n>Receipt_#</yfc:i18n></td>
	<td class="protectedtext">	<a <%=getDetailHrefOptions("L06", getParameter("receiptKey"),"")%> >
    <yfc:getXMLValue binding="xml:/Receipt/@ReceiptNo"/></a>
	</td>
	<td class="detaillabel" ><yfc:i18n>Shipment_#</yfc:i18n></td>
    <td class="protectedtext">	<a <%=getDetailHrefOptions("L01", getParameter("shipmentKey"),"")%> >
	<yfc:getXMLValue binding="xml:/Receipt/Shipment/@ShipmentNo"/></a>
	</td>
    <% if (isVoid(resolveValue("xml:/Receipt/Shipment/@OrderNo"))) { %>
		<td></td>
		<td></td>
	<% } else { %>
        <td class="detaillabel" ><yfc:i18n>Order_#</yfc:i18n></td> 
        <td class="protectedtext"> 
            <%if(equals(resolveValue("xml:/Receipt/Shipment/@OrderAvailableOnSystem"),"Y")) { %>
                <a <%=getDetailHrefOptions("L05", getParameter("orderKey"),"")%>>
                <yfc:getXMLValue binding="xml:/Receipt/Shipment/@OrderNo"/></a>
            <% } else { %>
                <yfc:getXMLValue binding="xml:/Receipt/Shipment/@OrderNo"/>
            <% } %>
        </td>
    <% } %>
</tr>
<tr>
	<td class="detaillabel" ><yfc:i18n>Enterprise</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/Shipment/@EnterpriseCode"/></td>
	<td class="detaillabel" ><yfc:i18n>Buyer</yfc:i18n></td>
			<yfc:makeXMLInput name="OrganizationKey" >
				<yfc:makeXMLKey binding="xml:/Organization/@OrganizationKey" value="xml:/Receipt/Shipment/@BuyerOrganizationCode" />
			</yfc:makeXMLInput>
    <td class="protectedtext">
	<a <%=getDetailHrefOptions("L04",getParameter("OrganizationKey"),"")%> >
	<yfc:getXMLValue binding="xml:/Receipt/Shipment/@BuyerOrganizationCode"/>
	</a>
	</td>
	<td class="detaillabel" ><yfc:i18n>Seller</yfc:i18n></td>
    <yfc:makeXMLInput name="sellerOrganizationKey" >
		<yfc:makeXMLKey binding="xml:/Organization/@OrganizationKey" value="xml:/Receipt/Shipment/@SellerOrganizationCode" />
	</yfc:makeXMLInput>
    <td class="protectedtext">
	<a <%=getDetailHrefOptions("L04",getParameter("sellerOrganizationKey"),"")%> >
	<yfc:getXMLValue binding="xml:/Receipt/Shipment/@SellerOrganizationCode"/>
	</a>
	</td>
</tr>
<tr>
	<td class="detaillabel" ><yfc:i18n>Receipt_Start_Date</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/@ReceiptDate"/></td>
	<td class="detaillabel" ><yfc:i18n>Receiving_Node</yfc:i18n></td>
		<yfc:makeXMLInput name="ShipNodeKey" >
			<yfc:makeXMLKey binding="xml:/ShipNode/@ShipNode" value="xml:/Receipt/@ReceivingNode" />
		</yfc:makeXMLInput>
	<td class="protectedtext">
	<a <%=getDetailHrefOptions("L03",getParameter("ShipNodeKey"),"")%> >
	<yfc:getXMLValue binding="xml:/Receipt/@ReceivingNode"/>
	</a>
	</td>
<% if (equals("Y",getValue("ShipNode","xml:/ShipNodeList/ShipNode/@DcmIntegrationRealTime"))) { %>
	<td class="detaillabel" ><yfc:i18n>Receiving_Dock</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/@ReceivingDock"/></td>
<% } %>
</tr>
<tr>
	<td class="detaillabel" ><yfc:i18n>Receipt_Status</yfc:i18n></td>
    <td class="protectedtext"><a <%=getDetailHrefOptions("L02", getParameter("receiptKey"),"")%> >
	<yfc:getXMLValueI18NDB binding="xml:/Receipt/Status/@StatusName"/></a></td>
	<td class="detaillabel" ><yfc:i18n>Receipt_Open</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/@OpenReceiptFlag"/></td>
</tr>
<tr>
	<td class="detaillabel" ><yfc:i18n>No_Of_Pallets</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/@NumOfPallets"/></td>
	<td class="detaillabel" ><yfc:i18n>No_Of_Cartons</yfc:i18n></td>
    <td class="protectedtext"><yfc:getXMLValue binding="xml:/Receipt/@NumOfCartons"/></td>
</tr>
<yfc:callAPI apiID="AP1"/>	
</table>

<input type="hidden" name="xml:/Receipt/@ReceiptNo" value='<%=resolveValue("xml:/Receipt/@ReceiptNo")%>'/>
<input type="hidden" name="xml:/Receipt/@DocumentType" value='<%=resolveValue("xml:/Receipt/@DocumentType")%>'/>
<input type="hidden" name="xml:/Receipt/@ReceivingNode" value='<%=resolveValue("xml:/Receipt/@ReceivingNode")%>'/>
<input type="hidden" name="xml:/Receipt/@ReceiptHeaderKey" value='<%=resolveValue("xml:/Receipt/@ReceiptHeaderKey")%>'/>
<input name="xml:yfcSearchCriteria:/NodeInventory/@Mode" type="hidden" value="xml:/Receipt/@ReceiptNo"/>
<input name="inventoryKey" type="hidden" value='<%=getParameter("inventoryKey")%>'/>
<input name="receiptKey" type="hidden" value='<%=getParameter("receiptKey")%>'/>
<input name="closereceiptKey" type="hidden" value='<%=getParameter("closeReceiptKey")%>'/>
<input name="xml:yfcSearchCriteria:/LocationInventory/@ReceiptNo" type="hidden" value="xml:/Receipt/@ReceiptNo"/>
