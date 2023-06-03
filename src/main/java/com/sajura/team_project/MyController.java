package com.sajura.team_project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	@GetMapping("/")
	public String root() {
		return "main";
	}

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/admin/main")
	public String admin_main() {
		return "main";
	}
	@GetMapping("/board/main")
	public String board_main() {
		return "main";
	}
	@GetMapping("/cart/main")
	public String cart_main() {
		return "main";
	}
	@GetMapping("/payment/main")
	public String payment_main() {
		return "main";
	}
	@GetMapping("/product/main")
	public String product_main() {
		return "main";
	}
	@GetMapping("/review/main")
	public String review_main() {
		return "main";
	}
	@GetMapping("/user/main")
	public String user_main() {
		return "main";
	}

	@GetMapping("/board/QnAMain")
	public void Qna() {

	}
	@GetMapping("/user/user_Regassent")
	public  void user_Regassent() {

	}
	@GetMapping("/user/user_RegForm")
	public void user_RegForm() {

	}

	@GetMapping("/user/user_login")
	public void user_login() {

	}

	@GetMapping("/user/user_searchid")
	public void user_searchid() {

	}

	@GetMapping("/user/user_searchPw")
	public void user_searchPw() {

	}

	@GetMapping("/user/user_MyPage")
	public void user_MyPage() {

	}

	@GetMapping("/boardUpdate")
	public void boardUpdate() {

	}

	@GetMapping("/board/boardForm")
	public void boardForm() {
	}

	@GetMapping("/board/boardlist")
	public void boardlist() {
	}

	@GetMapping("/board/detailboard")
	public void detailboard() {

	}

	@GetMapping("/board/boardUpdateForm")
	public void boardUpdateForm() {

	}

	@GetMapping("/payment/success")
	public void success() {

	}

	@GetMapping("/payment/payment_list")
	public void payment_list() {

	}

	@GetMapping("/payment/fail")
	public void fail() {

	}

	@GetMapping("/admin/admin")
	public void admin() {

	}
	@GetMapping("/cart")
	public void cart() {

	}


	@GetMapping("/product/productRegForm")
	public void productRegForm() {

	}

	@GetMapping("/admin/admin_login")
	public void login() {

	}

	@GetMapping("/admin/admin_Mypage")
	public void mypage() {

	}

	@GetMapping("/review/review.do")
	public String review_insert() {
		return "/review/review_insert";
	}
}