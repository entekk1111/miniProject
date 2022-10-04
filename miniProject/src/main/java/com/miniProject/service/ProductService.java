package com.miniProject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;
import com.miniProject.mapper.ProductMapper;
import com.miniProject.model.SessionVO;

@Service
public class ProductService {

	
	@Autowired
	private ProductMapper productMapper;
	
	//화면에서 상품 가져옴
	public List<Map<String, Object>> getProductDetail(List<String> urlList) {
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process(urlList);
	}
	
	//DB에 insert
	@Transactional
	public int addCheckedProduct(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> optionList = new ArrayList<Map<String, Object>>();
		
		SessionVO sessionVO =  (SessionVO)request.getSession().getAttribute("SID");
		
		//사진 최대 10장
		String[] productPhotos = request.getParameterValues("productPhoto");
		if(productPhotos != null && productPhotos.length > 0) {
			for(int i = 0; i < productPhotos.length && i < 10; i++) {
				map.put("PRPHOTO0" + (i+1), productPhotos[i]);
			}
		}
		
		map.put("MEMBERNUM", sessionVO.getMemberNum());					//회원번호
		map.put("PRODCNAME", request.getParameter("productTitle"));		//상품명
		map.put("PRODPRICE", Integer.valueOf(request.getParameter("productPrice").replaceAll("[^0-9.]", "")));		//가격
		map.put("PRODETAIL", request.getParameter("productDetail"));	//상품상세
		
//		map.put("DEIOPTION", request.getParameter("DEIOPTION"));		//배송유형
//		map.put("DELIPRICE", request.getParameter("DELIPRICE"));		//배송비
//		map.put("PKFOPRICE", request.getParameter("PKFOPRICE"));		//배대지비용
//		map.put("PRODUSALE", request.getParameter("PRODUSALE"));		//판매가 할인률

		int r = productMapper.addCheckedProduct(map);					//상품 insert
		//1.방금등록한 상품번호 가져와야함
		int productNum = productMapper.getRecentProductNumber(sessionVO.getMemberNum());
		
		//상품옵션
		String[] optionValues = request.getParameterValues("optionValue");
		if(optionValues != null && optionValues.length > 0) {
			for(String item : optionValues) {				
				Map<String, Object> optionMap = new HashMap<String, Object>();
				optionMap.put("PRODUCNUM", productNum);							//상품번호
				optionMap.put("OPTIONAME", request.getParameter("optionKey"));	//상품옵션명
				optionMap.put("OPTIVALUE", item);								//상품옵션값
				optionList.add(optionMap);
			}
		}

		productMapper.addOption(optionList);
		
		return 0;
	}
}
