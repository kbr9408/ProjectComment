package comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.BoardService;
import comment.service.CommentService;
import comment.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/delete")
	public String deleteComment(Model model, CommentVO comment) {
		model.addAttribute("comment", comment);
		commentService.deleteComment(comment);
		return "/WEB-INF/views/deleteCommentResult.jsp";
	}

	
	@RequestMapping("/create")
	public String createComment(Model model, CommentVO comment) {
		model.addAttribute("comment",comment);
		commentService.createComment(comment);
		System.out.println(comment+"controller");
		return"/WEB-INF/views/createCommentResult.jsp";
	}
	
	@RequestMapping("/list")
	public String commentList(Model model, CommentVO comment) throws Exception{
		List<CommentVO> clist = commentService.commentList(comment);
		model.addAttribute("clist",clist);
		System.out.println(clist);
		return "/WEB-INF/views/commentList.jsp";
	}
	@RequestMapping("/update")
	public String updateComment(Model model, CommentVO comment) {
		model.addAttribute("comment",comment);
		commentService.updateComment(comment);
		return "/WEB-INF/views/updateCommentResult.jsp";
	}
	
	@RequestMapping("/selectOne")
	public String selectOneComment(Model model, CommentVO comment) {
		model.addAttribute("selectOne", comment);
		commentService.selectOneComment(comment);
		return "/WEB-INF/views/updateCommentResult.jsp";
	}
}
