package com.library.vo;

public class ArticleVo {
	
	int articleId;
	String articleTitle;
	String articleContent;
	String volunteerId;
	String articleTime;
	
	public String getArticleTime() {
		return articleTime;
	}
	public void setArticleTime(String articleTime) {
		this.articleTime = articleTime;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getVolunteerId() {
		return volunteerId;
	}
	public void setVolunteerId(String volunteerId) {
		this.volunteerId = volunteerId;
	}
	
	
	
}
