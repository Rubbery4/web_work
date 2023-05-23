package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DBcpBean;

/*
 * Application 전역에서 MemberDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야 한다.
 * 
 * 1. 외부에서 객체 생성하지 못하도록 생성자의 접근지정자는 private
 * 2. 자신의 참조값을 저장 할 수 있는 static 필드 만들기
 * 3. 자신의 참조값을 리턴해주는 public static 메소드 만들기 
 */
public class MemberDao {
	// 2.
	private static MemberDao dao;
	
	// 1.
	private MemberDao() {}
	
	// 3.
	public static MemberDao getInstance() {
		// 서버 시작후 최초 요청이라면
		if (dao == null) {
			// 객체를 생성해서 static 필드에 저장해 놓는다.
			dao = new MemberDao();
		}
		// 필드에 저장된 참조값 리턴해주기
		return dao;
		
	}
	
	// 회원 목록을 리턴하는 메소드
	public List<MemberDto> getList() {
		// 회원 목록을 담을 객체 미리 생성하기
		List<MemberDto> list = new ArrayList<>();
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
			conn = new DBcpBean().getConn();
			// 실행할 sql 문 (select)
			String sql = "select num, name, addr"
					+ " from member"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			
			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 애용 추출
			while(rs.next()) {
				// ResultSet 에 cursor 가 위치 한곳의 칼럼 정보를 얻어와서 MemberDto 객체에 담고
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
	
	public boolean insert(MemberDto dto) {
			// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다 (Connection Pool 에서 얻어오기)
				conn = new DBcpBean().getConn();
				// 실행할 sql 문 (select)
				String sql = "insert into member"
						+ " (num, name, addr)"
						+ " values (member_seq.nextval, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				// sql 문이 미완성이라면 여기서 완성
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getAddr());
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
			String sql = "delete from member"
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
