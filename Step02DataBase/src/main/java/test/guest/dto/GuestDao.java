package test.guest.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.guest.dao.GuestDto;
import test.member.dto.MemberDto;
import test.util.DBcpBean;

public class GuestDao {

	private static GuestDao dao;
	
	private GuestDao() {}
	
	public static GuestDao getInstance() {
		
		if (dao == null) {
			dao = new GuestDao();
		}
		
		return dao;
	}
	
	public List<GuestDto> getList() {
		// 회원 목록을 담을 객체 미리 생성하기
		List<GuestDto> list = new ArrayList<>();
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select num, writer, content, pwd, regdate"
					+ " from board_guest"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			
			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while(rs.next()) {
				// ResultSet 에 cursor 가 위치 한곳의 칼럼 정보를 얻어와서 MemberDto 객체에 담고
				GuestDto dto = new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));
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
	
	public boolean insert(GuestDto dto) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "insert into board_guest"
					+ " (num, writer, content, pwd, regdate)"
					+ " values (member_seq.nextval, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());
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
	public boolean delete(int num, String pwd) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "delete from board_guest"
					+ " where num=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			pstmt.setString(2, pwd);
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
	
	public GuestDto getData(int num) {
		// 회원 목록을 담을 객체 미리 생성하기
		GuestDto dto=null;
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select writer, content, pwd, regdate"
					+ " from board_guest"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while(rs.next()) {
				dto = new GuestDto();
				dto.setNum(num); // 번호는 지역 변수에 있는 값을 담고
				// 이름과 주소는 ResultSet 으로 부터 얻어내서 담는다.
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	
	public boolean update(GuestDto dto) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "update board_guest"
					+ " set writer=?, content=?, regdate=sysdate"
					+ " where num=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPwd());
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
