package comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.BoardService;
import comment.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/delete")
	public String deleteComment(Model model, CommentVO comment) {
		model.addAttribute("comment", comment);
		boardService.deleteComment(comment);
		return "/WEB-INF/views/deleteCommentResult.jsp";
	}

	
	@RequestMapping("/create")
	public String createComment(Model model, CommentVO comment) {
		model.addAttribute("comment",comment);
		boardService.createComment(comment);
		System.out.println(comment+"controller");
		return"/WEB-INF/views/createCommentResult.jsp";
	}
	
	@RequestMapping("/list")
	public String commentList(Model model, CommentVO comment) throws Exception{
		List<CommentVO> clist = boardService.commentList(comment);
		model.addAttribute("clist",clist);
		System.out.println(clist);
		return "/WEB-INF/views/commentList.jsp";
	}
	@RequestMapping("/update")
	public String updateComment(Model model, CommentVO comment) {
		model.addAttribute("comment",comment);
		boardService.updateComment(comment);
		return "/WEB-INF/views/updateCommentResult.jsp";
	}
	
	@RequestMapping("/selectOne")
	public String selectOneComment(Model model, CommentVO comment) {
		model.addAttribute("selectOne", comment);
		boardService.selectOneComment(comment);
		return "/WEB-INF/views/updateCommentResult.jsp";
	}
}