package cal.service;

import java.util.ArrayList;
import java.util.List;

import model.CalVo;

public interface CalService {

		void addCal(CalVo c);

		List CalList(String c_id);
	
		void del(String id, String mdate, String title);
	
}
