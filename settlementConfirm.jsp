<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./css/yellow.css">
		<title>決済確認画面</title>
	</head>
	<body>

		<jsp:include page="header.jsp" />

		<h1 class="pageTitle">決済確認画面</h1>

		<s:if test="!#session.destinationInfoDtoList.isEmpty()">

			<div class="infoMsgBox">
				宛先情報を選択してください。
			</div>
			<s:form id="form" action="SettlementCompleteAction" >
				<table class="inputTable-mini verticalTable">
					<thead>
						<tr>
							<th><s:label value="#"/></th>
							<th><s:label value="姓"/></th>
							<th><s:label value="名"/></th>
							<th><s:label value="ふりがな"/></th>
							<th><s:label value="住所"/></th>
							<th><s:label value="電話番号"/></th>
							<th><s:label value="メールアドレス"/></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#session.destinationInfoDtoList" status="st">
							<tr>
								<td>
									<s:if test="#st.index == 0">
										<input type="radio" name="id" checked="checked" value="<s:property value='id'/>"/>
									</s:if>
									<s:else>
										<input type="radio" name="id" value="<s:property value='id'/>"/>
									</s:else>
								</td>
								<td>
									<s:property value="familyName"/><br>
								</td>
								<td>
									<s:property value="firstName"/><br>
								</td>
								<td>
									<s:property value="familyNameKana" /><s:property value="firstNameKana" /><br>
								</td>
								<td>
									<s:property value="userAddress" />
								</td>
								<td>
									<s:property value="tellNumber"/>
								</td>
								<td>
									<s:property value="email"/>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

				<div class="button_box">
					<s:submit value="決済" class="button"/>
				</div>

			</s:form>
		</s:if>
		<s:else>
			<div class="notFoundMsgBox">
				宛先情報がありません。
			</div>
		</s:else>

		<div class="button_box">
			<s:form action="CreateDestinationAction">
				<s:submit value="新規宛先登録" class="button"/>
			</s:form>
		</div>

	</body>
</html>
