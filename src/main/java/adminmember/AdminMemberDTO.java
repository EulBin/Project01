package adminmember;
/**
DTO(Data Transfer Object) : JSP와 Java파일간에 데이터를 전달하기
	위한 객체로 자바빈 규약에 의해 제작한다.
	자바빈 규약은 115페이지를 참조. 
 */
public class AdminMemberDTO {
	
	//멤버변수 : member테이블의 컬럼과 동일하게 설정한다. 
    private String userid;
    private String name;
    private String email;
    private String pwd;
    
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
   
}



