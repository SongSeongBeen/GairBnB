package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.ShopService;
import com.javaex.vo.ItemVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/shop", method = { RequestMethod.GET, RequestMethod.POST })
public class ShopController {

	@Autowired
	ShopService shopService;
	
	//상품 리스트 폼
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String shopListForm(Model model) {
		System.out.println("[ShopController.shopListForm()]");
		
		List<ItemVo> itemList = shopService.getItemList();
		model.addAttribute("itemList", itemList);
		
		return "/shop/shopList";
	}
	//상품 카테고리 선택
	@ResponseBody
	@RequestMapping(value = "/categorylist", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ItemVo> getCategory(@RequestParam("category") String category) {
		System.out.println("[ShopController.shopListForm()]");
		System.out.println(category);
		
		if(("전체").equals(category)) {
			List<ItemVo> itemList = shopService.getItemList();
			return itemList;
		} else {
			List<ItemVo> itemList = shopService.getCategoryList(category);
			return itemList;
		}
	}
	
	//상품 상세 정보 폼
	@RequestMapping(value = "/info", method = { RequestMethod.GET, RequestMethod.POST })
	public String shopInfoForm(@RequestParam("itemNo") int itemNo,
							   Model model) {
		System.out.println("[ShopController.shopInfoForm()]");
		
		ItemVo itemVo = shopService.getItem(itemNo);
		model.addAttribute("itemVo", itemVo);
		
		return "/shop/shopInfo";
	}
	//장바구니 추가
	@ResponseBody
	@RequestMapping(value = "/cartinsert", method = { RequestMethod.GET, RequestMethod.POST })
	public int cartInsert(@ModelAttribute ItemVo itemVo) {
		System.out.println("[ShopController.cartinsert()]");
		
		int count = shopService.cartInsert(itemVo);
		
		return count;
	}
	
	//상품 결제 폼
	@RequestMapping(value = "/pay", method = { RequestMethod.GET, RequestMethod.POST })
	public String payForm(@RequestParam ("itemNo") int itemNo,
						  Model model) {
		System.out.println("[ShopController.payForm()]");
		
		ItemVo itemVo = shopService.getItem(itemNo);
		model.addAttribute("itemVo", itemVo);
		
		return "/shop/shopPay";
	}
	
	//상품 결제
	@RequestMapping(value = "/payment", method = { RequestMethod.GET, RequestMethod.POST })
	public String payment(@ModelAttribute ItemVo itemVo) {
		System.out.println("[ShopController.payment()]");
		
		shopService.payment(itemVo);
		
		return "redirect:/shop/myshoplist?usersNo="+itemVo.getUsersNo();
	}
	
	//쇼핑 내역
	@RequestMapping(value = "/myshoplist", method = { RequestMethod.GET, RequestMethod.POST })
	public String myShopList(@RequestParam("usersNo") int usersNo,
			                 Model model) {
		System.out.println("[ShopController.myshoplist()]");
		
		List<ItemVo> itemList = shopService.getHistoryList(usersNo);
		model.addAttribute("itemList", itemList);
		System.out.println(itemList);
		return "/shop/myShopList";
	}
	
	//쇼핑카트 내역
	@RequestMapping(value = "/myshopcart", method = { RequestMethod.GET, RequestMethod.POST })
	public String myShopCart(Model model) {
		System.out.println("[ShopController.myshopcart()]");
		
		return "/shop/myShopCart";
	}
	
	//판매자 - 상품 등록폼
	@RequestMapping(value = "/writeForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String writeForm() {
		System.out.println("[ShopController.writeForm()]");
		
		return "/shop/writeForm";
	}
	//판매자 - 상품 등록
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String write(@ModelAttribute ItemVo itemVo,
						@RequestParam("file") MultipartFile file,
						@RequestParam("file2") MultipartFile file2) {
		System.out.println("[ShopController.write()]");
		shopService.write(itemVo, file, file2);
		
		return "redirect:/shop/list";
	}
	//판매자 - 상품 수정폼
	@RequestMapping(value = "/modifyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyForm(@RequestParam("itemNo") int itemNo,
						     Model model) {
		System.out.println("[ShopController.modifyForm()]");
		
		ItemVo itemVo = shopService.getItem(itemNo);
		model.addAttribute("itemVo", itemVo);
		
		return "/shop/modifyForm";
	}
	//판매자 - 상품 수정
	@RequestMapping(value = "/modify", method = { RequestMethod.GET, RequestMethod.POST })
	public String modify(@ModelAttribute ItemVo itemVo,
						@RequestParam("file") MultipartFile file) {
		System.out.println("[ShopController.modify()]");
		
		//shopService.write(itemVo, file);
		
		return "redirect:/shop/list";
	}
	
	//판매자 - 상품관리
	@RequestMapping(value = "/admin", method = { RequestMethod.GET, RequestMethod.POST })
	public String shopAdmin(HttpSession session,
					        Model model) {
		System.out.println("[ShopController.shopAdmin()]");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		List<ItemVo> itemList = shopService.getAdminList(authUser.getUsersNo());
		
		model.addAttribute("itemList", itemList);
		
		return "/shop/shopAdmin";
	}
	
	//판매자 - 재고 수정
	@ResponseBody
	@RequestMapping(value = "/setea", method = { RequestMethod.GET, RequestMethod.POST })
	public int setea(@ModelAttribute ItemVo itemVo) {
		System.out.println("[ShopController.setEa()]");

		int count = shopService.setea(itemVo);
		
		return count;
	}
	
	//판매자 - 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public int delete(@RequestParam ("itemNo") int itemNo) {
		System.out.println("[ShopController.delete()]");

		int count = shopService.delete(itemNo);
		
		return count;
	}
}
