package com.company.service;

import java.util.List;

import com.company.bean.Invitation;
import com.company.bean.PageBean;

/**
 * @author CJF
 * @category 帖子业务逻辑接口
 */
public interface InvitationService {
	public List<Invitation> find();

	public Invitation find(int id);

	public PageBean getpage(String currenpage);

	public boolean insert(Invitation invitation);

	public boolean delete(int[] ids);

	public boolean update(Invitation invitation);
}
