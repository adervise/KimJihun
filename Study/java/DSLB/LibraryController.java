package mylibrary.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mylibrary.model.BuyInfoDAO;
import mylibrary.model.BuyInfoDTO;
import mylibrary.model.MyfolderDAO;
import mylibrary.model.MyfolderDTO;
import mylibrary.model.Myfolder_buy_mappingDAO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LibraryController {
	
	private BuyInfoDAO buydao;
	public void setbuydao(BuyInfoDAO buydao){
		this.buydao = buydao;
	}
	
	private MyfolderDAO myfddao;
	public void setmyfddao(MyfolderDAO myfddao){
		this.myfddao = myfddao;
	}
	
	private Myfolder_buy_mappingDAO mpdao;
	public void setmp(Myfolder_buy_mappingDAO mpdao){
		this.mpdao = mpdao;
	}
	
	//My library
	@RequestMapping("mylibrary.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		ModelAndView view = new ModelAndView();
		BuyInfoDTO buydto = new BuyInfoDTO();
		
		int member_index = (int)session.getAttribute("member_index");
		//리스트 보기
		List<BuyInfoDTO> listview = buydao.getListView(member_index);
		System.out.println("member_index = "+ member_index);
		
		//폴더 보기
		MyfolderDTO myfddto = new MyfolderDTO();
		
	//	List<MyfolderDTO> myfolderlist = myfddao.getMyfolderList(member_index);
		
	//	view.addObject("myfolderlist",myfolderlist);
		///////////////////////////////////////////////////
		
		view.addObject("listview", listview);
		view.setViewName("library.tiles");
		return view;
	}
/*	//폴더 보기
	@RequestMapping("myfolderList.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView view = new ModelAndView();
		MyfolderDTO myfddto = new MyfolderDTO();
		
		List<MyfolderDTO> myfolderlist = myfddao.getMyfolderList(myfddto);
		
		view.addObject("myfolderlist",myfolderlist);
		return view;
	}
 	*/
	//폴더 추가
	@RequestMapping(value ="myfolderInsert.do")
	public String myfdInsert(HttpServletRequest request, HttpServletResponse response , HttpSession session) throws Exception
	{
		MyfolderDTO myfddto = new MyfolderDTO();
		
		int member_index =(int) session.getAttribute("member_index");
		String folder_name = request.getParameter("folder_name");

		System.out.println("myfolderInsert Start=" +member_index );
		
		myfddto.setFolder_name(folder_name);
		myfddto.setMember_index(member_index);
	
		myfddao.insertMyfolder(myfddto);
		
		return "redirect:/mylibrary.do";
		
		
	}
	//구매
	@RequestMapping(value ="buyContent.do")
	public String buyContent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		
		BuyInfoDTO buydto = new BuyInfoDTO();
		System.out.println("buyContent.do Start");
	//	String scontent_index =  request.getParameter("content_index");
	//	int content_index = Integer.parseInt(scontent_index);
		int member_index =(int) session.getAttribute("member_index");
		String sbuy_price =  request.getParameter("content_price");
		int buy_price = Integer.parseInt(sbuy_price);
		String scontent_file_path = "test.jsp";
		String content_file_path = scontent_file_path.substring(scontent_file_path.lastIndexOf(".")+1);
		System.out.println(content_file_path);
		buydto.setBuy_price(buy_price);
		buydto.setMember_index(member_index);
		buydao.buyContent(buydto);
		
		int byindex = buydto.getBuy_index();
		System.out.println("byindex = " + byindex);
			
		return "redirect:/main.do";
	}
	
	
}
