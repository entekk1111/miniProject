package com.miniProject.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.miniProjcet.common.util.MiniProjectUtil;

public class JsoupComponentLocalMain {
	
	private static final String EBAY_PRODUCT_INFO_CARD_CLASS 	= "#CenterPanelInternal";		//상품 정보 카드
	private static final String EBAY_PRODUCT_DETAIL_CARD_CLASS 	= "#vi-desc-maincntr";			//상품 상세 카드
	
	private static final String EBAY_PRODUCT_TITLE_CLASS 		= ".x-item-title__mainTitle";	//상품 제목
	private static final String EBAY_PRODUCT_PRICE_SELECTOR 	= "#prcIsum";					//상품 가격
	private static final String EBAY_PRODUCT_PICTURE_SELECTOR 	= "#PicturePanel";				//상품 사진
	
	private static final String EBAY_PRODUCT_SPECIFICATIONS 	= "#viTabs_0_is";				//상품 사양
	private static final String EBAY_PRODUCT_DETAILS 			= "#desc_ifr"; 					//상품 상세
	
	public List<Map<String, Object>> process(List<String> urlList) {
		Document doc = null;
		Connection conn = null;
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		for(String url : urlList) {			
			if(url.contains("http") || url.contains("https")) {				
				conn = Jsoup.connect(url);	//Jsoup 커넥션 생성
			}
			
			try {
				doc = conn.get();
				result.add(getDataList(doc));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public Map<String, Object> getDataList(Document document){
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Elements selectsInfo = document.select(EBAY_PRODUCT_INFO_CARD_CLASS);			//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		Elements selectsDetail = document.select(EBAY_PRODUCT_DETAIL_CARD_CLASS);		//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		
		for(Element select : selectsInfo) {
			String title = select.select(EBAY_PRODUCT_TITLE_CLASS).text();		//상품제목
			String optionKey = select.select("select").attr("name");			//옵션(제목)	옵션이 두개일 경우 따로따로 가져와야함
			
			List<String> optionValues = new ArrayList<String>();				//옵션(항목)
			if(select.select("option").size() > 0) {
				for(Element value : select.select("option")) {
					optionValues.add(value.text());
				}
			}
			
			String price = select.select(EBAY_PRODUCT_PRICE_SELECTOR).text();	//상품가격
			if(price.replaceAll(" ", "").equals("")) {
				price = select.select("#mm-saleDscPrc").text();					//상품가격 안나오면 다른 태그로 찾음(세일가면 다른 태그로 쓰고 있음)
			}
			Double priceChange = null;
			if(!price.equals("")) {				
				priceChange = Double.valueOf(price.replaceAll("[^0-9.]", "").replaceAll(" ", "")); 	//소수점 제외 문자열 공백처리, 공백제거
				price = MiniProjectUtil.changePrice(priceChange * 1425.08);									//달러 환율만 넣었는데 환율 API 가져다 써야함			
			}
			
			List<String> photos = new ArrayList<String>();						//상품 이미지
			if(select.select(".ux-image-carousel img").size() > 0) {
				for(Element value : select.select("img")) {					
					if(!value.attr("src").equals("")) photos.add(value.attr("src"));
				}
			}
			
			dataMap.put("title", title);						//제목
			dataMap.put("optionKey", optionKey);				//옵션제목
			dataMap.put("optionValues", optionValues);			//옵션값
			dataMap.put("price", price);						//가격
			dataMap.put("photos", photos);						//이미지
		}
		
		for(Element select : selectsDetail) {
			String specifications	= select.select(EBAY_PRODUCT_SPECIFICATIONS).text();	//제품사양
			dataMap.put("specifications", specifications);	//제품사양
		}
		
		String detailsSrc = selectsDetail.select(EBAY_PRODUCT_DETAILS).attr("src");	//제품상세 iframe안에 있어서 src가져와서 정보 추출
		dataMap.put("details", getProductDetail(detailsSrc));				//제품상세
		
		return dataMap;
	}
	
	//상품 상세 가져오기
	//iframe안에 있어서 src가져와서 정보 추출
	public String getProductDetail(String detailUrl) {
		Document doc = null;
		Connection conn = null;
		
		if(detailUrl.contains("http") || detailUrl.contains("https")) {				
			conn = Jsoup.connect(detailUrl);	//Jsoup 커넥션 생성
		}
		
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return doc.select("#ds_div").html();
	}
	
	
}
