           <%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>供应商资料</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>

		<table>
			<tr>
				<td style="text-align: right">
					<form action="purchase/supplierinfo/supplierinfo_search"
						method="post">
						供应商名称：
						<input type="text" name="supplierinfo.supcname"  />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input class="frm_btn" type="button"
							onclick="openWin('<%=basePath%>purchase/supplierinfo/supplierinfo_addInput','editSamidentified',900,800,'1');return false"
							value="添加" />
					</form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					供应商资料
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					供方名称
				</th>
				<th>
					地址
				</th>
				<th>
					联系电话
				</th>
				<th>
					备注
				</th>
				<th>
					审核状态
				</th>
				<th>
					编辑
				</th>
				<th>
					删除
				</th>



			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->

			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="supplierinfo">
					<tr>
						<td>
							<div align="center">
								<a
									href="purchase/supplierinfo/supplierinfo_show?supplierinfoId=${supplierinfo.id}">
									${supplierinfo.supcname}</a>
							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.address}
							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.phone}

							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.notes}
							</div>
						</td>
						<c:if test="${empty supplierinfo.checkper.empId}">
							<td class="examine">
								<input name="status" type="hidden" value="${status[vs.index] }" />
								<a href="#"
									onclick="openWin('<%=basePath%>purchase/supplierinfo/supplierinfo_examine?supplierinfoId=${supplierinfo.id}','examineSamidentified',900,800,'1');return false">
									<span>审核</span> </a>
							</td>
						</c:if>
						<c:if test="${!empty supplierinfo.checkper.empId}">
							<td class="examine">
							<input name="status" type="hidden" value="${10}" />
								<a href="#"><span>已审核</span></a>
							</td>
						</c:if>
						<c:if test="${empty supplierinfo.checkper.empId}">
							<td align="center">
								<a href="#"
									onclick="openWin('<%=basePath%>purchase/supplierinfo/supplierinfo_editInput?supplierinfoId=${supplierinfo.id}','editSamidentified',900,800,'1');return false">
									<img src="images/edit.gif" width="15" height="16" border="0">
								</a>
							</td>
						</c:if>
						<c:if test="${!empty supplierinfo.checkper.empId}">
							<td>

							</td>
						</c:if>
						<td align="center">
							<div align="center">
								<a href="#"
									onclick="del('<%=basePath%>purchase/supplierinfo/supplierinfo_del?supplierinfoId=${supplierinfo.id}');return false">
									<img src="images/del.gif" width="15" height="16" border="0">
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover="
	this.bgColor = '#DEE7FF'"
						;
onmouseout="this.bgColor = '#EFF3F7'";>

						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
		</table>

		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="supplierinfo.supcname" />
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }">尾页</a>
						</pg:last>
					</pg:pager>
					&nbsp;&nbsp;
				</th>
				<!-- 更改pagesize 开始-->
				<th align=left valign="middle" noWrap width="10%">
					<div style="height: 28px; overflow: hidden; valign: middle">
						<form
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

							<input type="hidden" name="supplierinfo.supcname"
								value="${supplierinfo.supcname }" />
							<select name="pagesize" onchange="this.form.submit()"
								style="height: 16px; overflow: hidden; valign: middle">
								<c:forEach begin="1" end="50" step="3" var="i">
									<option value="${i}"
										<c:if test="${pagesize eq i }">selected</c:if>>
										${i}
									</option>
								</c:forEach>
							</select>
							行/页

						</form>
					</div>

				</th>
			</tr>
		</table>
	
	</body>
</html>
