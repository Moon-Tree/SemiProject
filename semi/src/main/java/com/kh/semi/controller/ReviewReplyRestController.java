package com.kh.semi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.ReviewDao;
import com.kh.semi.dao.ReviewReplyDao;
import com.kh.semi.dto.ReviewReplyDto;

@RestController
@RequestMapping("/rest/review/reply")
public class ReviewReplyRestController {

		@Autowired
		private ReviewReplyDao reviewReplyDao;
		
		@Autowired
		private ReviewDao reviewDao;
		
		//댓글 조회
		@GetMapping("/{reviewReplyOrigin}")
		public List<ReviewReplyDto> list (@PathVariable int reviewReplyOrigin) {
			return reviewReplyDao.selectList(reviewReplyOrigin);
		}
		
		//댓글 등록
		@PostMapping("/")
		public void write(HttpSession session, @ModelAttribute ReviewReplyDto reviewReplyDto) {
			//작성자 설정
			String memberId = (String)session.getAttribute("memberId");
			reviewReplyDto.setReviewReplyWriter(memberId);
			
			//등록
			reviewReplyDao.insert(reviewReplyDto);
			
			//댓글 개수 갱신
			reviewDao.updateReplycount(reviewReplyDto.getReviewReplyOrigin());
			
		}
		
		//댓글 삭제
		@DeleteMapping("/{reviewReplyNo}")
		public void delete(@PathVariable int reviewReplyNo) {
			ReviewReplyDto reviewReplyDto = reviewReplyDao.selectOne(reviewReplyNo);
			
			//삭제
			reviewReplyDao.delete(reviewReplyNo);
			
			//댓글 개수 갱신
			reviewDao.updateReplycount(reviewReplyDto.getReviewReplyOrigin());
			
		}
		
		//일부 수정
		@PatchMapping("/")
		public void edit(@ModelAttribute ReviewReplyDto reviewReplyDto) {
			reviewReplyDao.update(reviewReplyDto);
		}
}
