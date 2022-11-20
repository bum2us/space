package com.space.infra.modules.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.space.infra.common.utils.UtilUpload;

@Service	
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao dao;

	@Override
	public void insert(Product dto) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(dto);
		
		int j = 0;
		for(MultipartFile myFile : dto.getMultipartFile()) { 
			
			if(!myFile.isEmpty()) {
				// postServiceImpl
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				System.out.println( UtilUpload.uploadProduct(myFile, pathModule, dto) );
				
				dto.setUpDefaultNy(j == 0 ? 1 : 0); 
				dto.setUpSort(j+1);				
				
				dao.insertUpload(dto); 
				j++; 
			}
			
		}
	}

	@Override
	public List<Product> selectBuyList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBuyList();
	}

	@Override
	public List<Product> selectSaleList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSaleList();
	}
	
	

	@Override
	public List<Product> selectBuyListFromMember(Product dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBuyListFromMember(dto);
	}

	@Override
	public List<Product> selectSaleListFromMember(Product dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSaleListFromMember(dto);
	}

	@Override
	public Product selectOneProduct(Product dto) throws Exception {
		// TODO Auto-generated method stub
		Product result = dao.selectOneProduct(dto);
		
		if(result.getUpPath() == null) {
			result.setUpPath("/resources/images/");
			result.setUpUuidName("empty.png");
		}
		
		return result;
	}

	@Override
	public List<Product> selectImgFromProduct(Product dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectImgFromProduct(dto);
	}

	

	

	
}
