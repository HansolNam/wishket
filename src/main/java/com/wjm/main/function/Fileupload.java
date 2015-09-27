package com.wjm.main.function;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class Fileupload {
	private static final Logger logger = LoggerFactory.getLogger(Fileupload.class);

	static public String delete_portfolio(String realPath, String filename)
	{
		realPath += "resources\\upload\\portfolio\\";
		String savePath = realPath.replace('\\','/');
		
		File file = new File(savePath+filename);
		
		if(file.delete())
		{
			logger.info("성공적으로 삭제");
			return "성공";
		}
		else
		{
			logger.info("삭제 실패");
			return "error";
		}

	}
	static public String upload_portfolio(String realPath, MultipartFile image, String id)
			 throws IOException, FileUploadException{
		
		// \wjm\ + 
		realPath += "resources\\upload\\portfolio\\";
		String savePath = realPath.replace('\\','/');
		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
	         targetDir.mkdirs();
	      }
		
		String fileName =  image.getOriginalFilename();
		//if(!Validator.isValidLength(fileName, 1, 50))

		String rootPath, FinalFileName;
		try{
			byte[] bytes = image.getBytes();
			
			String random = RandomSring(10);
			FinalFileName = random+"_"+id+"_"+fileName;
			
			rootPath = savePath+FinalFileName;
			logger.info("rootPath = "+rootPath);
			
			File serverFile = new File(rootPath);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			logger.info("img path = "+random+"_"+id+"_"+fileName);
			return FinalFileName;
		}
		catch(Exception e){
			logger.info("Exception = "+e.toString());
			return "error";
		}
		
	}
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

	
	static public boolean isImage(MultipartFile image)
	{
		String FileName = image.getOriginalFilename();
		int point = FileName.lastIndexOf(".");
		String pre_fileType = FileName.substring(point+1, FileName.length());
		String fileType = pre_fileType.toLowerCase();
		
		if(!fileType.equals("jpg") &&!fileType.equals("jpeg") &&!fileType.equals("png") &&
				!fileType.equals("bmp") &&!fileType.equals("gif") )
			return false;
		
		return true;
	}
	
	static public boolean isValidFileSize(MultipartFile image, int max) throws  IOException
	{
		byte[] bytes = image.getBytes();
		
		if(((double)bytes.length/(double)(1024*1024)) > max)
	      {
		      logger.info("파일 용량 : "+((double)bytes.length/(double)(1024*1024)));
	    	  return false;
	      }
		
		return true;
		
	}
	
	static public String RandomSring(int length)
	{
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		 
		for(int i=0;i<length;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		
		return buf.toString();
	}
}
