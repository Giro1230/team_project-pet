package com.sajura.team_project.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sajura.team_project.controller.dto.CartDTO;
import com.sajura.team_project.service.CartService;
import com.sajura.team_project.vo.CartVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
    private final CartService service;

    @GetMapping("/cartlist.do")
	public String cartlist(@RequestParam("user_id") String id, Model model) {
		ArrayList<CartVO> list=service.cartlist(id);
		model.addAttribute("list",list);
		return "/cart/cartList";
	}

    @GetMapping("/cart_insert.do")
    public @ResponseBody int cartInsert(CartVO cart) {
        return service.cartinsert(cart);
    }



	/*
	 * @PostMapping("/oder.do") public @ResponseBody ModelAndView test(@RequestBody
	 * List<OderReq> obj, Model model){ System.out.println(obj);
	 * 
	 * model.addAttribute("cart",obj); return new
	 * ModelAndView("/payment/payment.do"); }
	 */
}
