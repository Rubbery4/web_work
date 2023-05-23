package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DBcpBean;

public class TodoDao {
	// 2.
	private static TodoDao dao;
	
	// 1.
	private TodoDao() {}
	
	// 3.
	public static TodoDao getInstance() {
		// 서버 시작후 최초 요청이라면
		if (dao == null) {
			// 객체를 생성해서 static 필드에 저장해 놓는다.
			dao = new TodoDao();
		}
		// 필드에 저장된 참조값 리턴해주기
		return dao;
		
	}
	
	// 회원 목록을 리턴하는 메소드
	public List<TodoDto> getList() {
		// 회원 목록을 담을 객체 미리 생성하기
		List<TodoDto> list = new ArrayList<>();
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select num, work, state"
					+ " from todo"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			
			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while(rs.next()) {
				// ResultSet 에 cursor 가 위치 한곳의 칼럼 정보를 얻어와서 TodoDto 객체에 담고
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setWork(rs.getString("work"));
				dto.setState(rs.getString("state"));
				// ArrayList 객체에 누적 시키기
				list.add(dto);				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {}
		}
		// 회원 목록이 담긴 ArrayList 객체 리턴해주기
		return list;
	}
	
	public boolean insert(TodoDto dto) {
			// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
				conn = new DBcpBean().getConn();
				// 실행할 sql 문 (select)
				String sql = "insert into todo"
						+ " (num, work, state)"
						+ " values (todo_seq.nextval, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				// sql 문이 미완성이라면 여기서 완성
				pstmt.setString(1, dto.getWork());
				pstmt.setString(2, dto.getState());
				// select 문 수행하고 결과값 받아오기
				rowCount = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null) conn.close();
				} catch(Exception e) {}
			}
			if (rowCount>0) {
				return true;
			} else {
				return false;
			}
	}
	public boolean delete(int num) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "delete from todo"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행하고 결과값 받아오기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}
