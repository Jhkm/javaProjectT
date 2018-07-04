package logic;

import java.util.Date;

public class Reply {
	private int r_no;
	private String r_content;
	private int r_ref;
	private int r_refstep;
	private int r_reflevel;
	private Date r_date;
	private int b_no;
	private String m_id;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_ref() {
		return r_ref;
	}
	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}
	public int getR_refstep() {
		return r_refstep;
	}
	public void setR_refstep(int r_refstep) {
		this.r_refstep = r_refstep;
	}
	public int getR_reflevel() {
		return r_reflevel;
	}
	public void setR_reflevel(int r_reflevel) {
		this.r_reflevel = r_reflevel;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "Reply [r_no=" + r_no + ", r_content=" + r_content + ", r_ref=" + r_ref + ", r_refstep=" + r_refstep
				+ ", r_reflevel=" + r_reflevel + ", r_date=" + r_date + ", b_no=" + b_no + ", m_id=" + m_id + "]";
	}
	
	
}
