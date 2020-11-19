package com.service;


import java.util.List;

import com.pojo.Room;

public interface roomService {
	public void addRoom(int roomnum,int isuse,int price);
	
	public List<Room> findRoom(int romnum);
	public int countRoomNum();
	public List<Room> allRoom();
	
	public int updataroom(Room room);
	
	public int delectroom(int id);
}
