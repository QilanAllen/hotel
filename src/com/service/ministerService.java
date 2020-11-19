package com.service;

import java.util.List;

import com.pojo.Administrator;

public interface ministerService {
	public void addminister(String name,String countnum,String password);
	
	public List<Administrator> findMinister(String countnum);
	public Administrator findMinisterById(int id);
	public int countMinisterNum();
	public List<Administrator> allMinister();
	
	public int updataminister(Administrator minister);
	
	public int delectminister(int id);
}
