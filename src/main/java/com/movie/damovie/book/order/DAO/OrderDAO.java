package com.movie.damovie.book.order.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.book.order.VO.OrderVO;

@Repository("orderDAO")
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int addBook(OrderVO order) {
		int bookresult = sqlSession.insert("mapper.order.insertBook", order);
		return bookresult;
	}
	
	public List<Map<String,String>> selectSeat(String company , String theater_Name , String theater_Num) throws DataAccessException {
		Map<String, String> selectseat_info = new HashMap<String,String>();
		selectseat_info.put("company", company);
		selectseat_info.put("theater_Name", theater_Name);
		selectseat_info.put("theater_Num", theater_Num);
		
		List<String> seatRow = sqlSession.selectList("mapper.order.selectSeatRow", selectseat_info);
		List<String> seatCol = sqlSession.selectList("mapper.order.selectSeatCol", selectseat_info);
		List<String> seatState = sqlSession.selectList("mapper.order.selectSeatState", selectseat_info);
		List<String> seatRow_distinct = sqlSession.selectList("mapper.order.selectSeatRow_distinct", selectseat_info);
		System.out.println("seatRow : " + seatRow);
		System.out.println("seatCol : " + seatCol);
		System.out.println("seatState : " + seatState);
		
		List<Map<String,String>> seat_info = new ArrayList<Map<String,String>>();
		
		for(int i = 0; i<seatState.size();i++) {
		Map<String, String> seat_info_map = new HashMap<String,String>();
		seat_info_map.put("seatRow", seatRow.get(i));
		seat_info_map.put("seatCol", seatCol.get(i));
		seat_info_map.put("seatState", seatState.get(i));
		seat_info.add(i, seat_info_map);
		}
		
		String a = "";
		int b = 0;
		for(int i =0 ; i< seat_info.size();i++) {
			if(i > 0 && !a.equals(seat_info.get(i).get("seatRow"))) {
				b = i;
				break;
			}
			a = seat_info.get(i).get("seatRow");
		}
		
		
		return seat_info;
	}
	
	public List<String> selectSeatDistinct(String company , String theater_Name , String theater_Num) throws DataAccessException {
		Map<String, String> selectseat_info = new HashMap<String,String>();
		selectseat_info.put("company", company);
		selectseat_info.put("theater_Name", theater_Name);
		selectseat_info.put("theater_Num", theater_Num);
		
		List<String> seatRow_distinct = sqlSession.selectList("mapper.order.selectSeatRow_distinct", selectseat_info);
		return seatRow_distinct;
	}
	
	public List<String> selectResSeatRow(String movie_name,String company , String theater_name , String theater_num,String time, String movie_date) throws DataAccessException {
		Map<String, String> selectseat_info = new HashMap<String,String>();
		selectseat_info.put("movie_name", movie_name);
		selectseat_info.put("company", company);
		selectseat_info.put("theater_name", theater_name);
		selectseat_info.put("theater_num", theater_num);
		selectseat_info.put("time", time);
		selectseat_info.put("movie_date", movie_date);
		
		List<String> seatResRow = sqlSession.selectList("mapper.order.selectResSeatRow", selectseat_info);
		System.out.println("seatResRow : " + seatResRow );
		return seatResRow;
	}
	
	public List<String> selectResSeatCol(String movie_name,String company , String theater_name , String theater_num,String time, String movie_date) throws DataAccessException {
		Map<String, String> selectseat_info = new HashMap<String,String>();
		selectseat_info.put("movie_name", movie_name);
		selectseat_info.put("company", company);
		selectseat_info.put("theater_name", theater_name);
		selectseat_info.put("theater_num", theater_num);
		selectseat_info.put("time", time);
		selectseat_info.put("movie_date", movie_date);
		
		List<String> seatResCol = sqlSession.selectList("mapper.order.selectResSeatCol", selectseat_info);
		System.out.println("seatResCol : " + seatResCol );
		return seatResCol;
	}
}
