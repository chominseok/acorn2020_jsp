package test.main;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainClass04 {
	public static void main(String[] args) {
		String str = "abcd1234abcd5678abcd";
		String reg = "[a-z]+";
		//compile =  주어진 정규표현식으로부터 패턴을 만든다.
		Pattern p = Pattern.compile(reg);
		
		Matcher m = p.matcher(str);
		
		// 만약 문자열을 배열에 담고싶으면
		List<String> list = new ArrayList<>();
		
		//matcher 객체의 find() 메소드를 호출하면서 반복문을 수행해서
		while(m.find()) {
		
			list.add(m.group());
			//찾았으면 찾은 문자열을 출력한다. group() >> 매칭된 부분을 반환한다.
			System.out.println(m.group());
		}
		System.out.println(list);
	}
}
