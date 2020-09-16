package test.main;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainClass03 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("특수 문자를 제외한 5~10글자를 입력하세요 : ");
		
		String str = scan.next();
		
		String reg = "^[a-zA-Z0-9]{5,10}$"; 
		String reg2 = "^[\\w]{5,10}$";
		
		//검증하기
		boolean result = str.matches(reg);
		boolean result2 = str.matches(reg2);
		
		//문자열을 반목문 돌면서 찾아내야할 때 matcher 객체를 사용한다.
		
		//정규 표현식을 compile한 Pattern 객체 얻어내기
		Pattern p = Pattern.compile(reg);
		
		//Pattern 객체에 검증할 문자열을 전달해서 Matcher 객체 얻어내기
		//Matcher : 대상 문자열의 패턴을 해석하고 주어진 패턴과 일치하는지 판별할 때 주로 사용
		Matcher m = p.matcher(str);
		
		//찾아지는 문자열이 있는지 boolean
		boolean result3 = m.find();
		
		System.out.println(result+"||"+result2+"||"+result3);
		
	}
}
