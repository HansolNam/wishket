package com.wjm.main.function;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SMS {
	private static final Logger logger = LoggerFactory.getLogger(SMS.class);

	//문자 전송
	static public void sendSMS(String sender, String receiver, String message, String receiver_name )
			 throws URISyntaxException, ClientProtocolException, IOException 
	{
		logger.info("SMS 함수");
		
		String userid = "gksthf1611";
		String passwd = "quswlgns1234";
		
		logger.info("userid = "+userid);
		logger.info("passwd = "+passwd);
		logger.info("sender = "+sender);
		logger.info("receiver = "+receiver);
		logger.info("message = "+message);
		logger.info("receiver_name = "+receiver_name);
		
		message = URLEncoder.encode(message, "EUC_KR");
		
		URI uri = new URI("http://www.munjanara.co.kr/MSG/send/web_admin_send.htm");
		uri = new URIBuilder(uri)
				.addParameter("userid",userid)
				.addParameter("passwd",passwd)
				.addParameter("sender",sender)
				.addParameter("receiver",receiver)
				.addParameter("message",message)
				.addParameter("receiver_name",receiver_name)
				.addParameter("encode","1")
				.build();
		
		HttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(new HttpGet(uri));
		HttpEntity entity = response.getEntity();
		
		String content = EntityUtils.toString(entity);
		logger.info(content);
	}
}
