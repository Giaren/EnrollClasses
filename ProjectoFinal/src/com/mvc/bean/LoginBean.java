package com.mvc.bean;
 
public class LoginBean
{
     private String ssn;
     private String courseID;
 
    public String getSSN() {
        return ssn;
     }
    public void setSSN(String ssn) {
        this.ssn = ssn;
     }
    public String getCourseID() {
        return courseID;
     }
    public void setCourseID(String courseID) {
        this.courseID = courseID;
        System.out.println(courseID);
     }

}