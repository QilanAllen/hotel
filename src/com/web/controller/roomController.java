package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Room;
import com.serviceimpl.roomServiceImpl;

@Controller
public class roomController {
	@Autowired
	roomServiceImpl roomservice;
	
	@RequestMapping("/room")
	public String toroom(HttpSession session){
		int countnum=roomservice.countRoomNum();
		session.setAttribute("room_countnum",countnum);
		List<Room> roomlist = roomservice.allRoom();
		session.setAttribute("roomlist",roomlist);
		return "admin-room";
	}
	
	@RequestMapping("/findroom")
	public String findroom(HttpSession session,HttpServletRequest request){
		
		String roomnum=request.getParameter("find_roomnum");
		int num=0;
		if(roomnum==null||roomnum==""){
			num=-1;
		}else{
			num=Integer.valueOf(roomnum);
		}
		List<Room> roomlist = roomservice.findRoom(num);
		session.setAttribute("roomlist",roomlist);
		return "admin-room";
	}
	
	@RequestMapping("/addroom")
	@ResponseBody	
	public String addroom(HttpServletRequest request){
		String roomnum=request.getParameter("roomnum");
		String isuse=request.getParameter("isuse");
		String price=request.getParameter("price");
		int isuse_num=0;
		if(isuse.equals("yes")){
			isuse_num=1;
		}
		
		List<Room> r=roomservice.findRoom(Integer.valueOf(roomnum));
		if(r.size()!=0){
			return "";
		}
		roomservice.addRoom(Integer.valueOf(roomnum), isuse_num, Integer.valueOf(price));
		return "OK";
	}
	
	@RequestMapping("/updataroom")
	@ResponseBody
	public String updataroom(HttpServletRequest request){
		String roomnum=request.getParameter("roomnum");
		String isuse=request.getParameter("isuse");
		String price=request.getParameter("price");
		int isuse_num=0;
		if(isuse.equals("yes")){
			isuse_num=1;
		}
		Room room=new Room();
		room.setRoomnum(Integer.valueOf(roomnum));
		room.setIsuse(isuse_num);
		room.setPrice(Integer.valueOf(price));
		
		int i=roomservice.updataroom(room);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	@RequestMapping("/delectroom")
	@ResponseBody
	public String delectroom(int id){
		int i=roomservice.delectroom(id);
		if(i!=0){
			return "OK";
		}
		return "";
	}
	
	
	@RequestMapping("/delectroomAll")
	@ResponseBody
	public String delectAll(String[] list){
		int i=0;
		for(String s:list){
			i=i+roomservice.delectroom(Integer.valueOf(s));
		}
		if(i==list.length){
			return "OK";
		}
		return "";
	}
}
