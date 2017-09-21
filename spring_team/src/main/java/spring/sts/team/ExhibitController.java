package spring.sts.team;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.exhibit.ExhibitDAO;
import spring.model.exhibit.ExhibitDTO;

import spring.utility.blog.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExhibitController {
	
	@Autowired
	private ExhibitDAO dao;

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/exhibit/list", method = RequestMethod.GET)
	public String ex_list(HttpServletRequest request) {	

		
		return "exhibit/list.tiles";
	}	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/exhibit/read", method = RequestMethod.GET)
	public String ex_read(HttpServletRequest request) {	
		
		
		return "exhibit/read.tiles";
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/work/read", method = RequestMethod.GET)
	public String work_read(HttpServletRequest request) {	
		
		
		return "work/read.tiles";
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/work/list", method = RequestMethod.GET)
	public String work_list(HttpServletRequest request) {	

		
		return "work/list.tiles";
	}	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/work/list", method = RequestMethod.GET)
	public String work_list(HttpServletRequest request) {	

		
		return "work/list.tiles";
	}	
	
}
