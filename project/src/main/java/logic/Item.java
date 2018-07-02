package logic;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	//������ num
	private Integer i_no;
	//�����۸�
	@NotEmpty(message="��ǰ���� ����ϼ���")
	private String i_name;
	//������ ����
	@NotNull(message="������ ����ϼ���")
	@Min(value=1, message="������ 1�� �̻� ���� �մϴ�.")
	private Integer i_price;
	//������� ����(����)�ο���
	private String i_people;
	//������� ���ɴ�
	private Integer i_age;
	//������� ����
	@NotEmpty(message="��ǰ������ ����ϼ���")
	private String i_explain;
	//������� �ǸŰ���
	private String i_amount;
	//������� �̹���
	private String i_img;
	//������� �帣
	private Integer it_no;
	private MultipartFile i_Img_File;
	private String tp_name;
	private String i_people2;
	
	public String getI_people2() {
		return i_people2;
	}
	public void setI_people2(String i_people2) {
		this.i_people2 = i_people2;
	}
	public String getTp_name() {
		return tp_name;
	}
	public void setTp_name(String tp_name) {
		this.tp_name = tp_name;
	}
	public MultipartFile getI_Img_File() {
		return i_Img_File;
	}
	public void setI_Img_File(MultipartFile i_Img_File) {
		this.i_Img_File = i_Img_File;
	}
	public Integer getI_no() {
		return i_no;
	}
	public void setI_no(Integer i_no) {
		this.i_no = i_no;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public Integer getI_price() {
		return i_price;
	}
	public void setI_price(Integer i_price) {
		this.i_price = i_price;
	}
	public String getI_people() {
		return i_people;
	}
	public void setI_people(String i_people) {
		this.i_people = i_people;
	}
	public Integer getI_age() {
		return i_age;
	}
	public void setI_age(Integer i_age) {
		this.i_age = i_age;
	}
	public String getI_explain() {
		return i_explain;
	}
	public void setI_explain(String i_explain) {
		this.i_explain = i_explain;
	}
	public String getI_amount() {
		return i_amount;
	}
	public void setI_amount(String i_amount) {
		this.i_amount = i_amount;
	}
	public String getI_img() {
		return i_img;
	}
	public void setI_img(String i_img) {
		this.i_img = i_img;
	}
	public Integer getIt_no() {
		return it_no;
	}
	public void setIt_no(Integer it_no) {
		this.it_no = it_no;
	}
	@Override
	public String toString() {
		return "Item [i_no=" + i_no + ", i_name=" + i_name + ", i_price=" + i_price + ", i_people=" + i_people
				+ ", i_age=" + i_age + ", i_explain=" + i_explain + ", i_amount=" + i_amount + ", i_img=" + i_img
				+ ", it_no=" + it_no + ", i_Img_File=" + i_Img_File + ", tp_name=" + tp_name + "]";
	}
	
	
}
