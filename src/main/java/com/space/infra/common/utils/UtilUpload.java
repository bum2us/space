package com.space.infra.common.utils;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.space.infra.modules.member.Member;
import com.space.infra.modules.post.Post;
import com.space.infra.modules.product.Product;

public class UtilUpload { 

	public static String uploadProduct (MultipartFile multipartFile, String className, Product dto) throws Exception {
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String nowString = UtilDateTime.nowString();
		String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10);
		//String path = "D://factory/ws_sts_4151/space/src/main/webapp/resources/uploaded" + "/" + pathModule + "/" + pathDate + "/";
		
		//EC2 서버용
		String path = "/01_DEV/wsEzen/space/resources/uploaded" + "/" + pathModule + "/" + pathDate + "/";
		String pathForView = "/resources/uploaded/" + pathModule + "/" + pathDate + "/";
		
		createPath(path); //위에서 정의한 경로를 생성해주는 메소드
		
		multipartFile.transferTo(new File(path + uuidFileName)); //실제로 이미지 물리파일이 저장되는 코드(메소드)
		
		dto.setUpPath(pathForView);  
		dto.setUpOriginalName(fileName); 
		dto.setUpUuidName(uuidFileName);
		dto.setUpExt(ext);
		String size = ""+ multipartFile.getSize();  
		dto.setUpSize(size);  
		
		return path+uuidFileName;
	}
	
	public static String uploadPost (MultipartFile multipartFile, String className, Post dto) throws Exception {
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String nowString = UtilDateTime.nowString();
		String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10);
		String path = "/01_DEV/wsEzen/space/resources/uploaded" + "/" + pathModule + "/" + pathDate + "/";
		String pathForView = "/resources/uploaded/" + pathModule + "/" + pathDate + "/";
		
		createPath(path); //위에서 정의한 경로를 생성해주는 메소드
		
		multipartFile.transferTo(new File(path + uuidFileName)); //실제로 이미지 물리파일이 저장되는 코드(메소드)
		
		dto.setUpPath(pathForView);  
		dto.setUpOriginalName(fileName); 
		dto.setUpUuidName(uuidFileName);
		dto.setUpExt(ext);
		String size = ""+ multipartFile.getSize();  
		dto.setUpSize(size);  
		
		return path+uuidFileName;
	}
	 
	public static void uploadProfile (MultipartFile multipartFile, String className, Member dto) throws Exception {
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className; 
		String nowString = UtilDateTime.nowString(); 
		String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
		String path = "/01_DEV/wsEzen/space/resources/uploaded" + "/" + pathModule + "/" + pathDate + "/";
		//EC2 서버용 
		String pathForView = "/resources/uploaded/" + pathModule + "/" + pathDate + "/";
		 
		createPath(path); 
		  
		multipartFile.transferTo(new File(path + uuidFileName));
		
		dto.setUpPath(pathForView);
		dto.setUpOriginalName(fileName);
		dto.setUpUuidName(uuidFileName);
		dto.setUpExt(ext);
		String size = ""+ multipartFile.getSize();
		dto.setUpSize(size); 
	}
	
	public static void createPath (String path) {
		File uploadPath = new File(path);
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		} else {
			// by pass
		}
	}
	
}
