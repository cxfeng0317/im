package com.company.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.company.bean.Invitation;

/**
 * @author CJF
 * @category 帖子数据访问接口
 */
public interface InvitationDao {
	/**
	 * 查看全部帖子
	 * 
	 * @return
	 */
	public List<Invitation> find();

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Invitation> findByLimit(Map<String, Integer> map);

	/**
	 * 查询总帖子数
	 * 
	 * @return
	 */
	public int getCount();

	/**
	 * 通过id搜索帖子
	 * 
	 * @param id
	 * @return
	 */
	public Invitation findById(int id);

	/**
	 * 增加帖子
	 * 
	 * @param invitation
	 * @return
	 */
	public int insert(Invitation invitation);

	/**
	 * 删除多个帖子
	 * 
	 * @param ids
	 * @return
	 */
	public int delete(int[] ids);

	/**
	 * 跟新帖子
	 * 
	 * @param invitation
	 * @return
	 */
	public int update(Invitation invitation);
}
