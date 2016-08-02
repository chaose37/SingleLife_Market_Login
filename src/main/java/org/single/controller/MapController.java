package org.single.controller;

import java.io.InputStream;
import java.net.URL;
import java.util.Scanner;

public class MapController {
	public class NetworkTest03 {
		public void main(String[] args) {
			String search = "https://apis.daum.net/search/book";
			// 요청 파라미터 추가
			search += "?apikey=3c9c1fa0e1b7288504129a9b0b5f8fc5";  
			search += "&q=java";
			search += "&result=2";
			search += "&output=json";
					
			try {
				URL url = new URL(search);
				InputStream in = url.openStream();
				Scanner sc = new Scanner(in, "utf-8");
				while (sc.hasNextLine()) {
					System.out.println(sc.nextLine());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
