package logic;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User implements Serializable {
	@Size(min=3,max=10,message="아이디는 3자이상 10자 이하로 입력하세요.")
	private String m_id;
	@Size(min=3,max=12,message="비밀번호는 3자이상 12자 이하로 입력하세요.")
	private String m_passwd;
	@NotEmpty(message="사용자 이름은 필수 입니다.")
	private String m_name;
	private String m_phone;
	private String m_address;
	private String m_email;
	//좋아하는 보드게임 장르
	private Integer m_game;
	//마일리지
	private Integer m_mileage;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_passwd() {
		return m_passwd;
	}
	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Integer getM_game() {
		return m_game;
	}
	public void setM_game(Integer m_game) {
		this.m_game = m_game;
	}
	public Integer getM_mileage() {
		return m_mileage;
	}
	public void setM_mileage(Integer m_mileage) {
		this.m_mileage = m_mileage;
	}
	@Override
	public String toString() {
		return "User [m_id=" + m_id + ", m_passwd=" + m_passwd + ", m_name=" + m_name
				+ ", m_phone=" + m_phone + ", m_address=" + m_address + ", m_email=" + m_email + ", m_game=" + m_game
				+ ", m_mileage=" + m_mileage + "]";
	}
}
