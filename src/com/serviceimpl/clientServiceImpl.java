package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ClientMapper;
import com.dao.RoomMapper;
import com.pojo.Client;
import com.pojo.ClientExample;
import com.pojo.ClientExample.Criteria;
import com.pojo.Room;
import com.service.clientService;

@Service
public class clientServiceImpl implements clientService {
	@Autowired
	ClientMapper mapper;
	@Autowired
	roomServiceImpl roomservice;
	
	@Override
	public int addClient(Client client) {
		// TODO Auto-generated method stub
		int i=mapper.insert(client);
		return i;
	}
	@Override
	public List<Client> allClient() {
		// TODO Auto-generated method stub
		ClientExample example = new ClientExample();
		Criteria criter = example.createCriteria();
		criter.andIsviewEqualTo(1);
		List<Client> list = mapper.selectByExample(example);
		return list;
	}
	@Override
	public int delectClient(int id) {
		// TODO Auto-generated method stub
		
		ClientExample example=new ClientExample();
		Criteria criter = example.createCriteria();
		criter.andIdEqualTo(id);
		Client client=mapper.selectByPrimaryKey(id);
		client.setIsview(0);
		int i=mapper.updateByExampleSelective(client, example);
		if(i!=0){
			Integer roomnum = client.getRoomnum();
			List<Room> room = roomservice.findRoom(roomnum);
			Room aroom=room.get(0);
			aroom.setIsuse(0);
			roomservice.updataroom(aroom);
			return i;
		}
		return 0;
	}
	@Override
	public List<Client> findClient(Client c) {
		// TODO Auto-generated method stub
		
		ClientExample example=new ClientExample();
		Criteria criter = example.createCriteria();
		criter.andIsviewEqualTo(1);
		if(c.getName().length()!=0)
			criter.andNameEqualTo(c.getName());
		if(c.getIdcard().length()!=0)
			criter.andIdcardEqualTo(c.getIdcard());
		if(c.getRoomnum()!=(-1))
			criter.andRoomnumEqualTo(c.getRoomnum());
		List<Client> l = mapper.selectByExample(example);
		return l;
	}
	@Override
	public Client findClientByid(String id) {
		// TODO Auto-generated method stub
		Client c = mapper.selectByPrimaryKey(Integer.valueOf(id));
		return c;
	}
	@Override
	public int updataClient(Client c) {
		// TODO Auto-generated method stub
		
		ClientExample example=new ClientExample();
		Criteria criter = example.createCriteria();
		criter.andIdEqualTo(c.getId());
		int i=mapper.updateByExampleSelective(c, example);
		return i;
	}

}
