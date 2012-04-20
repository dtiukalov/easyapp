package com.satrun.data.extraction.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class ExtractUtils {

	public static StringBuffer extractHtmlByUrl(String webUrl) {
		StringBuffer htmlCode = null;
		try {
			URL url = new URL(webUrl);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			connection.setDoOutput(true);
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			htmlCode = new StringBuffer();
			String line;
			
			while((line = in.readLine() ) != null){
				htmlCode.append(line);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return htmlCode;
	}
}
