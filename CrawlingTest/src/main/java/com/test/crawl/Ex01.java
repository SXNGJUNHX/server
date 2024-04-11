package com.test.crawl;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Ex01 {
	public static void main(String[] args) {
		
		//Jsoup
		//- 브라우저처럼 사이트 접속 > 접속한 페이지의 소스 읽기 > 
		
		try {

			String url = "https://jsoup.org/";
			
			//접속해서 읽어온 문서 내용을 다 담고있는 참조 객체
			Document doc = Jsoup.connect(url).get();
			
			System.out.println(doc.html());
			System.out.println();
			System.out.println();
			System.out.println();
			
			//doc.getElementById(url)
			//doc.select()
			
			
			Elements list = doc.select(".content > .col1 > h1");
			
			System.out.println(list.size());
			
			System.out.println(list.get(0).text());
			
			
			
			
		} catch (Exception e) {
			System.out.println("Ex01.main");
			e.printStackTrace();
		}
	}
}






















