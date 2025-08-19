package com.music.recommender;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
 
import models.CheckUser; 
import models.JavaFuns; 
import models.Pass;
import models.PasswordRecovery;
import models.Songs;
import models.Users; 
 
@Controller
public class MusicController implements ErrorController{
	@RequestMapping("/home")
	public String index()
	{
		return "index.jsp";
	}
	@RequestMapping("/Cities")
	public String cities()
	{
		return "Cities.jsp";
	} 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
        session.invalidate();
		return "Logout.jsp";
	}
	@RequestMapping("/regOffice")
	public String registration()
	{
		return "Register.jsp";
	}
	
	@RequestMapping("/user")
	public String student()
	{
		return "User.jsp";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,HttpSession ses)
	{
		JavaFuns jf=new JavaFuns();
		String qr="delete from preferences where id="+request.getParameter("id").trim();
		if(jf.execute(qr)) {}
		return "mypreferences.jsp";
	}
	@RequestMapping("/pref")
	public String pref(HttpServletRequest request,HttpSession ses)
	{
		String singer=request.getParameter("singer").trim();
		String category=request.getParameter("category").trim();
		String director=request.getParameter("director").trim();
		String song=request.getParameter("song").trim();
		String qr="insert into preferences(userid,singer,category,music_director) values('"+ses.getAttribute("userid").toString().trim()+"','"+singer+"','"+category+"','"+director+"')";
		JavaFuns jf=new JavaFuns();
		if(jf.execute(qr)) {}
		return "forword.jsp?song="+song;
	}
	@RequestMapping("/admin")
	public String admin()
	{
		return "Admin.jsp";
	}
	 @RequestMapping("/error")
    public String handleError() {
        //do something like logging
		return "home";
    }
  
    public String getErrorPath() {
        return "/error";
    }
    @RequestMapping("/check")
	public String check(CheckUser cu,HttpServletRequest request) {
		
		String st=cu.checkUser(request);
		
		return st;
	}	  
     
     
	@RequestMapping("/viewUsers")
	@SessionScope
	public ModelAndView viewUsers() {
		
		List<Users> lst = new ArrayList<Users>();
		Users vs = new Users();
		lst=vs.getStudentReport();
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("ViewUsersReport.jsp");
		return mv;
	}
	@RequestMapping("/RegSongs")
	public ModelAndView RegSongs(Songs stu,ServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		 
		 try {
			  String[] emotions=request.getParameterValues("emotion") ;
			 
			   System.out.println("emotion="+Arrays.toString(emotions));
			  String emotions1=Arrays.toString(emotions);
			  emotions1=emotions1.replace("[", "");
			  emotions1=emotions1.replace("]", "");
			  stu.setEmotions(emotions1);
			 String st=stu.addNewSong();
				if(st.equals("success"))
					mv.setViewName("Success.jsp");
				else
					mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 mv.setViewName("Failure.jsp");
		} 
		 mv.addObject("activity","SongReg");
		 return mv;
		
	}
	@RequestMapping("/registeruser")
	public ModelAndView registeruser(Users stu,ServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		 
		 try {
			  
			  stu.setPath("NA");
			 String st=stu.addNewUser();
				if(st.equals("success"))
					mv.setViewName("Success.jsp");
				else
					mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 mv.setViewName("Failure.jsp");
		} 
		 mv.addObject("activity","UserReg");
		 return mv;
		
	}@RequestMapping("/FromPython")
	public ModelAndView FromPython(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		 mv.setViewName("ViewSongs.jsp"); 
		 mv.addObject("activity","emotion");
		 JavaFuns jf=new JavaFuns();
		 String eid="";
		 String userid=request.getParameter("userid").toString().trim();
		 String qr="select emotion1 from getfinalemotions where  eid=(select eid from emotions where userid='"+userid+"' order by eid desc limit 1) and cnt=(select max(cnt) from getfinalemotions where eid=(select eid from emotions where userid='"+userid+"' order by eid desc limit 1)) limit 1";
		 Vector v=jf.getValue(qr, 1);
		 mv.addObject("emotion",v.elementAt(0).toString().trim());
		 return mv;
		
	}
	 
	 
	@RequestMapping("/forgetpassword")
	public String forgetpassword() {
		
		return("ForgetPassword.jsp");
	}
	@RequestMapping("/recoverpassword")
	public String recoverpassword(PasswordRecovery pr) {
		
		String sts=pr.getNewPassword();
		
		return(sts);
	}
	@RequestMapping("/ChangePass")
	public String ChangePass()
	{
		return "ChangePass.jsp";
	}
	@RequestMapping("/ChangePassService")
	public ModelAndView ChangePassService(Pass eobj,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		 try
		 {
			 
			 eobj.setUserid(ses.getAttribute("userid").toString().trim());
			 if(eobj.changePassword())
			 { 
				 mv.setViewName("Success.jsp");
			 }
			 else
			 { 
				 mv.setViewName("Failure.jsp");
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
		}
		 mv.addObject("activity","changePass");
		 return mv;
		 
	}

	 

}
 
