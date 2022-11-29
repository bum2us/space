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
		
		System.out.println("service getPoWriter : " + dto.getPoWriter());
		int insert = dao.insert(dto);
		
		int postSeq = dao.selectLastSeq();
		
		
		int j = 0;
		for(MultipartFile myFile : dto.getMultipartFile()) {

			if(!myFile.isEmpty()) {
				// postServiceImpl
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.uploadPost(myFile, pathModule, dto);

				dto.setUpDefaultNy(j == 0 ? 1 : 0);
				dto.setUpSort(j+1);
				dto.setUpSeq(postSeq);

				dao.insertUpload(dto);
				
				j++;
			}
		}
		return insert;
	}

	@Override
	public Post selectOne(PostVo vo) throws Exception {
		
		return dao.selectOne(vo);
	}

	@Override
	public int update(Post dto) throws Exception {
		
		return dao.update(dto);
	}
	
	
	


	
	
}
