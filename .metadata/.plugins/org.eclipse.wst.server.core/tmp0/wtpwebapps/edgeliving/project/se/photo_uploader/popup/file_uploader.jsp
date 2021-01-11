<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
 
<%
String return1="";
String return2="";
String return3="";
String name = "";
//멀티파트컨텐츠로 요청이 온것이라면 
if (ServletFileUpload.isMultipartContent(request)){
    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
 // 인코딩 : 한글처리 
    uploadHandler.setHeaderEncoding("UTF-8");
    List<FileItem> items = uploadHandler.parseRequest(request);
    for (FileItem item : items) {
        if(item.getFieldName().equals("callback")) {
            return1 = item.getString("UTF-8");
        } else if(item.getFieldName().equals("callback_func")) {
            return2 = "?callback_func="+item.getString("UTF-8");
        } else if(item.getFieldName().equals("Filedata")) {
        	// 파일의 크기가 0 초과라면 , 즉 빈파일이 아니면 
            if(item.getSize() > 0) {
            	// 파일명 구하기 
                name = item.getName().substring(item.getName().lastIndexOf(File.separator)+1);
            	// 파일의 확장자
                String fileExt = name.substring(name.lastIndexOf(".")+1);
             // 파일확장자를 소문자로 
                fileExt = fileExt.toLowerCase();
             // 이미지 확장자 배열
                String[] allow_file = {"jpg","png","bmp","gif"};
                int cnt = 0;
                for(int i=0; i<allow_file.length; i++) {
                    if(fileExt.equals(allow_file[i])){
                        cnt++;
                    }
                }
             // cnt 가 0이면 이미지 파일이 아님 
                if(cnt == 0) {
                    return3 = "&errstr="+name;
                } else {
                	// cnt 가 1이면 이미지 파일 
                	
                    // 파일 기본경로 
					String path = request.getRealPath("/upload");
                    //파일 기본경로 _ 상세경로
                    //String filePath = dftFilePath + "SE2" + File.separator +"upload" + File.separator;
                     
                    File file = null;
                    file = new File(path);
                 // 만약 존재하지 않으면 디렉토리 생성 
                    if(!file.exists()) {
                        file.mkdirs();
                    }
                     
                 // 저장할파일명  = 파일명 + 시간 + . +  확장자
                    String realFileName = "";
					Date d = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String time = sdf.format(d);
					
					// 저장할파일명  = 파일명 + 시간 + . +  확장자 

					realFileName = name + time + "." + fileExt;
					
                    String rlFileNm = path + "/" + realFileName;
                    ///////////////// 서버에 파일쓰기 /////////////////
                    
                    
					
                    InputStream is = item.getInputStream();
                    OutputStream os=new FileOutputStream(rlFileNm);
                    
                    // 요청객체의 헤더에서 파일의 사이즈를 알아온다. 
					// 사이즈를 숫자형으로 바꾼다.
					// 크기에 맞는 byte[] 배열을 선언한다.
                    int numRead;
                    byte b[] = new byte[(int)item.getSize()];
                 // 1byte 씩 읽어서 파일에 저장한다.
                    while((numRead = is.read(b,0,b.length)) != -1){
                        os.write(b,0,numRead);
                    }
                    
                    // 자원 반납 
                 	if(is != null) is.close();
                    os.flush();
                    os.close();
                    
                    
                    return3 += "&bNewLine=true";
                    return3 += "&sFileName="+ name;
                    return3 += "&sFileURL=../../upload/"+realFileName;
                }
            }else {
                  return3 += "&errstr=error";
            }
        }
    }
}
response.sendRedirect(return1+return2+return3);
 
%>
