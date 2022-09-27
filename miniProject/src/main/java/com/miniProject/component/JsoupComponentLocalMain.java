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

	private static final String url = "https://www.amazon.com/FIODIO-Comfortable-Anti-Ghosting-Resistant-Multimedia/dp/B086168Y25/ref=sr_1_1_sspa?keywords=gaming%2Bkeyboard&pd_rd_r=c5a05c53-9c9f-4eb4-b945-e6caa1e3b050&pd_rd_w=sZKOr&pd_rd_wg=JoGxY&pf_rd_p=12129333-2117-4490-9c17-6d31baf0582a&pf_rd_r=Y1V3S58B7P34NY8EXH85&qid=1664257807&qu=eyJxc2MiOiI3LjE0IiwicXNhIjoiNi44MCIsInFzcCI6IjYuMjIifQ%3D%3D&sr=8-1-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyQUVDMzlGREFSRVZBJmVuY3J5cHRlZElkPUEwMTk5OTc2RVYxUVpDUEZQSVImZW5jcnlwdGVkQWRJZD1BMDM0Mjk0ODFTWDg2VkxYMzdUTFEmd2lkZ2V0TmFtZT1zcF9hdGYmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl&th=1";
	
	public List<String> process() {
		Connection conn = Jsoup.connect(url);	//Jsoup 커넥션 생성
		Document document = null;
		
		try {
			document = conn.get();
			//url의 내용을 HTML Document 객체로 가져온다
			
		}catch (IOException e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return getDataList(document);
	}
	
	public List<String> getDataList(Document document){
		List<String> list = new ArrayList<>();
		//select 메서드 안에 css selector를 작성하여 Elecments를 가져올 수 있다.
		Elements selects = document.select("#apex_desktop"); 	//제목
//		Elements price = document.select("#apex_desktop"); 	//가격
		System.out.println("aaadd");
		for(Element select : selects) {
			System.out.println(select.html());
			list.add(select.html());
		}
		
//		for(Element select : price) {
//			System.out.println(select.html());
//			list.add(select.html());
//		}
		
		return list;
	}
}
