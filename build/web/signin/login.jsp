

<%@page  import="java.sql.ResultSet,java.sql.Connection" %>
<%@page  import="java.sql.PreparedStatement,java.sql.DriverManager" %>
<%@page import="java.sql.*,java.util.*"%>

<%
    
            String email=request.getParameter("email");
            String password=request.getParameter("pass");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/tourism_user?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "secret");
        PreparedStatement ps=conn.prepareStatement("select * from user where email=? and password=?");
        ps.setString(1, email);
        ps.setString(2,password);
        ResultSet rs= ps.executeQuery();
        
        
        
        if(rs.next())
        {
           if (email.equals("samyakjain0888@gmail.com")){
               response.sendRedirect("../Admin/index.jsp");
           }
           else{
               Statement st=conn.createStatement();
               String sql ="select name from user where email=email";
               ResultSet rs2= st.executeQuery(sql);
               session.setAttribute("name", rs2);
            response.sendRedirect("../");
        }}
        else
        {
            response.sendRedirect("signin.html");
        }
%>