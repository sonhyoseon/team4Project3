package domain;

public class LoginDTO {
	
	private String id;
	private String pw;

	private static final int AUTH = 1;
	private boolean useCookie;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", pw=" + pw + ", useCookie=" + useCookie + "]";
	}
	
	
}
