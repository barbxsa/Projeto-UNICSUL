package controller;

public class Usuario {

	private Integer id;
	private String email;
	private String pass;
	public String junior;
	
	public String getJunior() {
		return email;
	}

	public Integer getId() {
		return id;
	}
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}
