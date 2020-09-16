package test.main;

public class MainClass01 {
	public static void main(String[] args) {
		//검증할 문자열
		String str = "abcd12345";
		//검증할 정규표현식
		String reg = "abcd";    //jsp와는 달리 java에서는 default 값으로 ^ $이 정해져있다. 따라서 검증 문자열과 정규표현식이 일치해야 true가 반환된다.
		
		String reg2 = "abcd12345";
		
		
//		boolean isMatch = str.matches(reg);	
//		boolean isMatch2 = str.matches(reg2);
		
		boolean isMatch_1 = reg.matches(str);
		boolean isMatch2_1 = reg2.matches(str);

//		System.out.println(isMatch);
//		System.out.println(isMatch2);
		
		System.out.println(isMatch_1);
		System.out.println(isMatch2_1);
	}
}
