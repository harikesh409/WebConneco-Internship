package users;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//@WebServlet("\register") //Did manual config in web.xml
@SuppressWarnings("serial")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class Registration extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("In post");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass1");
		String cpass = request.getParameter("pass2");
		String email = request.getParameter("email");
		InputStream inputStream = null;
		Part filePart = request.getPart("propic");
		if (filePart != null) {
//			Debug statements
//			System.out.println(filePart.getName());
//			System.out.println(filePart.getSize());
//			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		Connection con = null;
		String msg = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			if (pass.equals(cpass)) {
				PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?)");
				ps.setString(1, uname);
				ps.setString(2, pass);
				ps.setString(3, email);
				if (inputStream != null) {
					ps.setBlob(4, inputStream);
				}
				int i = ps.executeUpdate();
				if (i == 1) {
					msg = "You are Successfully registered";
				}
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		request.setAttribute("Message", msg);
		getServletContext().getRequestDispatcher("/Message.jsp").forward(request, resp);
//		super.doPost(request, resp);
	}

}
