package entity;

public class Emp {
  private String  eid;
  private String ename;
  private String  esal;
  private String esex;
  private String img;
	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEsal() {
		return esal;
	}

	public void setEsal(String esal) {
		this.esal = esal;
	}

	public String getEsex() {
		return esex;
	}

	public void setEsex(String esex) {
		this.esex = esex;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Emp(String eid, String ename, String esal, String esex ,String img) {
	super();
	this.eid = eid;
	this.ename = ename;
	this.esal = esal;
	this.esex = esex;
	this.img = img;
}
public Emp() {
	super();
}
}
