package com.erp.vo;

public class Clients {
	private String clients_num;
	private String clients_name;
	private String clients_addr;
	private String clients_tel;
	private String user_num;
	private String clients_note;
	
	public Clients() {}

	public Clients(String clients_num, String clients_name, String clients_addr, String clients_tel, String user_num,
			String clients_note) {
		this.clients_name = clients_name;
		this.clients_addr = clients_addr;
		this.clients_tel = clients_tel;
		this.user_num = user_num;
		this.clients_note = clients_note;
	}

	public String getClients_num() {
		return clients_num;
	}

	public void setClients_num(String clients_num) {
		this.clients_num = clients_num;
	}

	public String getClients_name() {
		return clients_name;
	}

	public void setClients_name(String clients_name) {
		this.clients_name = clients_name;
	}

	public String getClients_addr() {
		return clients_addr;
	}

	public void setClients_addr(String clients_addr) {
		this.clients_addr = clients_addr;
	}

	public String getClients_tel() {
		return clients_tel;
	}

	public void setClients_tel(String clients_tel) {
		this.clients_tel = clients_tel;
	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getClients_note() {
		return clients_note;
	}

	public void setClients_note(String clients_note) {
		this.clients_note = clients_note;
	}
	
}
