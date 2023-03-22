package com.kh.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.MemberDao;

@RestController
@RequestMapping("/rest/member")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/memberId/{memberId}")
	public String findId(@PathVariable String memberId) {
		return memberDao.selectOne(memberId) == null ? "Y":"N";
	}
	
	@GetMapping("/memberNick/{memberNick}")
	public String findNickname(@PathVariable String memberNick) {
		return memberDao.selectByNickname(memberNick) == null ? "Y":"N";
	}
	
}
