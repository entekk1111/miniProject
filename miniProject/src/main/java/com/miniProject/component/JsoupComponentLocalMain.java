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
	
	private static final String url = "https://www.ebay.com/itm/185419386840?epid=3051950252&hash=item2b2bdb4fd8%3Ag%3AvhUAAOSwgP1ivjL7&_trkparms=%2526rpp_cid%253D62ce7eccf492ecbbe49fa6fd&var=693214699892";
	private static final String PRODUCT_CARD_CLASS = "dne-itemtile-detail";
	private static final String PRODUCT_TITLE_CLASS = "dne-itemtile-title";
	private static final String PRODUCT_LINK_SELECTOR = ".dne-itemtile-title a";
	private static final String PRODUCT_PRICE_SELECTOR = ".dne-itemtile-price .first";
	
	public Map<String, Object> process() {
		Connection conn = Jsoup.connect(url);	//Jsoup 커넥션 생성
		Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return getDataList(doc);
	}
	
	public Map<String, Object> getDataList(Document document){
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Elements selects = document.select("#CenterPanelInternal");		//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		
		for(Element select : selects) {
			String title = select.select(".x-item-title__mainTitle").text();
			
			dataMap.put("title", title);
		}
		
		return dataMap;
	}
}
