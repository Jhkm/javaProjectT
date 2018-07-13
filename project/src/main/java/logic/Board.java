package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int b_no;
	private int b_category;
	@NotEmpty(message="제목을 입력하세요")
	private String b_subject;
	@NotEmpty(message="내용을 입력하세요")
	private String b_content;
	private int b_readcnt;
	private String b_fileurl;
	private Date b_regtime;
	private int b_ref;
	private int b_reflevel;
	private int b_refstep;
	private MultipartFile b_file;
	private String m_id;
//	@NotEmpty(message="날짜를 선택하세요")
	private String b_state;
//	@NotEmpty(message="장소를 선택하세요")
	private Date b_date;
//	@NotEmpty(message="참가 인원를 선택하세요")
	private int b_people;
	private String g_id;
	private int i_no;
	private int i_grade;
	public int getI_grade() {
		return i_grade;
	}
	public void setI_grade(int i_grade) {
		this.i_grade = i_grade;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_category() {
		return b_category;
	}
	public void setB_category(int b_category) {
		this.b_category = b_category;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_readcnt() {
		return b_readcnt;
	}
	public void setB_readcnt(int b_readcnt) {
		this.b_readcnt = b_readcnt;
	}
	public String getB_fileurl() {
		return b_fileurl;
	}
	public void setB_fileurl(String b_fileurl) {
		this.b_fileurl = b_fileurl;
	}
	public Date getB_regtime() {
		return b_regtime;
	}
	public void setB_regtime(Date b_regtime) {
		this.b_regtime = b_regtime;
	}
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_reflevel() {
		return b_reflevel;
	}
	public void setB_reflevel(int b_reflevel) {
		this.b_reflevel = b_reflevel;
	}
	public int getB_refstep() {
		return b_refstep;
	}
	public void setB_refstep(int b_refstep) {
		this.b_refstep = b_refstep;
	}
	public MultipartFile getB_file() {
		return b_file;
	}
	public void setB_file(MultipartFile b_file) {
		this.b_file = b_file;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getB_people() {
		return b_people;
	}
	public void setB_people(int b_people) {
		this.b_people = b_people;
	}
	public String getG_id() {
		return g_id;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	
	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", b_category=" + b_category + ", b_subject=" + b_subject + ", b_content="
				+ b_content + ", b_readcnt=" + b_readcnt + ", b_fileurl=" + b_fileurl + ", b_regtime=" + b_regtime
				+ ", b_ref=" + b_ref + ", b_reflevel=" + b_reflevel + ", b_refstep=" + b_refstep + ", b_file=" + b_file
				+ ", m_id=" + m_id + ", b_state=" + b_state + ", b_date=" + b_date + ", b_people=" + b_people
				+ ", g_id=" + g_id + ", i_no=" + i_no + "]";
	}

	
}
