package entity;

import java.util.List;

/**
 * @author YuJiBiao

 *2016年12月27日下午1:37:52

 */
public class PageBean<T> {
     private int currentPage = 1;//当前页，默认显示第一页
     private int pageCount = 9;//每一页显示的行数
     private int totalCount;//总记录数
     private int totalPage;//总页数 = 总记录数/每一页的行数（+1）
     private List<T> pageDate;//分页查训到的数据
	public List<T> getPageDate() {
		return pageDate;
	}
	public void setPageDate(List<T> pageDate) {
		this.pageDate = pageDate;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	//返回总页数
	public int getTotalPage() {
		if(totalCount % pageCount ==0){
			//如果能整除
			totalPage = totalCount/pageCount;
		}
		else{
			totalPage = totalCount/pageCount+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
