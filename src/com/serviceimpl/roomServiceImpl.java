package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RoomMapper;
import com.pojo.Room;
import com.pojo.RoomExample;
import com.pojo.RoomExample.Criteria;
import com.service.roomService;


@Service
public class roomServiceImpl implements roomService {
	@Autowired
	RoomMapper roommapper;
	
	@Override
	public void addRoom(int roomnum, int isuse, int price) {
		// TODO Auto-generated method stub
		Room r=new Room();
		r.setIsuse(isuse);
		r.setRoomnum(roomnum);
		r.setPrice(price);
		roommapper.insert(r);
	}

	@Override
	public List<Room> findRoom(int roomnum) {
		// TODO Auto-generated method stub
		
		RoomExample example=new RoomExample();
		Criteria criteria = example.createCriteria();
		if(roomnum>=0){
			criteria.andRoomnumEqualTo(roomnum);
		}
		List<Room> l = roommapper.selectByExample(example);
		return l;
		
	}

	@Override
	public int countRoomNum() {
		// TODO Auto-generated method stub
		RoomExample example=new RoomExample();
		int num = roommapper.countByExample(example);
		return num;
	}

	@Override
	public List<Room> allRoom() {
		// TODO Auto-generated method stub
		RoomExample example=new RoomExample();
		List<Room> roomlist = roommapper.selectByExample(example);
		return roomlist;
	}

	@Override
	public int updataroom(Room room) {
		// TODO Auto-generated method stub
		RoomExample example=new RoomExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoomnumEqualTo(room.getRoomnum());
		int i=roommapper.updateByExampleSelective(room, example);
		return i;
	}

	@Override
	public int delectroom(int id) {
		// TODO Auto-generated method stub
		int i=roommapper.deleteByPrimaryKey(id);
		return i;
	}

	
}
