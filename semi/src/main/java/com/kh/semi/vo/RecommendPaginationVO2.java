package com.kh.semi.vo;

import lombok.Data;

@Data
public class RecommendPaginationVO2 {
	private String keyword = "";
	private int page = 1;
	private int size = 10;
	private int count;
	private int blockSize=10;
	
	//검색 여부 판정
	public boolean isSearch() {
		return keyword.equals("") == false;
	}
	
	public boolean isList() {
		return keyword.equals("");
	}

	public String getParameter() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("size=");
		buffer.append(size);
		if(isSearch()) {//검색이라면 항목을 더 추가
			buffer.append("&keyword=");
			buffer.append(keyword);
		}
		
		return buffer.toString();
	}
	
	
	//시작행 번호 계산
	public int getBegin() {
		return page*size-(size-1);
	}
	
	public int getEnd() {
		//return page*size;
		return Math.min(page*size, count);
	}
	
	public int getTotalPage() {
		return (count+9)/size;
	}
	
	public int getStartBlock()	{
		return (page-1)/blockSize*blockSize+1;
	}
	
	public int getFinishBlock() {
		int value = (page-1)/blockSize*blockSize+blockSize; 
		return Math.min(value, getTotalPage());
	}
	
	//첫 페이지인가?
	public boolean isFirst() {
		return page==1;
	}
	
	//마지막 페이지인가?
	public boolean isLast()	{
		return page == getTotalPage();
	}
	
	//[이전]이 나오는 조건 - 시작블록이 1보다 크면(page가 size보다 크면)
	public boolean isPrev() {
		return getStartBlock()>1;
	}
	
	//[다음]이 나오는 조건 - 종료블록이 마지막페이지보다 작으면
	public boolean isNext() {
		return getFinishBlock() < getTotalPage();
	}
	
	//[이전]을 누르면 나올 페이지 번호
	public int getNextPage() {
		return getFinishBlock()+1;
	}
	
	//[다음]을 누르면 나올 페이지 번호
	public int getPrevPage() {
		return getStartBlock()-1;
	}
		
	
}