<%/*******************************************************************************
Licensed Materials - Property of IBM
IBM Sterling Selling And Fulfillment Suite
(C) Copyright IBM Corp. 2005, 2013 All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 ********************************************************************************/%>
<%@include file="/yfsjspcommon/yfsutil.jspf"%>
<%@include file="/console/jsp/currencyutils.jspf"%>
<%@include file="/console/jsp/modificationutils.jspf"%>
<%@ page import="com.yantra.yfs.ui.backend.*"%>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/modificationreason.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/console/scripts/om.js"></script>
	
	<table  editable="false" width="100%" class="table" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<td class="checkboxheader" sortable="no">
						<input type="checkbox"     onclick='doCheckAll(this)'   ></input>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Order_#</yfc:i18n>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Line_#</yfc:i18n>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Status</yfc:i18n>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Enterprise</yfc:i18n>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Order_Date</yfc:i18n>
				</td>
				<td class="tablecolumnheader" sortable="yes">
					<yfc:i18n>Total_Amount</yfc:i18n>
				</td>
			</tr>
		</thead>
		<tbody>

			<yfc:loopXML binding="xml:/OrderLineList/@OrderLine" id="OrderLine">
				<tr>
					<td class="checkboxcolumn">
							<yfc:makeXMLInput  name="orderLineKey"  >
								<yfc:makeXMLKey binding="xml:/OrderLineDetail/@OrderLineKey"   value="xml:/OrderLine/@OrderLineKey"/>
								<yfc:makeXMLKey binding="xml:/OrderLineDetail/@OrderHeaderKey" value="xml:/OrderLine/@OrderHeaderKey" />
							</yfc:makeXMLInput>
							<input type="checkbox" <%=getCheckBoxOptions("EntityKey","false",getParameter("orderLineKey"))%>      ></input>
							<input type="hidden" name='OrderLineKey_<%=OrderLineCounter%>' value='<%=resolveValue("xml:/OrderLine/@OrderLineKey")%>'  />
							<input type="hidden" name='OrderHeaderKey_<%=OrderLineCounter%>' value='<%=resolveValue("xml:/OrderLine/@OrderHeaderKey")%>'  />
					</td>
					<td class="tablecolumn">
							<yfc:getXMLValue  binding="xml:/OrderLine/Order/@OrderNo" />
					</td>
					<td class="tablecolumn">
							<a   href="javascript:showDetailFor('<%=getParameter("orderLineKey")%>')"   >
								<yfc:getXMLValue  binding="xml:/OrderLine/@PrimeLineNo" />
							</a>
					</td>
					<td class="tablecolumn">
							<% if (isVoid(getValue("OrderLine", "xml:/OrderLine/@Status"))) {%>
								<yfc:i18n>Draft</yfc:i18n>
							<% } else {%>
								<%=displayOrderStatus(getValue("OrderLine","xml:/OrderLine/@MultipleStatusesExist"),getValue("OrderLine","xml:/OrderLine/@MaxLineStatusDesc"),true)%>
							<% } %>
							<% if (equals("Y", getValue("OrderLine", "xml:/OrderLine/@HoldFlag"))) {%>
								<img class="icon"  onmouseover="this.style.cursor='default'"  <%=getImageOptions(YFSUIBackendConsts.HELD_ORDER, "This_order_is_held")%>/>
							<% } %>
                            <% if (equals("Y", getValue("OrderLine", "xml:/OrderLine/@isHistory"))){ %>
                                <img class="icon" onmouseover="this.style.cursor='default'" <%=getImageOptions(YFSUIBackendConsts.HISTORY_ORDER, "This_is_an_archived_order")%>/>
                            <% } %>
					</td>
					<td class="tablecolumn">
							<yfc:getXMLValue  binding="xml:/OrderLine/Order/@EnterpriseCode" />
					</td>
					<td class="tablecolumn">
							<yfc:getXMLValue  binding="xml:/OrderLine/Order/@OrderDate" />
					</td>
					<td class="tablecolumn">
							<%=displayAmount(getValue("OrderLine","xml:/OrderLine/LinePriceInfo/@LineTotal"),(YFCElement) request.getAttribute("CurrencyList"),getValue("OrderLine","xml:/OrderLine/LinePriceInfo/@LineTotal")) %>
					</td>
				</tr>
			</yfc:loopXML>
		</tbody>
	</table>
