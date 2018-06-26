package logic;

public class Item {
	//아이템 num
	private Integer i_no;
	//아이템명
	private String i_name;
	//아이템 가격
	private Integer i_price;
	//보드게임 적정(가능)인원수
	private String i_people;
	//보드게임 연령대
	private Integer i_age;
	//보드게임 설명
	private String i_explain;
	//보드게임 판매갯수
	private String i_amount;
	//보드게임 이미지
	private String i_img;
	//보드게임 장르
	private Integer it_no;
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
				+ ", it_no=" + it_no + "]";
	}
}
