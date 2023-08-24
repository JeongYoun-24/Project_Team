package ysac.manager_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.manager_board.service.Manager_BoardService;
import ysac.util.ConnectionOracleUtil;

@WebServlet("/m_boardInsert")
public class Manager_BoardInsertController extends HttpServlet{

	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img";
	
	Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	private Manager_BoardMapper manager_BoardMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	String nextPage = null;
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		manager_BoardMapper = session.getMapper(Manager_BoardMapper.class);
		
		manager_BoardMapper.getmanager_board();
		
		
		
		nextPage ="/project/m_boardform.jsp";
		resp.sendRedirect(req.getContextPath()+ nextPage);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		manager_BoardMapper = session.getMapper(Manager_BoardMapper.class);
		
		
		
		Manager_BoardDTO dto = new Manager_BoardDTO();
		
		
		
		
		// 업로드 기능 있을때 호출
		Map<String, String> articleMap = upload(req, resp);// 업로드기능 호출
		
//		dto.setM_board(Integer.parseInt(articleMap.get("m_board")));
		dto.setM_board(manager_BoardMapper.getmanager_board());
		dto.setId(articleMap.get("id")) ;
		dto.setTitle(articleMap.get("title"));
		dto.setContent(articleMap.get("content"));
		dto.setName(articleMap.get("name"));
		dto.setImg_name (articleMap.get("img_name"));
		dto.setHitcount(Integer.parseInt(articleMap.get("hitcount")));
		System.out.println(dto);
		
		// 서비스 호출 
		int result = manager_BoardService.addboard(dto);
			//첨부파일 있을 경우만 처리 	
		if (dto.getImg_name()!= null && dto.getImg_name().length() != 0) {
			// temp폴더에 임시로 보관된 파일경로 설정
			File srcFile = 
				new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+dto.getImg_name());
			
			//  ARTICLE_IMAGE_REPO 하위 경로에 글 번호 폴더를 생성: "d:\\file_repo\글번호폴더
			File descFile = new File(ARTICLE_IMAGE_REPO+"\\"+dto.getM_board());
			descFile.mkdirs();
			
			//temp폴더의 이미지 첨부파일을 글번호이름으로하는 폴더로 이동
			FileUtils.moveFileToDirectory(srcFile, descFile, true);
		}
		
		
		nextPage ="/users/m_boardList";
		resp.sendRedirect(req.getContextPath()+ nextPage);
	
	}
	private Map<String, String> upload(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		Map<String, String> articleMap = new HashMap<String,String>();
		String encoding = "utf-8";
		//문자열 -<> 시스템 파일로 변환
		File currentPath = new File(ARTICLE_IMAGE_REPO);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setRepository(currentPath);
		factory.setSizeThreshold(1024*1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			// req에 저장되어있는 매개변수를 List에 저장
			List<FileItem> items = upload.parseRequest(request);
			
			
			for(int i = 0; i < items.size(); i++) {
				
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) { //form 요소이면
					System.out.println(fileItem.getFieldName() + fileItem.getString(encoding));
				
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					
				}else {
					
					System.out.println("파라미터이름 : " + fileItem.getFieldName());
					System.out.println("파일 이름 : " + fileItem.getName() );
					System.out.println("파일 크기 : "+ fileItem.getSize());
					
					
					
					articleMap.put(fileItem.getFieldName(),fileItem.getName());
					
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
							
						}
						
						String fileName = fileItem.getName().substring(idx +1);
						File uploadFile = new File(currentPath +"\\"+"temp"+"\\"+fileName);
						
						fileItem.write(uploadFile);
					}
					
				}
			}
			
		} catch (Exception e) {

		}
		
		return articleMap;
	}	
}
