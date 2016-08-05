package org.single.controller;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.single.domain.BoardVO;
import org.single.domain.PageMaker;
import org.single.domain.SearchCriteria;
import org.single.domain.UserVO;
import org.single.service.BoardService;
import org.single.util.GmailVerify;
import org.single.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class SearchBoardController {
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
//		model.addAttribute("list", boardService.listCriteria(cri));
		model.addAttribute("list", boardService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
//		pageMaker.setTotalCount(boardService.listCountCriteria(cri));
		pageMaker.setTotalCount(boardService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") Integer bno, @ModelAttribute("cri") SearchCriteria cri, Model  model) 
																									throws Exception{
		model.addAttribute(boardService.read(bno));
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") Integer bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		boardService.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET (Integer bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(boardService.read(bno));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO boardVO, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info(cri.toString());
		boardService.modify(boardVO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		System.out.println(cri.toString());
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get ...........");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String 	registPOST(BoardVO boardVO, RedirectAttributes rttr) throws Exception{
		logger.info("regist post................");
		logger.info(boardVO.toString());
		String[] files = boardVO.getFiles();
		
		boardService.regist(boardVO);
		
		rttr.addAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno")Integer bno) throws Exception{
		return boardService.getAttach(bno);
	}
	
	//회원가입
	@CrossOrigin(origins="*", maxAge = 3600)
	@ResponseBody
	@RequestMapping(value = "createaccount", method=RequestMethod.POST)
	public void createaccount(UserVO userVO) throws Exception{
		System.out.println("vo: " + userVO.toString());
		GmailVerify gmail = new GmailVerify();
		UUID uuid = UUID.randomUUID();
		String uid = uuid.toString().substring(0, 6);
		gmail.sendMail(userVO.getEmail(), uid);
		userVO.setUuid(uid);
		boardService.account(userVO);
	}
	
	// 이메일 인증 확인, 로그인
	@CrossOrigin(origins = "*", maxAge = 3600)		// 동일출처정책  허용
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public UserVO login(UserVO userVO) throws Exception {
		UserVO vo = boardService.login(userVO);
		System.out.println("login : " + userVO.toString());
		return vo;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)		// 동일출처정책  허용
	@ResponseBody
	@RequestMapping(value="changeChk", method=RequestMethod.POST)
	public String changeChk(UserVO userVO) throws Exception {
		System.out.println(userVO.toString());
		String result = boardService.changeChk(userVO);
		return result;
	}

	@CrossOrigin(origins = "*", maxAge = 3600)		// 동일출처정책  허용
	@ResponseBody
	@RequestMapping(value="loginAjax", method=RequestMethod.POST)
	public UserVO loginAjax(UserVO userVO) throws Exception {
		UserVO result = boardService.loginAjax(userVO);
		System.out.println("result Mypage : " + userVO.toString());
		return result;
	}
	
	@CrossOrigin(origins="*")
	@ResponseBody
	@RequestMapping(value ="updateAjax", method = RequestMethod.POST)
	public void updateAjax(UserVO userVO)throws Exception{
		boardService.updateAjax(userVO);
	}
}
