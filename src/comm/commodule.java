package comm;

import java.util.List;

import model.CalVo;

//달력에서 쓰는 공통의 기능을 정의
public class commodule {
//한자리수를 두자리수 201211  >> 20120101
	
public static String isTwo(String month) {
	return (month.length()<2)?("0"+month):month;
}
	//일요일 토요일 평일 글자색
	
	public static String fontColor(int date, int dayofWeek) {
		int dayCal = (dayofWeek-1+date)%7;
		if(dayCal==0) {
			return "blue";
		}else if(dayCal==1) {
			return "red";
		}else {
			return "black";
		}
	}
	//clist 년월에 모든 글을 가지고 있음
	// 해당일에 리스트를 뿌려줌
	public static String getCalView(int i, List<CalVo> clist) {
		//mdate(yyyymmdd)
		
		String d = isTwo(String.valueOf(i));
		String res = "";
		for(CalVo vo : clist) {
			if(vo.getMdate().substring(6,8).equals(d)) {
				res+="<p>"+
				(vo.getTitle().length()>6?(vo.getTitle().substring(0,6)+"..."):
					(vo.getTitle())+"</p>");
			}
		}
		return res;
	}

	
}
