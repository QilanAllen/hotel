package com.web.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Administrator;
import com.pojo.Room;
import com.service.ministerService;




@Controller
public class admintorController {
	@Autowired
	ministerService ministerservice;
	
	
	@RequestMapping("/longin")
	@ResponseBody
	public String longin(HttpServletRequest request,HttpSession session){
		String countnum = request.getParameter("logname");
		String password = request.getParameter("logpass");
		//System.out.print("cccc"+countnum+"aaa");
		List<Administrator> l = ministerservice.findMinister(countnum);
		if(l.size()!=0){
			//System.out.print("cccc"+countnum+"aaa");
			Administrator a=l.get(0);
			String pass=a.getPassword();
			if(pass.equals(password)){
				session.setAttribute("username",a.getName());
				return "OK";
			}else{
				return "passerror";
			}
		}else{
			return "该账号不存在";
		}
	}
	
	@RequestMapping("/admintor")
	public String toadmintor(HttpSession session){
		int num=ministerservice.countMinisterNum();
		session.setAttribute("ministersnum",num);
		List<Administrator> l=ministerservice.allMinister();
		session.setAttribute("ministerlist",l);
		return "admin-administrator";
	}
	
	@RequestMapping("/addminister")
	@ResponseBody
	public String addminister(HttpServletRequest request){
		String name=request.getParameter("ministername");
		String countnum=request.getParameter("ministercountnum");
		String password=request.getParameter("ministerpassword");
		List<Administrator> l = ministerservice.findMinister(countnum);
		if(l.size()==0){
			ministerservice.addminister(name, countnum, password);
			return "OK";
		}
		return "";
	}
	
	
	@RequestMapping("/findminister")
	public String findminister(HttpSession session,HttpServletRequest request){
		
		String id=request.getParameter("find_id");
		int minister_id=0;
		if(id==null||id==""){
			session.setAttribute("ministerlist",null);
			System.out.print("ggggggg");
			return "admin-administrator";
		}else{
			minister_id=Integer.valueOf(id);
			Administrator minister = ministerservice.findMinisterById(minister_id);
			if(minister==null){
				session.setAttribute("ministerlist",null);
				return "admin-administrator";
			}
			ArrayList<Administrator> list=new ArrayList<Administrator>();
			list.add(minister);
			session.setAttribute("ministerlist",list);
			return "admin-administrator";
		}
	}
	
	@RequestMapping("/updataminister")
	@ResponseBody
	public String updataminister(HttpServletRequest request){
		String ministerid = request.getParameter("ministerid");
		String ministername = request.getParameter("ministername");
		String ministerpassword = request.getParameter("ministerpassword");
		Administrator minister=new Administrator();
		minister.setId(Integer.valueOf(ministerid));
		minister.setName(ministername);
		minister.setPassword(ministerpassword);
		int i=ministerservice.updataminister(minister);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	
	@RequestMapping("/delectminister")
	@ResponseBody
	public String delectminister(String id){
		Integer minister_id=Integer.valueOf(id);
		int i=ministerservice.delectminister(minister_id);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	@RequestMapping("/delectministerAll")
	@ResponseBody
	public String delectministerAll(String[] list){
		int i=0;
		for(String s:list){
			i=i+ministerservice.delectminister(Integer.valueOf(s));
		}
		if(i==list.length){
			return "OK";
		}
		return "";
	}
}
