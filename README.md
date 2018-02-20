# ajax-request-jsonp
JSONP is a method for sending JSON data without worrying about cross-domain issues in case of Ajax Request.


Ajax request:

var responseJsonp = "";
window.callackFunction = function (data) {
    alert(data);
    responseJsonp += JSON.stringify(data);
    alert("jsonp: " + responseJsonp);
    // do something
};


function getData() {
 var responseJsonp = "";
    $.ajax({
        type: "GET",
        url: "./TestResponse.jsp",
        dataType: "jsonp",
        jsonpCallback: "callackFunction",
        crossOrigin: true,
        async: false,
        success: function (data) {
               
        },
        error: function (xhr, status, error) {
            console.log("xhr: " + xhr);
            console.log("status: " + status);
            console.log("error: " + error);
            alert("Failed");
        }
    });

}


Here used json responder jsp file:

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
