package com.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Client;
import com.pojo.Room;
import com.serviceimpl.clientServiceImpl;
import com.serviceimpl.roomServiceImpl;

@Controller
public class clientController {
	@Autowired
	roomServiceImpl roomservice;
	@Autowired
	clientServiceImpl clientservice;
	
	@RequestMapping("/client")
	public String toclient(HttpSession session){
		List<Client> list = clientservice.allClient();
		int num=list.size();
		session.setAttribute("clientnum",num);
		session.setAttribute("clientlist",list);
		return "admin-client";
	}
	
	
	@RequestMapping("/addclient")
	@ResponseBody
	public String addclient(HttpServletRequest requst){
		System.out.print(1111);
		String roomnum=requst.getParameter("roomnum");
		List<Room> room = roomservice.findRoom(Integer.valueOf(roomnum));
		if(room.size()==0){
			return "NOROOM";
		}

		System.out.print(1111);
		for(Room aroom:room){
			if(aroom.getIsuse()==1){
				return "ISUSE";
			}
		}
		Client client=new Client();
		String idcard=requst.getParameter("idcard");
		client.setIdcard(idcard);
		
		String name=requst.getParameter("name");
		client.setName(name);
		client.setRoomnum(Integer.valueOf(roomnum));
		String daysum=requst.getParameter("daysum");;
		client.setDaysum(daysum);
		client.setIsview(1);
		
		Date starttime=new Date();
		client.setStarttime(starttime);
		
		
		Integer price=room.get(0).getPrice();
		Integer totalprice=Integer.valueOf(daysum)*price;
		client.setTotalprice(totalprice);
		int i=clientservice.addClient(client);
		if(i!=0){
			Room aroom=room.get(0);
			aroom.setIsuse(1);
			roomservice.updataroom(aroom);
			return "OK";
		}
		return "";
	}
	
	@RequestMapping("/delectclient")
	@ResponseBody
	public String delectclient(int id){
		
		int i=clientservice.delectClient(id);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	@RequestMapping("/delectcliebtAll")
	@ResponseBody
	public String delectcliebtAll(String[] list){
		int i=0;
		for(String s:list){
			i=i+clientservice.delectClient(Integer.valueOf(s));
		}
		if(i==list.length){
			return "OK";
		}
		return "";
	}
	
	@RequestMapping("/findclient")
	public String findclient(HttpSession session,HttpServletRequest request){
		String name = request.getParameter("findname");
		String idcard = request.getParameter("findidcard");
		String roomnum = request.getParameter("findroomnum");
		System.out.print(name+" "+idcard+" "+roomnum);
		Client c=new Client();
		c.setName(name);
		c.setIdcard(idcard);
		try{
			c.setRoomnum(Integer.valueOf(roomnum));
		}catch(Exception e){
			c.setRoomnum(-1);
		}
		List<Client> list = clientservice.findClient(c);
		System.out.print(list.size());
		session.setAttribute("clientlist",list);
		
		return "admin-client";
	}
	
	@RequestMapping("/updataclient")
	@ResponseBody
	public String updataclient(HttpServletRequest request){
		String id=request.getParameter("id");
		Client c = clientservice.findClientByid(id);
		String old_daysum=c.getDaysum();
		if(!old_daysum.equals(request.getParameter("daysum"))){
			int totalprice=c.getTotalprice();
			int price=totalprice/Integer.valueOf(old_daysum);
			int newprice=price*Integer.valueOf(request.getParameter("daysum"));
			c.setTotalprice(newprice);
			c.setDaysum(request.getParameter("daysum"));
		}
		c.setName(request.getParameter("name"));
		c.setIdcard(request.getParameter("idcard"));
		int i=clientservice.updataClient(c);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	
	
}
