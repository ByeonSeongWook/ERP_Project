package com.erp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.service.AccService;
import com.erp.service.MyPageService;
import com.erp.service.ProductService;
import com.erp.service.SupplierService;
import com.erp.vo.Accounting;
import com.erp.vo.Product;
import com.erp.vo.Supplier;
import com.erp.vo.Users;

// user (유저 컨트롤러)	
@Controller
@RequestMapping(value = "/user/*")
public class UsersController {
	
	@Inject
	ProductService pro_service;
	
	@Inject
	SupplierService supp_service;
	
	@Inject
	AccService acc_service;
	
	@Inject
	MyPageService mp_service;
	
	// userMain(유저 메인)	
	@RequestMapping(value ="/userMain", method = RequestMethod.GET)
	public String main(Model model, HttpSession session, RedirectAttributes ra) {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
			model.addAttribute("users", user);
			return "user/userMain";
		}
	}

	// --- myPage
	// myPage 들어 가기전에 비밀번호 확인
	@RequestMapping(value="/pw_check", method = RequestMethod.GET)
	public String pw_check(HttpSession session, RedirectAttributes ra) throws Exception {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		else {
			return "user/pw_check";
		}
	
	}
	
	
	// 패스워드 체크
	@RequestMapping(value="/pw_check_action", method = RequestMethod.POST)
	public String pw_check_action(HttpSession session, Users users, RedirectAttributes ra) throws Exception {
		
		Users user = (Users) session.getAttribute("users");
		String user_num = user.getUser_num();
		
			// 세션 넣어두고
			session.setAttribute("pw_check", user_num);
		
			users.setUser_num(user_num);
			
			if(mp_service.pw_check(users) != null) {
				ra.addFlashAttribute("msg", "인증에 성공했습니다!");
				mp_service.pw_check(users);
				return "redirect:/user/myPage";
			}
			
			else {
				ra.addFlashAttribute("msg", "인증에 실패했습니다! 다시 입력해주세요!");
				return "redirect:/user/pw_check";
			}
	}
	
	
	// my_page(마이페이지)
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session, RedirectAttributes ra) throws Exception {
		
		if(session.getAttribute("pw_check") != null) {
			Users user = (Users) session.getAttribute("users");
			String user_num 	= user.getUser_num();
			String dept_num	= user.getDept_num();
			
			// 관리자 계정이 아니면 접근 
			if(!user.getUser_num().equals("admin")) {
				mp_service.getUserInfo(user_num);
				String dept_name = mp_service.getDeptName(dept_num);
				
				model.addAttribute("user", user);
				model.addAttribute("dept_name", dept_name);
			
				return "user/myPage";
				}
			else {
				ra.addFlashAttribute("msg", "잘못된 접근입니다! 관리자 계정은 접근할 수 없습니다!");
				return "redirect:/user/userMain";
			}
		}
		else {
			ra.addFlashAttribute("msg", "잘못된 접근입니다! 비밀번호 인증 먼저 해주세요!");
			return "redirect:/user/pw_check";
		}
	}
	
	// 마이페이지에서 개인정보 업데이트
	@RequestMapping(value="/update_userInfo", method = RequestMethod.POST)
	public String update_userInfo(Users users, HttpSession session, RedirectAttributes ra) throws Exception {
		
		mp_service.update_userInfo(users);
		ra.addFlashAttribute("msg", "개인 정보 변경이 완료 되었습니다! 다시 로그인 해주세요!");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	// --- product
	// product(제품관리)
	@RequestMapping(value="/product", method = RequestMethod.GET) 
	public String product(Model model, HttpSession session, RedirectAttributes ra) throws Exception{
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
			List<Product> product_List = pro_service.getProductList();
			model.addAttribute("product_List",product_List);
			
			return "user/product";
		}
	}
	
	// 제품 이름을 받아와 검색
	@RequestMapping(value="/searchProduct", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> searchProduct(String pro_name) throws Exception{
		
		List<Product> pro_list = pro_service.searchProduct(pro_name);
		
		return pro_list;
	}
	
	// 제품 등록
	@RequestMapping(value="/addProductAction", method = RequestMethod.POST)
	@ResponseBody
	public List <Product> addProductAction(Product product) throws Exception{
		
		pro_service.addProductAction(product);
		
		return pro_service.getProductList();
	}
	
	
	// --- clients
	// clients(고객관리)
	@RequestMapping(value ="/clients", method = RequestMethod.GET)
	public String clients(Model model, HttpSession session, RedirectAttributes ra) {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
			return "user/clients";
		}
	}
	
	// --- orders
	// orders(발주관리)
	@RequestMapping(value ="/orders", method = RequestMethod.GET)
	public String orders(Model model, HttpSession session, RedirectAttributes ra) {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
			return "user/orders";
		}
	}
	
	// --- salesList
	// salesList(영업관리)
	@RequestMapping(value ="/salesList", method = RequestMethod.GET)
	public String salesList(Model model, HttpSession session, RedirectAttributes ra) {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
			return "user/salesList";
		}
	}
	
	// --- supplier
	// supplier (공급처)	
	@RequestMapping(value ="/supplier", method = RequestMethod.GET)
	public String supplier(Model model, HttpSession session, Users users, RedirectAttributes ra) throws Exception {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user != null) {
			List<Supplier> supp_list = supp_service.getSupplierList();
			supp_service.getAuth(user.getDept_num());

			// 접근 권한 관리
			if(supp_service.getAuth(user.getDept_num()).getAuth_supplier() == 0) {
				ra.addFlashAttribute("msg", "접근 권한이 없습니다! 관리자에게 문의 하세요!");
				return "redirect:/user/userMain";
			}
			
			model.addAttribute("supp_list", supp_list);
			model.addAttribute("users", user);
			model.addAttribute("dept_auth", supp_service.getAuth(user.getDept_num()));

			return "user/supplier";
		}
		else {
			ra.addFlashAttribute("msg", "로그인이 필요합니다!");
			return "redirect:/";
		}
		
	}
	
	// 공급처 검색
	@RequestMapping(value = "/searchSupplier", method = RequestMethod.POST)
	@ResponseBody
	public List<Supplier> searchSupplier(String supp_name) throws Exception {
		
		List<Supplier> supp_list = supp_service.searchSupplier(supp_name);
		
		return supp_list;
	}
	
	
	// 공급처 등록
	@RequestMapping(value = "/addSupplierAction", method = RequestMethod.POST)
	@ResponseBody
	public List<Supplier> addSupplierAction(Supplier supplier) throws Exception {
		
		supp_service.addSupplierAction(supplier);
		
		List<Supplier> supp_list = supp_service.getSupplierList();
		
		return supp_list;
	}
	
	// 공급처 ID 기준으로 리스트 삭제
	@RequestMapping(value="/deleteSupplier", method = RequestMethod.POST)
	@ResponseBody
	public List<Supplier> deleteSupplier(@RequestParam(value="supp_id[]") List<String> supp_id) throws Exception {
		
		supp_service.deleteSupplier(supp_id);
		
		List<Supplier> supp_list = supp_service.getSupplierList();
		
		return supp_list;
	}

	
	// 공급처 수정을 위해 데이터 받아오기(supp_id 기준)	
	@RequestMapping(value="/getSearchSupplier", method = RequestMethod.POST)
	@ResponseBody
	public Supplier getSearchSupplier(String supp_id) throws Exception {
		
		return supp_service.getSearchSupplier(supp_id);
	}
	
	
	// 공급처 수정 	
	@RequestMapping(value="/updateSupplier", method = RequestMethod.POST)
	@ResponseBody
	public List<Supplier> updateSupplier(Supplier supplier) throws Exception {
		
		supp_service.updateSupplier(supplier);
		
		List<Supplier> supp_list = supp_service.getSupplierList();
	
		return supp_list;
	}
	
	// --- accounting
	// accounting (회계)	
	@RequestMapping(value ="/accounting", method = RequestMethod.GET)
	public String accounting(Model model, HttpSession session, RedirectAttributes ra) throws Exception {
		
		Users user = (Users) session.getAttribute("users");
		
		if(user == null) {
			ra.addFlashAttribute("msg", "로그인 먼저 해주세요!");
			return "redirect:/";
		}
		
		else {
		
			List<Accounting> acc_list = acc_service.getAccList();
			model.addAttribute("acc_list", acc_list);
			model.addAttribute("users", user);
			model.addAttribute("dept_auth", supp_service.getAuth(user.getDept_num()));
			
			return "user/accounting";
		}
	}
	
	// 회계 데이터 등록	
	@RequestMapping(value ="/addAccAction", method = RequestMethod.POST)
	@ResponseBody
	public List<Accounting> addAccAction(Accounting accounting, HttpSession session, Model model) throws Exception {
		
		Users user = (Users) session.getAttribute("users");
		
		accounting.setAcc_writer(user.getUser_name());
		
		acc_service.addAccAction(accounting);
		
		return acc_service.getAccList();
	}
	
	// 검색(회계단위)
	@RequestMapping(value="/searchAccPayMent", method  = RequestMethod.POST)
	@ResponseBody
	public List<Accounting> searchAccPayMent(String acc_payment) throws Exception {
		
		return acc_service.searchAccPayMent(acc_payment);
	}
	
	// 검색(작성자)
	@RequestMapping(value="/searchAccWriter", method  = RequestMethod.POST)
	@ResponseBody
	public List<Accounting> searchAccWriter(String acc_writer) throws Exception {

		return acc_service.searchAccWriter(acc_writer);
	}
	
	// 검색(작성일)
	@RequestMapping(value="/searchAccDate", method  = RequestMethod.POST)
	@ResponseBody
	public List<Accounting> searchAccDate(String acc_occdate) throws Exception {
		
		return acc_service.searchAccDate(acc_occdate);
	}
	
}
