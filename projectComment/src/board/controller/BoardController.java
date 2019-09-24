package board.controller;

import java.awt.print.Pageable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.common.Pagination;
import board.common.Search;
import board.service.BoardService;
import board.vo.BoardVO;
import comment.service.CommentService;
import comment.vo.CommentVO;
import member.mapper.MemberMapper;
import member.vo.MemberVo;

@Controller
public class BoardController {
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CommentService commentService;

	@Autowired
	private BoardService boardService;
	
	@GetMapping("board/index")
	public String index(Model model) {
	    
	    return "/index.jsp";
	}

	@RequestMapping("board")
	public String board(Model model) {
	    
	    return "//WEB-INF/views/boardWrite.jsp";
	}
	
	//board/write
	@RequestMapping("board/write")
	public String write(BoardVO board, Model model,HttpSession session) {

		session.getAttribute("member");
		MemberVo member= (MemberVo) session.getAttribute("loginInfo");
		
		model.addAttribute("member", member);
		board.setReplyCount(0);
		BoardVO createboard = boardService.createBoard(board);
		model.addAttribute("board", createboard);
		return "/WEB-INF/views/boardResult.jsp";
	}
	
	
	
//	@RequestMapping("board/write")
//	public String write(BoardVO board, Model model ) {
//		board.setReplyCount(0);
//
//		BoardVO createboard = boardService.createBoard(board);
//		model.addAttribute("board", createboard);
//		return "/WEB-INF/views/boardResult.jsp";
//	}
	
//	@RequestMapping("board/viewOne")
//	public String boardViewOne(Model model , BoardVO board) throws Exception {
//		board.setReplyCount(0);
//		BoardVO boardOne = boardService.read(board.getBoardId());
//		model.addAttribute("board", boardOne);
//		return "/WEB-INF/views/boardResult.jsp";
//	}
	
	
	//board/viewOne
	@RequestMapping("board/viewOne")
	public String boardViewOne(Model model , BoardVO board,HttpSession session) throws Exception {
		session.getAttribute("loginInfo");
		MemberVo member= (MemberVo) session.getAttribute("loginInfo");
		System.out.println("viewOne");
		model.addAttribute("member", member);
		
		board.setReplyCount(0);
		BoardVO boardOne = boardService.selectOneBoard(board.getBoardId());
		model.addAttribute("board", boardOne);
		
		
		List<CommentVO> list = commentService.commentList(board.getBoardId());
		model.addAttribute("list", list);
		System.out.println("controller list"+list);
		return "/WEB-INF/views/boardResult.jsp";
	}
	
	
//	@RequestMapping("board/viewOne")
//	public String boardViewOne(Model model , @RequestParam("boardId")int boardId) throws Exception {
//		model.addAttribute("board", boardService.selectOneBoard(boardId));
//		return "/WEB-INF/views/boardResult.jsp";
//	}
	
	@RequestMapping("board/modify")
	public String boardEditPre(Model model, BoardVO board) {
		model.addAttribute("board", board);
		return "/WEB-INF/views/boardEdit.jsp";	
	}
	
	@RequestMapping("board/modifyUpload")
	public String boardEditor(Model model, BoardVO board) {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String updatedTime = date.format(time);
		board.setuDate(updatedTime);
		BoardVO updatedBoard = boardService.updateBoard(board);	
		System.out.println(board);
		return "forward:/board/viewOne";
	}
	

	@RequestMapping("board/delete")
	public String boardDeleter(Model model, BoardVO board) {
		System.out.println(board);
		boardService.deleteBoard(board);
		
		return "redirect:/board/list";
	}
	
	
//	 @RequestMapping("board/list")
//	    public String boardList(Model model) throws Exception{
//	        List<BoardVO> list = boardService.selectBoardList();
//	        model.addAttribute("list", list);        
//	        return "/WEB-INF/views/boardList.jsp";
//	    }
	 
	 
	 
	 
//	 	@RequestMapping("board/list")
//	    public String boardList(@ModelAttribute("boardVO") BoardVO boardVO,
//	            @RequestParam(defaultValue="1") int curPage,
//	            HttpServletRequest request,
//	            Model model) throws Exception{
//	 
//	        // ��ü����Ʈ ����
//	        int listCnt = boardService.selectBoardListCnt();
//	        Pagination pagination = new Pagination(listCnt, curPage);
//	        
//	        boardVO.setStartIndex(pagination.getStartIndex());
//	        boardVO.setCntPerPage(pagination.getPageSize());
//	        // ��ü����Ʈ ���
//	        List<BoardVO> list = boardService.selectBoardList();
//	                
//	        model.addAttribute("list", list);
//	        model.addAttribute("listCnt", listCnt);
//	   //     model.addAttribute("loginVO", loginVO);
//	        
//	        model.addAttribute("pagination", pagination);
//	        
//	        return "/WEB-INF/views/boardList.jsp";
//	    }
//	    
	
	 @RequestMapping("board/list")
	    public String getBoardList(Model model, @RequestParam(required=false, defaultValue="1")int page, @RequestParam(required=false, defaultValue="1") int range, @RequestParam(required=false,defaultValue="title") String searchType, @RequestParam(required=false)String keyword) throws Exception{
	     
		 Search search = new Search();
		 search.setSearchType(searchType);
		 search.setKeyword(keyword);
		 
		 //전체 게시글 개수
		 int listCnt = boardService.selectBoardListCnt(search);
		 search.pageInfo(page, range, listCnt);
		 model.addAttribute("pagination",search);
		 model.addAttribute("list", boardService.selectBoardList(search));
		 
	        
	        return "/WEB-INF/views/boardList.jsp";
	    }
	 
	 
}
