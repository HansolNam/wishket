package com.wjm.main.function;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class Fileupload {
	private static final Logger logger = LoggerFactory.getLogger(Fileupload.class);

	static public String upload(String tempSavePath, MultipartFile image)
			 throws IOException, FileUploadException{
		String now = Time.toString4(Time.getCurrentTimestamp());
		String saveDir = "";
		
		tempSavePath += "resources\\upload\\profile_img\\"; 
		String savePath = tempSavePath.replace('\\', '/'); 
		//logger.info("savePath = "+savePath);
		
		File targetDir = new File(savePath);
	      if (!targetDir.exists()) {
	         targetDir.mkdirs();
	      }
	      saveDir = savePath;
	      String fileLocation = image.getOriginalFilename();
	      
	      //logger.info("filelocation = "+fileLocation);
	      logger.info("파일명 길이 : "+fileLocation.length());
	      if(fileLocation.length() >40)
	      {
		      logger.info("파일명 길이가 너무 깁니다");
	    	  return "error";
	      }
	      
			String rootPath;
			try{
				byte[] bytes = image.getBytes();
				
				if(((double)bytes.length/(double)(1024*1024)) > 5.0)
			      {
				      logger.info("파일 용량 : "+((double)bytes.length/(double)(1024*1024)));
			    	  return "error";
			      }
				
				rootPath = saveDir+now+fileLocation;
				File serverFile = new File(rootPath);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("img path = "+"resources/upload/profile_img/"+now+fileLocation);
				return "resources/upload/profile_img/"+now+fileLocation;
			}
			catch(Exception e){
				logger.info("Exception = "+e.toString());
				return "error";
			}
	}
	static public String upload_doc(String tempSavePath, MultipartFile image)
			 throws IOException, FileUploadException{
		String now = Time.toString4(Time.getCurrentTimestamp());
		String saveDir = "";
		
		tempSavePath += "resources\\upload\\doc\\"; 
		String savePath = tempSavePath.replace('\\', '/'); 
		//logger.info("savePath = "+savePath);
		
		File targetDir = new File(savePath);
	      if (!targetDir.exists()) {
	         targetDir.mkdirs();
	      }
	      saveDir = savePath;
	      String fileLocation = image.getOriginalFilename();
	      
	      //logger.info("filelocation = "+fileLocation);
	      logger.info("파일명 길이 : "+fileLocation.length());
	      if(fileLocation.length() >40)
	      {
		      logger.info("파일명 길이가 너무 깁니다");
	    	  return "error";
	      }
	      
			String rootPath;
			try{
				byte[] bytes = image.getBytes();
				
				if(((double)bytes.length/(double)(1024*1024)) > 5.0)
			      {
				      logger.info("파일 용량 : "+((double)bytes.length/(double)(1024*1024)));
			    	  return "error";
			      }
				
				rootPath = saveDir+now+fileLocation;
				File serverFile = new File(rootPath);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				logger.info("img path = "+"resources/upload/doc/"+now+fileLocation);
				
				return "resources/upload/doc/"+now+fileLocation;
			}
			catch(Exception e){
				logger.info("Exception = "+e.toString());
				return "error";
			}
	}
	
}
