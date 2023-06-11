package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DBcpBean;

public class CafeDao {

	// static 필드
	private static CafeDao dao;
	// 외부에서 객체 생성하지 못하도록 생성자를 private 로
	private CafeDao() {}
	// 자신의 참조값을 리턴해주는 메소드
	public static CafeDao getInstance() {
		if(dao==null) {
			dao=new CafeDao();
		}
		 return dao;
	}
	// 글 조회수 올리는 메소드
	public boolean addViewCount(int num) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "update board_cafe"
					+ " set viewCount=viewCount+1"
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
	
	
	
	// 글목록 메소드
	public List<CafeDto> getList() {
		// 회원 목록을 담을 객체 미리 생성하기
		List<CafeDto> list = new ArrayList<>();
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select num, writer, title, content, viewCount, regdate"
					+ " from board_cafe"
					+ " order by num desc";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성

			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while (rs.next()) {
				CafeDto dto = new CafeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				// ArrayList 객체에 누적 시키기
				list.add(dto);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	
	// 게시글 한개의 내용 가져오기
	public CafeDto getData(int num) {
		// 회원 목록을 담을 객체 미리 생성하기
		CafeDto dto = null;
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select num, writer, title, content, viewCount, regdate"
					+ " from board_cafe"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	
	// 게시글 삭제
	public boolean delete(int num) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "delete from board_cafe"
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
	
	
	
	// 글 수정
	public boolean update(CafeDto dto) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "update board_cafe"
					+ " set title=?, content=?"
					+ " where writer=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
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

	
	
	
	
	// insert 문
	public boolean insert(CafeDto dto) {
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "insert into board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " values(board_cafe_seq.nextval, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	}

