package spring.utility.blog;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class Utility {
	 
	public static void deleteFile(String upDir, String oldfile) {
		// TODO Auto-generated method stub
		File file = new File(upDir,oldfile);
		if(file.exists()) {
			file.delete();
		}
	}
	 /** 
     * 占쎈솁占쎌뵬占쎈씜嚥≪뮆諭� 筌ｌ꼶�봺(model1,mvc) 
     * @param fileItem 
     * @param upDir 
     * @return 
     */ 

	
    public static String saveFileSpring30(MultipartFile multipartFile, String basePath) { 
        // input form's parameter name 
        String fileName = ""; 
        // original file name 
        String originalFileName = multipartFile.getOriginalFilename(); 
        // file content type 
        String contentType = multipartFile.getContentType(); 
        // file size 
        long fileSize = multipartFile.getSize(); 
         
        System.out.println("fileSize: " + fileSize); 
        System.out.println("originalFileName: " + originalFileName); 
         
        InputStream inputStream = null; 
        OutputStream outputStream = null; 
 
        try { 
            if( fileSize > 0 ) { // 占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈립占쎈뼄筌롳옙 
                // 占쎌뵥占쎈�� 占쎈뮞占쎈뱜�뵳�눘�뱽 占쎈섯占쎈뮉占쎈뼄. 
                inputStream = multipartFile.getInputStream(); 
 
                File oldfile = new File(basePath, originalFileName); 
             
                if ( oldfile.exists()){ 
                    for(int k=0; true; k++){ 
                        //占쎈솁占쎌뵬筌륅옙 餓λ쵎�궗占쎌뱽 占쎈돗占쎈릭疫뀐옙 占쎌맄占쎈립 占쎌뵬占쎌졃 甕곕뜇�깈�몴占� 占쎄문占쎄쉐占쎈릭占쎈연 
                        //占쎈솁占쎌뵬筌뤿굞�몵嚥∽옙 鈺곌퀬鍮� 
                        oldfile = new File(basePath,"("+k+")"+originalFileName);  
                     
                        //鈺곌퀬鍮�占쎈쭆 占쎈솁占쎌뵬筌뤿굞�뵠 鈺곕똻�삺占쎈릭筌욑옙 占쎈륫占쎈뮉占쎈뼄筌롳옙, 占쎌뵬占쎌졃甕곕뜇�깈揶쏉옙 
                        //�겫�늿占� 占쎈솁占쎌뵬筌륅옙 占쎈뼄占쎈뻻 占쎄문占쎄쉐 
                        if(!oldfile.exists()){ //鈺곕똻�삺占쎈릭筌욑옙 占쎈륫占쎈뮉 野껋럩�뒭 
                            fileName = "("+k+")"+originalFileName; 
                            break; 
                        } 
                    } 
                }else{ 
                    fileName = originalFileName; 
                } 
                //make server full path to save 
                String serverFullPath = basePath + "\\" + fileName; 
                 
                System.out.println("fileName: " + fileName); 
                System.out.println("serverFullPath: " + serverFullPath); 
                 
                outputStream = new FileOutputStream( serverFullPath ); 
  
                // 甕곌쑵�쓠�몴占� 筌띾슢諭븝옙�뼄. 
                int readBytes = 0; 
                byte[] buffer = new byte[8192]; 
 
                while((readBytes = inputStream.read(buffer, 0, 8192)) != -1 ) { 
                    outputStream.write( buffer, 0, readBytes ); 
                } 
                outputStream.close(); 
                inputStream.close(); 
                         
            } 
 
        } catch(Exception e) { 
            e.printStackTrace();   
        }finally{ 
             
        } 
         
        return fileName; 
    } 
	
	 public static String paging2(String url,int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
		   int pagePerBlock = 10; // �뇡遺얠쑏占쎈뼣 占쎈읂占쎌뵠筌욑옙 占쎈땾 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 占쎌읈筌ｏ옙 占쎈읂占쎌뵠筌욑옙  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 占쎌읈筌ｏ옙 域밸챶竊� 
		   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 占쎌겱占쎌삺 域밸챶竊� 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� 占쎈뻻占쎌삂  
		   int endPage = (nowGrp * pagePerBlock);             // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� �넫�굝利�   
		    
		   StringBuffer str = new StringBuffer(); 
		    
		   str.append("<style type='text/css'>"); 
		   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
		   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
		   str.append("  .span_box_1{"); 
		   str.append("    text-align: center;");    
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
		   str.append("  }"); 
		   str.append("  .span_box_2{"); 
		   str.append("    text-align: center;");    
		   str.append("    background-color: #668db4;"); 
		   str.append("    color: #FFFFFF;"); 
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
		   str.append("  }"); 
		   str.append("</style>"); 
		   str.append("<DIV id='paging'>"); 
//		     str.append("占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙: " + nowPage + " / " + totalPage + "  "); 
		 
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10揶쏉옙 占쎌뵠占쎌읈 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
		   if (nowGrp >= 2){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎌뵠占쎌읈</A></span>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nowPage == i){ 
		       str.append("<span class='span_box_2'>"+i+"</span>"); 
		     }else{ 
		       str.append("<span class='span_box_1'><A href='./"+url+"?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
		     } 
		   } 
		    
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10揶쏉옙 占쎈뼄占쎌벉 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
		   if (nowGrp < totalGrp){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎈뼄占쎌벉</A></span>"); 
		   } 
		   str.append("</DIV>"); 
		    
		   return str.toString(); 
		 } 
		 
	
	public static String getCodeValue(String code){
		String value=null;
		Hashtable codes=new Hashtable();
		codes.put("A01","占쎌돳占쎄텢占쎌뜚");
		codes.put("A02","占쎌읈占쎄텦�꽴占쏙옙�졃筌욑옙");
		codes.put("A03","占쎈염�뤃怨쀬읈�눧占�");
		codes.put("A04","占쎈린占쎄문");
		codes.put("A05","占쎌쁽占쎌겫占쎈씜");
		codes.put("A06","�⑤벉龜占쎌뜚");
		codes.put("A07","�꽴��窺");
		codes.put("A08","占쎌벥�뙴�슣�뵥");
		codes.put("A09","甕곕벡�쒙옙�뵥");
		codes.put("A10","椰꾧퀣�뵥");
		value=(String)codes.get(code);		
		return value;
	}
	/** 
	  * SPAN占쎄묶域밸챶占쏙옙 占쎌뵠占쎌뒠占쎈립 獄쏅벡�뮞 筌뤴뫀�쑞占쎌벥 筌욑옙占쎌뜚, 1 占쎈읂占쎌뵠筌욑옙�겫占쏙옙苑� 占쎈뻻占쎌삂 
	  * 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙: 11 / 22   [占쎌뵠占쎌읈] 11 12 13 14 15 16 17 18 19 20 [占쎈뼄占쎌벉] 
	  *  
	  * @param totalRecord 占쎌읈筌ｏ옙 占쎌쟿�굜遺얜굡占쎈땾 
	  * @param nowPage     占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 
	  * @param recordPerPage 占쎈읂占쎌뵠筌욑옙占쎈뼣 占쎌쟿�굜遺얜굡 占쎈땾  
	  * @param col 野껓옙占쎄퉳 �뚎됱쓥  
	  * @param word 野껓옙占쎄퉳占쎈선
	  * @return 占쎈읂占쎌뵠筌욑옙 占쎄문占쎄쉐 �눧紐꾩쁽占쎈였
	  */ 
	 public static String paging3(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 10; // �뇡遺얠쑏占쎈뼣 占쎈읂占쎌뵠筌욑옙 占쎈땾 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 占쎌읈筌ｏ옙 占쎈읂占쎌뵠筌욑옙  
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 占쎌읈筌ｏ옙 域밸챶竊� 
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 占쎌겱占쎌삺 域밸챶竊� 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� 占쎈뻻占쎌삂  
	   int endPage = (nowGrp * pagePerBlock);             // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� �넫�굝利�   
	    
	   StringBuffer str = new StringBuffer(); 
	    
	   str.append("<style type='text/css'>"); 
	   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
	   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
	   str.append("  .span_box_1{"); 
	   str.append("    text-align: center;");    
	   str.append("    font-size: 1em;"); 
	   str.append("    border: 1px;"); 
	   str.append("    border-style: solid;"); 
	   str.append("    border-color: #cccccc;"); 
	   str.append("    padding:1px 6px 1px 6px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
	   str.append("    margin:1px 2px 1px 2px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
	   str.append("  }"); 
	   str.append("  .span_box_2{"); 
	   str.append("    text-align: center;");    
	   str.append("    background-color: #668db4;"); 
	   str.append("    color: #FFFFFF;"); 
	   str.append("    font-size: 1em;"); 
	   str.append("    border: 1px;"); 
	   str.append("    border-style: solid;"); 
	   str.append("    border-color: #cccccc;"); 
	   str.append("    padding:1px 6px 1px 6px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
	   str.append("    margin:1px 2px 1px 2px; /*占쎌맄, 占쎌궎�몴紐꾠걹, 占쎈툡占쎌삋, 占쎌뇢筌잞옙*/"); 
	   str.append("  }"); 
	   str.append("</style>"); 
	   str.append("<DIV id='paging'>"); 
//	     str.append("占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙: " + nowPage + " / " + totalPage + "  "); 
	 
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10揶쏉옙 占쎌뵠占쎌읈 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
	   if (nowGrp >= 2){ 
	     str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎌뵠占쎌읈</A></span>"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ 
	       str.append("<span class='span_box_2'>"+i+"</span>"); 
	     }else{ 
	       str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
	     } 
	   } 
	    
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10揶쏉옙 占쎈뼄占쎌벉 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
	   if (nowGrp < totalGrp){ 
	     str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎈뼄占쎌벉</A></span>"); 
	   } 
	   str.append("</DIV>"); 
	    
	   return str.toString(); 
	 } 
	 
	 
	 
	/** 
	  * 占쎈떭占쎌쁽 占쎌굨占쎄묶占쎌벥 占쎈읂占쎌뵠筌욑옙, 1 占쎈읂占쎌뵠筌욑옙�겫占쏙옙苑� 占쎈뻻占쎌삂 
	  * 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙: 11 / 22   [占쎌뵠占쎌읈] 11 12 13 14 15 16 17 18 19 20 [占쎈뼄占쎌벉] 
	  *  
	  * @param totalRecord 占쎌읈筌ｏ옙 占쎌쟿�굜遺얜굡占쎈땾 
	  * @param nowPage     占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 
	  * @param recordPerPage 占쎈읂占쎌뵠筌욑옙占쎈뼣 �빊�뮆�젾占쎈막 占쎌쟿�굜遺얜굡 占쎈땾
	  * @param col 野껓옙占쎄퉳 �뚎됱쓥  
	  * @param word 野껓옙占쎄퉳占쎈선
	  * @return 占쎈읂占쎌뵠筌욑옙 占쎄문占쎄쉐 �눧紐꾩쁽占쎈였
	  */ 
	 public static String paging(int totalRecord, int nPage, int recordPerPage,String url,int bbsno,int nowPage, String col, String word){ 
		   int pagePerBlock = 10; // 釉붾윮�떦 �럹�씠吏� �닔 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // �쟾泥� �럹�씠吏�  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// �쟾泥� 洹몃９ 
		   int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // �쁽�옱 洹몃９ 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // �듅�젙 洹몃９�쓽 �럹�씠吏� 紐⑸줉 �떆�옉  
		   int endPage = (nowGrp * pagePerBlock);             // �듅�젙 洹몃９�쓽 �럹�씠吏� 紐⑸줉 醫낅즺   
		    
		   StringBuffer str = new StringBuffer(); 
		    
		   str.append("<style type='text/css'>"); 
		   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
		   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
		   str.append("  .span_box_1{"); 
		   str.append("    text-align: center;");    
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
		   str.append("  }"); 
		   str.append("  .span_box_2{"); 
		   str.append("    text-align: center;");    
		   str.append("    background-color: #668db4;"); 
		   str.append("    color: #FFFFFF;"); 
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
		   str.append("  }"); 
		   str.append("</style>"); 
		   str.append("<DIV id='paging'>"); 
//		     str.append("�쁽�옱 �럹�씠吏�: " + nowPage + " / " + totalPage + "  "); 
		 
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10媛� �씠�쟾 �럹�씠吏�濡� �씠�룞 
		   if (nowGrp >= 2){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>�씠�쟾</A></span>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nPage == i){ 
		       str.append("<span class='span_box_2'>"+i+"</span>"); 
		     }else{ 
		       str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+i+"'>"+i+"</A></span>");   
		     } 
		   } 
		    
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10媛� �떎�쓬 �럹�씠吏�濡� �씠�룞 
		   if (nowGrp < totalGrp){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>�떎�쓬</A></span>"); 
		   } 
		   str.append("</DIV>"); 
		    
		   return str.toString(); 
		 } 
	 public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 10; // �뇡遺얠쑏占쎈뼣 占쎈읂占쎌뵠筌욑옙 占쎈땾 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage));// 占쎌읈筌ｏ옙 占쎈읂占쎌뵠筌욑옙  
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 占쎌읈筌ｏ옙 域밸챶竊� 
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 占쎌겱占쎌삺 域밸챶竊� 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� 占쎈뻻占쎌삂  
	   int endPage = (nowGrp * pagePerBlock);             // 占쎈뱟占쎌젟 域밸챶竊숋옙�벥 占쎈읂占쎌뵠筌욑옙 筌뤴뫖以� �넫�굝利�   
	    
	   StringBuffer str = new StringBuffer(); 
	    
	   str.append("<style type='text/css'>"); 
	   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
	   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
	   str.append("</style>"); 
	   str.append("<DIV id='paging'>"); 
	   str.append("占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙: " + nowPage + " / " + totalPage + "  "); 
	 
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10揶쏉옙 占쎌뵠占쎌읈 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
	   if (nowGrp >= 2){ 
	     str.append("[<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎌뵠占쎌읈</A>]"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ // 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙占쎌뵠筌롳옙 揶쏅벡�� 占쎌뒞�⑨옙 
	       str.append("<span style='font-size: 1.2em; font-weight: bold;'>"+i+"</span> ");   
	     }else{ 
	       str.append("<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A> "); 
	     } 
	      
	   } 
	    
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10揶쏉옙 占쎈뼄占쎌벉 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗 
	   if (nowGrp < totalGrp){ 
	     str.append("[<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>占쎈뼄占쎌벉</A>]"); 
	   } 
	   str.append("</DIV>"); 
	    
	   return str.toString(); 
	 } 

	
	
	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}

		return str;
	}// end checkNull
	   public static List<String> getDay(){
	        List<String> list = new ArrayList<String>();
	        
	        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar cal = Calendar.getInstance();
	        for(int j = 0; j < 3; j++){
	            list.add(sd.format(cal.getTime()));
	            cal.add(Calendar.DATE, -1);
	        }
	        
	        return list;
	    }
	    /**
	     * 占쎈쾻嚥≪빖沅뉛쭪�뮇占� 占쎌궎占쎈뮎,占쎈선占쎌젫,域밸챷�젫占쎄텊筌욎뮇占� �뜮袁㏉꺍
	     * @param wdate - 占쎈쾻嚥≪빖沅뉛쭪占�
	     * @return - true:占쎌궎占쎈뮎,占쎈선占쎌젫,域밸챷�젫餓ο옙 占쎈쾻嚥≪빖沅뉛쭪�뮇占� 揶쏆늿�벉
	     *           false:占쎌궎占쎈뮎,占쎈선占쎌젫,域밸챷�젫 占쎄텊筌욎뮄占� 占쎈쾻嚥≪빖沅뉛쭪�뮇占� 占쎈뼄 占쎈뼄�뵳占�
	     */
	    public static boolean compareDay(String wdate){
	        boolean flag = false;
	        List<String> list = getDay();
	        if(wdate.equals(list.get(0)) 
	           || wdate.equals(list.get(1))
	           || wdate.equals(list.get(2))){
	            flag = true;
	        }
	          
	        return flag;
	    }
		public static String paging2(String string, int total, int nowPage, int recordPerPage) {
			// TODO Auto-generated method stub
			return null;
		}

	
	
}// end class Utility
