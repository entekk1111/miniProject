package com.miniProject.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupComponentLocalMain {

	private static final String url = "https://www.ebay.com/globaldeals";
	private static final String PRODUCT_CARD_CLASS = "dne-itemtile-detail";
	private static final String PRODUCT_TITLE_CLASS = "dne-itemtile-title";
	private static final String PRODUCT_LINK_SELECTOR = ".dne-itemtile-title a";
	private static final String PRODUCT_PRICE_SELECTOR = ".dne-itemtile-price .first";
	
	public List<String> process() {
		Connection conn = Jsoup.connect(url);	//Jsoup 커넥션 생성
		Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return getDataList(doc);
	}
	
	public List<String> getDataList(Document document){
		List<String> list = new ArrayList<>();
		//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		Elements selects = document.getElementsByClass(PRODUCT_CARD_CLASS);
		System.out.println("test" + selects);
		for(Element select : selects) {
			System.out.println(select.html());
			list.add(select.html());
		}
		
		return list;
	}
}
