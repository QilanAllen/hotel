package com.service;

import java.util.List;

import com.pojo.Client;

public interface clientService {
	public int addClient(Client client);
	
	public List<Client> allClient();
	public List<Client> findClient(Client c);
	public Client findClientByid(String id);
	
	public int delectClient(int id);
 
	public int updataClient(Client c);
}
