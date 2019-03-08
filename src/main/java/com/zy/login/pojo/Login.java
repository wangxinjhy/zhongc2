package com.zy.login.pojo;

public class Login {
	private Integer lid;	
	private String lusername;
	private String lpassword;
	private Integer ltype;
	private Integer lstate;
	private String lcode;
	
	
	
	public Login() {
		super();
	}
	public Login(Integer lid, String lusername, String lpassword, Integer ltype, Integer lstate, String lcode) {
		super();
		this.lid = lid;
		this.lusername = lusername;
		this.lpassword = lpassword;
		this.ltype = ltype;
		this.lstate = lstate;
		this.lcode = lcode;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public String getLusername() {
		return lusername;
	}
	public void setLusername(String lusername) {
		this.lusername = lusername;
	}
	public String getLpassword() {
		return lpassword;
	}
	public void setLpassword(String lpassword) {
		this.lpassword = lpassword;
	}
	public Integer getLtype() {
		return ltype;
	}
	public void setLtype(Integer ltype) {
		this.ltype = ltype;
	}
	public Integer getLstate() {
		return lstate;
	}
	public void setLstate(Integer lstate) {
		this.lstate = lstate;
	}
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	
	
}
