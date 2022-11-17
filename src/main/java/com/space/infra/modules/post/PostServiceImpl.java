package com.space.infra.modules.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.space.infra.common.utils.UtilUpload;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao dao;

	@Override
	public List<Post> selectList() throws Exception {

		
		return dao.selectList();
	}
	
	

	@Override
	public int selectLastSeq() throws Exception {
		return dao.selectLastSeq();
	}



	@Override
	public int insert(Post dto) throws Exception {
		
		dao.insert(dto);
		
		int postSeq = dao.selectLastSeq();
		
		
//		int j = 0;
//		for(MultipartFile myFile : dto.getMultipartFile()) {
//
//			if(!myFile.isEmpty()) {
//				// postServiceImpl
//				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
//				UtilUpload.uploadPost(myFile, pathModule, dto);
//
//				dto.setType(2);
//				dto.setDefaultNY(j == 0 ? 1 : 0);
//				dto.setSort(j+1);
//				dto.setpSeq(pSeq);
//
//				dao.insertMemberUpload(dto);
//				
//				j++;
//			}
//		}
		
		
		return dao.insert(dto);
	}

	
	
}
