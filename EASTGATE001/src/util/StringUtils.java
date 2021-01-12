package util;

public class StringUtils {
	public static String nvl(String str) {
		return nvl(str, "");
	}

	public static String nvl(String str, String repl) {
		// null이 오거나 공백이면 repl을 리턴
		if (str == null || str.trim().equals("")) {
			return repl;
		}
		// 그 외에는 str을 리턴
		return str;
	}
}
