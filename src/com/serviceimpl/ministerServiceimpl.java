package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdministratorMapper;
import com.pojo.Administrator;
import com.pojo.AdministratorExample;
import com.pojo.AdministratorExample.Criteria;
import com.service.ministerService;

@Service
public class ministerServiceimpl implements ministerService {
	@Autowired
	AdministratorMapper mapper;
	
	@Override
	public void addminister(String name, String countnum, String password) {
		Administrator record=new Administrator();
		record.setCountnum(countnum);
		record.setName(name);
		record.setPassword(password);
		mapper.insertSelective(record);
	}

	@Override
	public List<Administrator> findMinister(String countnum) {
		AdministratorExample example=new AdministratorExample();
		Criteria criter=example.createCriteria();
		criter.andCountnumEqualTo(countnum);
		List<Administrator> l = mapper.selectByExample(example);
		return l;
	}

	@Override
	public int countMinisterNum() {
		// TODO Auto-generated method stub
		AdministratorExample example=new AdministratorExample();
		int num = mapper.countByExample(example);
		return num;
	}

	@Override
	public List<Administrator> allMinister() {
		// TODO Auto-generated method stub
		AdministratorExample example=new AdministratorExample();
		List<Administrator> l = mapper.selectByExample(example);
		return l;
	}

	@Override
	public Administrator findMinisterById(int id) {
		// TODO Auto-generated method stub
		Administrator l = mapper.selectByPrimaryKey(id);
		return l;
	}

	@Override
	public int updataminister(Administrator minister) {
		// TODO Auto-generated method stub
		AdministratorExample example = new AdministratorExample();
		Criteria criter = example.createCriteria();
		criter.andIdEqualTo(minister.getId());
		int i=mapper.updateByExampleSelective(minister, example);
		return i;
	}

	@Override
	public int delectminister(int id) {
		// TODO Auto-generated method stub
		int i=mapper.deleteByPrimaryKey(id);
		return i;
	}

}
