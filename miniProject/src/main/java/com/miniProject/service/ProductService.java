package com.miniProject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniProject.common.util.StringUtil;
import com.miniProject.component.JsoupComponentLocalMain;
import com.miniProject.mapper.ProductMapper;
import com.miniProject.model.SessionVO;

@Service
public class ProductService {

	
	@Autowired
	private ProductMapper productMapper;
	
	//상품수정 화면
	public Map<String, Object> getProduct(String param){
		Map<String, Object> data = productMapper.getProduct(param);
		if(data.get("PRODPRICE") != null) {
			data.put("PRODPRICE", StringUtil.changePrice(data.get("PRODPRICE")));
		};
		return data;
	};
	
	//상품수정 등록
	public int updateProduct(HttpServletRequest request) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("PRODUCNUM", request.getParameter("productCode"));		//상품코드
		dataMap.put("PRODCNAME", request.getParameter("productTitle"));		//상품명
		dataMap.put("PRODETAIL", request.getParameter("productDetail"));	//상품상세
		
		if(request.getParameter("productPrice") != null) {		
			String price = String.valueOf(request.getParameter("productPrice"));
			dataMap.put("PRODPRICE", Integer.valueOf(price.replaceAll("[^0-9.]", "")));		//가격
		}
		
		//사진 최대 10장
		String[] productPhotos = request.getParameterValues("productPhoto");
		if(productPhotos != null && productPhotos.length > 0) {
			for(int j = 0; j < productPhotos.length && j < 10; j++) {
				dataMap.put("PRPHOTO0" + (j+1), productPhotos[j]);
			}
		}
		
		int r = productMapper.updateProduct(dataMap);					//상품 insert
		//1.전에 등록한 옵션 지움
		productMapper.deleteOptions(String.valueOf(request.getParameter("productCode")));
		
		//상품옵션
		List<Map<String, Object>> optionList = new ArrayList<Map<String, Object>>();
		String[] optionValues = request.getParameterValues("optionValue");
		if(optionValues != null && optionValues.length > 0) {
			for(int z = 0; z < optionValues.length; z++) {				
				Map<String, Object> optionMap = new HashMap<String, Object>();
				optionMap.put("PRODUCNUM", request.getParameter("productCode"));							//상품번호
				optionMap.put("OPTIONAME", request.getParameter("optionKey"));	//상품옵션명
				optionMap.put("OPTIVALUE", optionValues[z]);								//상품옵션값
				optionList.add(optionMap);
			}
			int e = productMapper.addOption(optionList);
		}
		
		return r;
	};
	
	//화면에서 상품 가져옴
	public List<Map<String, Object>> getProductDetail(List<String> urlList) {
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process(urlList);
	}
	
	//DB에 insert
	@Transactional
	public int addCheckedProduct(HttpServletRequest request, List<Map<String, Object>> param) {
		int r = 0;
		SessionVO sessionVO =  (SessionVO)request.getSession().getAttribute("SID");
		
		for(int i = 0; i < param.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("MEMBERNUM", sessionVO.getMemberNum());						//회원번호
			map.put("PRODCNAME", param.get(i).get("productTitle"));				//상품명
			map.put("PRODETAIL", param.get(i).get("productDetail"));	//상품상세
			
			if(param.get(i).get("productPrice") != null) {		
				String price = String.valueOf(param.get(i).get("productPrice"));
				map.put("PRODPRICE", Integer.valueOf(price.replaceAll("[^0-9.]", "")));		//가격
			}
			
			//사진 최대 10장
			List<String> productPhotos = (List<String>) param.get(i).get("productPhoto");
			if(productPhotos != null && productPhotos.size() > 0) {
				for(int j = 0; j < productPhotos.size() && j < 10; j++) {
					map.put("PRPHOTO0" + (j+1), productPhotos.get(j));
				}
			}
			
			r = productMapper.addCheckedProduct(map);					//상품 insert
			//1.방금등록한 상품번호 가져옴
			int productNum = productMapper.getRecentProductNumber(sessionVO.getMemberNum());
			
			//상품옵션
			List<Map<String, Object>> optionList = new ArrayList<Map<String, Object>>();
			List<String> optionValues = (List<String>) param.get(i).get("optionValue");
			if(optionValues != null && optionValues.size() > 0) {
				for(int z = 0; z < optionValues.size(); z++) {				
					Map<String, Object> optionMap = new HashMap<String, Object>();
					optionMap.put("PRODUCNUM", productNum);							//상품번호
					optionMap.put("OPTIONAME", param.get(i).get("optionKey"));	//상품옵션명
					optionMap.put("OPTIVALUE", optionValues.get(z));								//상품옵션값
					optionList.add(optionMap);
				}
				int e = productMapper.addOption(optionList);
			}
			
		}
		
//		map.put("DEIOPTION", request.getParameter("DEIOPTION"));		//배송유형
//		map.put("DELIPRICE", request.getParameter("DELIPRICE"));		//배송비
//		map.put("PKFOPRICE", request.getParameter("PKFOPRICE"));		//배대지비용
//		map.put("PRODUSALE", request.getParameter("PRODUSALE"));		//판매가 할인률
		
		return r;
	}
}
