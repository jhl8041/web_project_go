package cal.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import model.CalVo;

public interface CalDao {

//�����Է�
public void insertCalBoard(CalVo vo);

//List�޷� ����Ʈ
public List getCalViewList(String c_id);
//��������
public void del(String id,String mdate, String title);


}