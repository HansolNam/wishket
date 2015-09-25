package com.wjm.main.function;

import java.util.regex.Pattern;

public class Validator {

	static public boolean isEmail(String email)
	{
		if(email == null) return false;
		
		boolean result = Pattern.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$",email.trim());
		
		return result;
	}
	
	static public boolean isDigit(String digit)
	{
		if(digit == null) return false;

		boolean result = Pattern.matches("^[0-9]+$",digit.trim());
		
		return result;

	}
	
	static public boolean isId(String id)
	{
		if(id == null) return false;
		
		boolean result = Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$",id.trim());
		
		return result;
	}

	static public boolean isCompanyForm(String form)
	{
		if(form.equals("individual"))
			return true;
		else if(form.equals("team"))
			return true;
		else if(form.equals("individual_business"))
			return true;
		else if(form.equals("corporate_business"))
			return true;
		else
			return false;
		
	}	
	static public boolean isPhoneCode(String code)
	{
		if(code.equals("010"))
			return true;
		else if(code.equals("011"))
			return true;
		else if(code.equals("016"))
			return true;
		else if(code.equals("017"))
			return true;
		else if(code.equals("019"))
			return true;
		else
			return false;
		
	}
	static public boolean isValidLength(String input, int start, int end)
	{
		if(input.length()>=start && input.length()<=end)
			return true;
		else
			return false;
	}
	
	static public boolean isProjectCategory(String category, String sub_category)
	{
		if(category.equals("개발"))
		{
			if(sub_category.equals("웹"))
				return true;
			else if(sub_category.equals("애플리케이션"))
				return true;
			else if(sub_category.equals("워드프레스"))
				return true;
			else if(sub_category.equals("퍼블리싱"))
				return true;
			else if(sub_category.equals("일반소프트웨어"))
				return true;
			else if(sub_category.equals("커머스_쇼핑몰"))
				return true;
			else if(sub_category.equals("게임"))
				return true;
			else if(sub_category.equals("임베디드"))
				return true;
			else if(sub_category.equals("기타"))
				return true;
			else 
				return false;
		}
		else if(category.equals("디자인"))
		{
			if(sub_category.equals("웹"))
				return true;
			else if(sub_category.equals("애플리케이션"))
				return true;
			else if(sub_category.equals("제품"))
				return true;
			else if(sub_category.equals("프레젠테이션"))
				return true;
			else if(sub_category.equals("인쇄물"))
				return true;
			else if(sub_category.equals("커머스_쇼핑몰"))
				return true;
			else if(sub_category.equals("로고"))
				return true;
			else if(sub_category.equals("영상"))
				return true;
			else if(sub_category.equals("그래픽"))
				return true;
			else if(sub_category.equals("게임"))
				return true;
			else if(sub_category.equals("기타"))
				return true;
			else 
				return false;
		}
		else
			return false;
	}
	
	static public boolean isPlanStatus(String planning_status)
	{
		if(planning_status.equals("idea"))
			return true;
		else if(planning_status.equals("simple"))
			return true;
		else if(planning_status.equals("project_book"))
			return true;
		else
			return false;
	}
	
	static public boolean hasValue(String input)
	{
		if(input == null)
			return false;
		else if(input.trim().isEmpty())
			return false;
		else
			return true;
	}
}
