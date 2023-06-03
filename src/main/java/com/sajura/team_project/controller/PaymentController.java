package com.sajura.team_project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sajura.team_project.controller.dto.CartDTO;
import com.sajura.team_project.service.CartService;
import com.sajura.team_project.service.PaymentService;
import com.sajura.team_project.vo.PaymentVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	PaymentService service;
	
	@Autowired
	CartService cartservice;

		
	@GetMapping("/cart")
	public String cart(@RequestParam("cart_nos") int[] cart_nos ,@RequestParam("names") String[] names, @RequestParam("prices") int[] prices, @RequestParam("quantitys") int[] quantitys, Model model) {
		int totalprice=0;
		for(int i = 0; i < names.length; i++) {		
			totalprice += prices[i] * quantitys[i];	
		}
		model.addAttribute("cart_no", cart_nos);
		model.addAttribute("names",names);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("quantitys", quantitys);
		model.addAttribute("prices", prices);
		return "/payment/payment";
	}
	
	
	@GetMapping("/payment_success")
	public String payment_success(@RequestParam("user_id") String user_id,@RequestParam("names") String[] names,@RequestParam("quantitys") int[] quantitys,@RequestParam("prices") int[] prices,@RequestParam("cart_nos") int[] cart_nos) {
		ArrayList<PaymentVO> list = new ArrayList<>();
		
		for(int i = 0; i < names.length ; i++) {
			PaymentVO payment = new PaymentVO();
			payment.setPayment_name(names[i].toString());
			payment.setPayment_price(prices[i]);
			payment.setPayment_quantity(quantitys[i]);
			payment.setPayment_state("주문완료");
			payment.setUser_id(user_id);
			list.add(payment);
		}
		ArrayList<CartDTO> lists = new ArrayList<>();
		
		for (int i = 0; i < cart_nos.length; i++) {
			CartDTO cart = new CartDTO();
			cart.setCart_no(cart_nos[i]);
			lists.add(cart);
		}
		cartservice.cartdelete(lists);
		service.paymentinsert(list);

		return "/main";
	}
	
	@GetMapping("/paymentList.do")
	public String payment_list(@RequestParam("user_id") String user_id, Model model) {
		System.out.println(user_id);
		ArrayList<PaymentVO> list = service.paymentList(user_id);
		System.out.println(list);
		model.addAttribute("paymentList",list);
		return "/payment/payment_list";
	}
	/*
	 * @PostMapping("/payment.do") public @ResponseBody int payment(@RequestBody
	 * OderDTO cart,Model model) { return service.paymentInsert(cart); }
	 */

	/*
	 * @GetMapping("/payment") public String payment2() { return
	 * "redirect : /payment/payment"; }
	 */
}
