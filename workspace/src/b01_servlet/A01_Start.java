package b01_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A01_Start
 */
@WebServlet(name = "start.do", urlPatterns = { "/start.do" })
public class A01_Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_Start() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// request : 클라이언트의 요청을 처리
		// response : 클라이언트의 요청 결과를 처리..
		// client에 특정한 화면을 전송하기 위한 객체.
		PrintWriter out = response.getWriter();
		String name = "hellow";
		out.print("<html><body><h2>show</h2><h2>"+name+"</h2><body></html>");
		// servlet은 html코드와 자바코드를 이와같이 혼합하여, 최종 결과 html을 client에 전달해준다.
	}
}
