package com.internousdev.yellow.action;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yellow.dao.DestinationInfoDAO;
import com.internousdev.yellow.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementConfirmAction extends ActionSupport implements SessionAware
{
	//	Session
	private Map<String,Object>session;

	public String execute()
	{
		//	商品カテゴリがないならセッションタイムアウト
		if(!session.containsKey("mCategoryDtoList"))
		{
			return "sessionTimeOut";
		}

		//	ログインしているならば、宛先情報を取得
		if(session.containsKey("loginId"))
		{
			DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
			List<DestinationInfoDTO> destinationInfoDtoList = destinationInfoDAO.getDestinationInfo(String.valueOf(session.get("loginId")));
			if(destinationInfoDtoList.isEmpty())
			{
				destinationInfoDtoList = null;
			}

			session.put("destinationInfoDtoList", destinationInfoDtoList);
		}

		return session.containsKey("loginId") ? SUCCESS : ERROR;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
