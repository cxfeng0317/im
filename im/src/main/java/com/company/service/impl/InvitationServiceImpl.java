package com.company.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.company.bean.Invitation;
import com.company.bean.PageBean;
import com.company.dao.InvitationDao;
import com.company.service.InvitationService;

/**
 * @author CJF
 * @category 帖子业务逻辑实现类
 */
@Service("invitationService")
public class InvitationServiceImpl implements InvitationService {
	@Autowired
	private InvitationDao invitationDao;
	
	@Autowired
	private PageBean<Invitation> pageBean;

	@Override
	public List<Invitation> find() {

		return invitationDao.find();
	}

	@Override
	public Invitation find(int id) {

		return invitationDao.findById(id);
	}

	@Override
	public boolean insert(Invitation invitation) {
		invitation.setCreatedate(new Date(System.currentTimeMillis()));
		return invitationDao.insert(invitation) > 0 ? true : false;
	}

	@Override
	public boolean delete(int[] ids) {
		return invitationDao.delete(ids) > 0 ? true : false;
	}

	@Override
	public boolean update(Invitation invitation) {
		return invitationDao.update(invitation) > 0 ? true : false;
	}

	@Override
	public PageBean getpage(String currenpage) {
		Integer currenPage = Integer.valueOf(currenpage);
		Integer currentpage = (currenPage - 1) * pageBean.getPageCount();
		Integer pagecount = pageBean.getPageCount();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pagecount", pagecount);
		map.put("currentpage", currentpage);
		List<Invitation> list = invitationDao.findByLimit(map);
		int count = invitationDao.getCount();
		pageBean.setPageData(list);
		pageBean.setTotalCount(count);
		pageBean.setTotalPage(count / pageBean.getPageCount() + 1);
		return pageBean;
	}

}
