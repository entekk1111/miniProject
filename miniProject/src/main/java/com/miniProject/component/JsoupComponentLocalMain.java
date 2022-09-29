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

public class JsoupComponentLocalMain {
	
	private static final String EBAY_PRODUCT_CARD_CLASS = "#CenterPanelInternal";
	private static final String EBAY_PRODUCT_TITLE_CLASS = ".x-item-title__mainTitle";
	private static final String EBAY_PRODUCT_PRICE_SELECTOR = "#prcIsum";
	private static final String EBAY_PRODUCT_PICTURE_SELECTOR = "#PicturePanel";
	
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
		
		Elements selects = document.select(EBAY_PRODUCT_CARD_CLASS);		//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		
		for(Element select : selects) {
			String title = select.select(EBAY_PRODUCT_TITLE_CLASS).text();		//상품제목
			String optionKey = select.select("select").attr("name");			//옵션(제목)
			
			List<String> optionValues = new ArrayList<String>();				//옵션(항목)
			if(select.select("option").size() > 0) {
				for(Element value : select.select("option")) {
					optionValues.add(value.text());
				}
			}
			
			String price = select.select(EBAY_PRODUCT_PRICE_SELECTOR).text();	//상품가격
			
			List<String> photos = new ArrayList<String>();						//옵션(항목)
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
		
		return dataMap;
	}
}
