package test.todo.dto;

public class TodoDto {
	private int num;
	private String work;
	private String state;
	
	// 생성자
	public TodoDto() {}
	
	public TodoDto(int num, String work, String state) {
		super();
		this.num = num;
		this.work = work;
		this.state = state;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
