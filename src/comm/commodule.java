package comm;

import java.util.List;

import model.CalVo;

//�޷¿��� ���� ������ ����� ����
public class commodule {
//���ڸ����� ���ڸ��� 201211  >> 20120101
	
public static String isTwo(String month) {
	return (month.length()<2)?("0"+month):month;
}
	//�Ͽ��� ����� ���� ���ڻ�
	
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
	//clist ����� ��� ���� ������ ����
	// �ش��Ͽ� ����Ʈ�� �ѷ���
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
