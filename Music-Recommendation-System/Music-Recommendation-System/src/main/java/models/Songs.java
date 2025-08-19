package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.web.multipart.MultipartFile;

import beans.GetConnection;

public class Songs {
	private String userid,emotions,yearOfRelease,singers;
	public String getSingers() {
		return singers;
	}
	public void setSingers(String singers) {
		this.singers = singers;
	}
	private String title;
	private String mainCate;
	private String category;
	private String desc;
	private String angry,disgust,fear,sad,surprise,neutral;
	private String happy;
	private String song_type;
	private String singer_type;
	private String movie;
	private String musicdir;
	private String videoLink;
	private String audioLink;
	 
	
	 
public String getYearOfRelease() {
		return yearOfRelease;
	}
	public void setYearOfRelease(String yearOfRelease) {
		this.yearOfRelease = yearOfRelease;
	}
public String getEmotions() {
		return emotions;
	}
	public void setEmotions(String emotions) {
		this.emotions = emotions;
	}
public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMainCate() {
		return mainCate;
	}
	public void setMainCate(String mainCate) {
		this.mainCate = mainCate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getAngry() {
		return angry;
	}
	public void setAngry(String angry) {
		this.angry = angry;
	}
	public String getDisgust() {
		return disgust;
	}
	public void setDisgust(String disgust) {
		this.disgust = disgust;
	}
	public String getFear() {
		return fear;
	}
	public void setFear(String fear) {
		this.fear = fear;
	}
	public String getSad() {
		return sad;
	}
	public void setSad(String sad) {
		this.sad = sad;
	}
	public String getSurprise() {
		return surprise;
	}
	public void setSurprise(String surprise) {
		this.surprise = surprise;
	}
	public String getNeutral() {
		return neutral;
	}
	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}
	public String getHappy() {
		return happy;
	}
	public void setHappy(String happy) {
		this.happy = happy;
	}
	public String getSong_type() {
		return song_type;
	}
	public void setSong_type(String song_type) {
		this.song_type = song_type;
	}
	public String getSinger_type() {
		return singer_type;
	}
	public void setSinger_type(String singer_type) {
		this.singer_type = singer_type;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getMusicdir() {
		return musicdir;
	}
	public void setMusicdir(String musicdir) {
		this.musicdir = musicdir;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public String getAudioLink() {
		return audioLink;
	}
	public void setAudioLink(String audioLink) {
		this.audioLink = audioLink;
	}
public List<Songs> getSongs(){
		
		GetConnection gc = new GetConnection();
		Connection con;
		List<Songs> lst = new ArrayList<Songs>();
		 
		ResultSet rs;
		
		try {
		
		con= gc.getConnection();
		Statement st=con.createStatement();
		rs=st.executeQuery("select * from songs limit 200");
		Songs vs;
		 
		while(rs.next()) {
			
			vs= new Songs();
			vs.setTitle(rs.getString("title"));
			vs.setMainCate(rs.getString("mainCategory"));
			vs.setCategory(rs.getString("category"));
			vs.setEmotions(rs.getString("related_emotions"));
			vs.setMovie(rs.getString("Movie"));
			vs.setSinger_type(rs.getString("Singer_type"));
			vs.setSong_type(rs.getString("song_type"));
			vs.setSingers(rs.getString("Singers"));
			vs.setVideoLink(rs.getString("Youtube_link"));
			vs.setAudioLink(rs.getString("Audio_Link"));
			vs.setMusicdir(rs.getString("Music_director"));
			vs.setYearOfRelease(rs.getString("Year_of_release"));
			vs.setMovie(rs.getString("Movie"));
			vs.setDesc(rs.getString("song_desc"));
			lst.add(vs);
		}
		try
		{
			con.close();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return(lst);
	}  
	public String addNewSong()
	{
		GetConnection gc = new GetConnection();
		int y=0;
		JavaFuns jf=new JavaFuns();
		Vector v=jf.getValue("select ifnull(max(songId),1000)+1 as id from songs", 1);
		
		int songid=Integer.parseInt(v.elementAt(0).toString().trim());
	
		Connection con;
		String st="";
		try {
		con=gc.getConnection();
		PreparedStatement pst;
		
		pst=con.prepareStatement("insert into songs2 values(?,?,?,?,?,?,?,?,?,?,?,?,?);");
		
		pst.setInt(1,songid);
		pst.setString(2,title);
		pst.setString(3,mainCate);
		pst.setString(4,category);
		 
		pst.setString(5,emotions);
		pst.setString(6,song_type);
		pst.setString(7,movie);
		pst.setString(8,yearOfRelease);
		pst.setString(9,musicdir);
		pst.setString(10,singer_type);
		pst.setString(11,singers);
		pst.setString(12,videoLink);
		pst.setString(13,audioLink);
		int x=pst.executeUpdate();
		
		if(x>0) {
			
			st="success";
		}
		else
			st="failure";
		
		 
		try
		{
			con.close();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return st;
		
		
	}
	 
}
