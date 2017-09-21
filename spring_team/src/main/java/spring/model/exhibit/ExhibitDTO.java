package spring.model.exhibit;

import org.springframework.web.multipart.MultipartFile;

public class ExhibitDTO {
		private int exhibitno;
		private String title;
		private String location;
		private String timeend;
		private String time;
		private String content;
		private MultipartFile fnamemain;
		private MultipartFile fnameview;
		
		
		
		public String getTimeend() {
			return timeend;
		}
		public void setTimeend(String timeend) {
			this.timeend = timeend;
		}
		public int getExhibitno() {
			return exhibitno;
		}
		public void setExhibitno(int exhibitno) {
			this.exhibitno = exhibitno;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public MultipartFile getFnamemain() {
			return fnamemain;
		}
		public void setFnamemain(MultipartFile fnamemain) {
			this.fnamemain = fnamemain;
		}
		public MultipartFile getFnameview() {
			return fnameview;
		}
		public void setFnameview(MultipartFile fnameview) {
			this.fnameview = fnameview;
		}
		
	
	

}
