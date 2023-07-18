package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("admin_main")
	public String adminMain() {
		System.out.println("AdminController - adminMain");
		
		return "admin/admin_main";
	}
	
	@GetMapping("admin_member_list")
	public String adminMemberList() {
		System.out.println("AdminController - adminMemberList");
		
		return "admin/admin_member_list";
	}
	
	@GetMapping("admin_member_report")
	public String adminMemberReport() {
		System.out.println("AdminController - adminMemberReport");
		
		return "admin/admin_member_report";
	}
	
	@GetMapping("admin_zman_list")
	public String adminZmanList() {
		System.out.println("AdminController - adminZmanList");
		
		return "admin/admin_zman_list";
	}
	
	@GetMapping("admin_zman_delivery_list")
	public String adminZmanDeliveryList() {
		System.out.println("AdminController - adminZmanDeliveryList");
		
		return "admin/admin_zman_delivery_list";
	}

	@GetMapping("admin_zman_report")
	public String adminZmanReport() {
		System.out.println("AdminController - adminZmanReport");
		
		return "admin/admin_zman_report";
	}

	@GetMapping("admin_used_list")
	public String adminUsedList() {
		System.out.println("AdminController - adminUsedList");
		
		return "admin/admin_used_list";
	}
	
	@GetMapping("tables_ex")
	public String tables_ex() {
		System.out.println("AdminController - tables_ex");
		
		return "admin/bootstrap_admin_ex/tables_ex";
	}
	
	@GetMapping("charts_ex")
	public String charts_ex() {
		System.out.println("AdminController - charts_ex");
		
		return "admin/bootstrap_admin_ex/charts_ex";
	}
}
