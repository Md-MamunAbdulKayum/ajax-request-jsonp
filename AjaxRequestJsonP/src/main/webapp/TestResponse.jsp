<%-- 
    Document   : TestResponse
    Created on : Feb 13, 2018, 4:01:57 PM
    Author     : Mamun
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%
    System.out.println("Called jsp");
    Map<String, String> userDataMap = new HashMap<String, String>();
 
    String username = "Md Mamun Abdul Kayum";
    userDataMap.put("username", username);
    userDataMap.put("id", "1004058001");
    userDataMap.put("City", "Mymensingh");
    userDataMap.put("Country", "Bangladesh");
    System.out.println(username);

    if (userDataMap != null && !userDataMap.isEmpty()) {
        Gson gson = new Gson();
        String jsonArray = "";
        jsonArray = gson.toJson(userDataMap);
        System.out.println("Array: " + jsonArray);
        String jsonP = "callackFunction(" + jsonArray + ")";
        if (jsonArray != null) {
            response.setHeader("Access-Control-Allow-Origin:", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET, POST,PUT");
            //response.setContentType("application/json");
            response.setContentType("application/javascript");
            response.getWriter().write(jsonP);
        }

    }
%>
