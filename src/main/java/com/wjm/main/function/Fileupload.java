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

	static public String delete_profile(String realPath, String filename)
	{
		realPath += "resources\\upload\\profile_img\\";
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

	static public String delete_doc(String realPath, String filename)
	{
		realPath += "resources\\upload\\doc\\";
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

	static public String delete_file(String realPath, String filename)
	{
		realPath += "resources\\upload\\file\\";
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
	static public String upload_file(String realPath, MultipartFile file, String id)
			 throws IOException, FileUploadException{
		
		// \wjm\ + 
		realPath += "resources\\upload\\file\\";
		String savePath = realPath.replace('\\','/');
		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
	         targetDir.mkdirs();
	      }
		
		String fileName =  file.getOriginalFilename();
		//if(!Validator.isValidLength(fileName, 1, 50))

		String rootPath, FinalFileName;
		try{
			byte[] bytes = file.getBytes();
			
			String random = RandomSring(10);
			FinalFileName = random+"_"+id+"_"+fileName;
			
			rootPath = savePath+FinalFileName;
			logger.info("rootPath = "+rootPath);
			
			File serverFile = new File(rootPath);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			logger.info("file path = "+random+"_"+id+"_"+fileName);
			return FinalFileName;
		}
		catch(Exception e){
			logger.info("Exception = "+e.toString());
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
	

	static public String upload_profile(String realPath, MultipartFile image, String id)
			 throws IOException, FileUploadException{
		
		// \wjm\ + 
		realPath += "resources\\upload\\profile_img\\";
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


	static public String upload_doc(String realPath, MultipartFile image, String id)
			 throws IOException, FileUploadException{
		
		// \wjm\ + 
		realPath += "resources\\upload\\doc\\";
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
	
	static public boolean isFile(MultipartFile file)
	{
		String FileName = file.getOriginalFilename();
		int point = FileName.lastIndexOf(".");
		String pre_fileType = FileName.substring(point+1, FileName.length());
		String fileType = pre_fileType.toLowerCase();
		
		//gif, png, jpg, jpeg, bmp, pdf, gul, xls, xlsx, doc, docx, ppt, pptx, hwp, zip 허용
		if(!fileType.equals("jpg") &&!fileType.equals("jpeg") &&!fileType.equals("png") &&
				!fileType.equals("bmp") &&!fileType.equals("gif") 
				&& !fileType.equals("pdf") &&!fileType.equals("gul") &&!fileType.equals("xls") &&
				!fileType.equals("xlsx") &&!fileType.equals("doc") 
				&& !fileType.equals("docx") &&!fileType.equals("ppt") &&!fileType.equals("pptx") &&
				!fileType.equals("hwp") &&!fileType.equals("zip") )
			return false;
		
		return true;
	}
	

	static public String upload_notice(String realPath, MultipartFile image, String replaceName)
			 throws IOException, FileUploadException{
		
		// \wjm\ + 
		realPath += "resources\\upload\\notice\\";
		String savePath = realPath.replace('\\','/');
		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
	         targetDir.mkdirs();
	      }

		String rootPath, FinalFileName;
		try{
			byte[] bytes = image.getBytes();
			
			FinalFileName = replaceName;
			
			rootPath = savePath+FinalFileName;
			logger.info("rootPath = "+rootPath);
			
			File serverFile = new File(rootPath);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			logger.info("img path = "+replaceName);
			return FinalFileName;
		}
		catch(Exception e){
			logger.info("Exception = "+e.toString());
			return "error";
		}
		
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
