<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
 
<%
    //파일정보를 담기 위한 변수 선언 
    String sFileInfo = "";
    //요청 객체 헤더에서 파일명을 가져온다.
    String filename = request.getHeader("file-name");
    //파일 확장자
    String fileExt = filename.substring(filename.lastIndexOf(".") + 1);
    //확장자를소문자로 변경
    fileExt = fileExt.toLowerCase();
 
    //이미지 파일의 확장자 :  배열변수
    String[] allow_file = { "jpg", "png", "bmp", "gif" };
 
    //반복문 돌리면서 확장자가 이미지인지 체크 
    int cnt = 0;
    for (int i = 0; i < allow_file.length; i++) {
        if (fileExt.equals(allow_file[i])) {
            cnt++;
        }
    }
 
    //이미지가 아닐경우 
    if (cnt == 0) {
        out.println("NOTALLOW_" + filename);
    } else {
        //이미지이므로 신규 파일로 디렉토리 설정 및 업로드   

        //파일 기본경로
        String filePath = request.getRealPath("/upload");
        
        //String filePath ="http://192.168.0.4/edgeliving/upload";
        File file = new File(filePath);
        
        // 존재하지 않으면 
        if (!file.exists()) {
        	// 디렉토리 생성
            file.mkdirs();
        }
        // 실제 파일의 이름을 저장할 변수 선언 
        String realFileNm = "";
        // 날짜 포맷 객체 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        // 오늘날짜 데이터 
        Date d = new Date();
        // 형식포맷을 적용한 오늘날짜 
        String time = sdf.format(d);
        //파일명 = 시간+파일명
        realFileNm = time + filename.substring(filename.lastIndexOf("."));
        // 진짜 파일이 있는 위치 : 파일경로 + 파일명
        String rlFileNm = filePath+"/" + realFileNm;
        
        // 서버에 파일쓰기  
        InputStream is = request.getInputStream();
        OutputStream os = new FileOutputStream(rlFileNm);
        int numRead;
  		// 파일 사이즈만큼의 byte[]을 선언
        byte[] b = new byte[Integer.parseInt(request.getHeader("file-size"))];
  		// 1byte씩 읽어서 
        while ((numRead = is.read(b, 0, b.length)) != -1) {
        	// 파일에 쓴다.
            os.write(b, 0, numRead);
        }
  		// 자원반납
        if (is != null) {
            is.close();
        }
        os.flush();
        os.close();
        
        // Ajax형태로 데이터를 가져가므로 출력을 위한 
        // 파일경로를 만든다.
        sFileInfo += "&bNewLine=true";    
        sFileInfo += "&sFileName=" + filename;    
//        sFileInfo += "&sFileURL=../upload/"+realFileNm;
        sFileInfo += "&sFileURL=/edgeliving/upload/"+realFileNm;
       // sFileInfo += "&sFileURL=http://192.168.0.4/edgeliving/upload/"+realFileNm;
        
        System.out.println(sFileInfo);
      
        // 파일의 path : ../upload/"+realFileNm 
        // 
        out.println(sFileInfo);
    }
%>
