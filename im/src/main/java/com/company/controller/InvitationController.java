package com.company.controller;

import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.bean.Invitation;
import com.company.bean.PageBean;
import com.company.service.InvitationService;

/**
 * @author CJF
 * @category 帖子控制器
 */
@Controller
public class InvitationController {
	private Logger log = Logger.getLogger(InvitationController.class);
	@Autowired
	private InvitationService invitationService;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("list")
	public String list(Model model) {
		log.debug("list...........");
//		List<Invitation> list = invitationService.find();
//		model.addAttribute("list", list);
		return "list";
	}

	@RequestMapping("/getlist")
	public @ResponseBody PageBean getlist(String currenPage) {
		if (currenPage == null || "".equals(currenPage.trim())) {
			currenPage = "1";
		}
		PageBean<Invitation> pageBean = invitationService.getpage(currenPage);
		return pageBean;
	}

	@RequestMapping("/add")
	public String add() {
		return "add";
	}

	@RequestMapping("/addSave")
	public String addSave(Invitation invitation) {
		log.debug("invitation: " + invitation.getTitle());
		boolean flag = invitationService.insert(invitation);
		log.debug("flag: " + flag);
		return "redirect:list.action";
	}

	@RequestMapping("/update")
	public String update(int id, Model model) {
		log.debug("id: " + id);
		Invitation invitation = invitationService.find(id);
		model.addAttribute("invitation", invitation);
		log.debug("invitation: " + invitation.getTitle());
		return "update";
	}

	@RequestMapping("/updateSave")
	public String updateSave(Invitation invitation) {
		log.debug("invitation: " + invitation.getTitle());
		boolean flag = invitationService.update(invitation);
		log.debug("flag: " + flag);
		return "redirect:list.action";
	}

	@RequestMapping("/delete")
	public String delete(int[] ids) {
		log.debug("ids: " + Arrays.toString(ids));
		boolean flag = invitationService.delete(ids);
		log.debug("flag: " + flag);
		return "redirect:list.action";
	}

}
