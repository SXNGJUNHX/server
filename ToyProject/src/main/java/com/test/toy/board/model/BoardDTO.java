package com.test.toy.board.model;

import java.util.ArrayList;

import com.test.toy.board.repository.BoardDAO;

import lombok.Data;

@Data
public class BoardDTO {

	private String seq;
	private String subject;
	private String content;
	private String id;
	private String regdate;
	private String readcount;
	
	private String name;	//작성자 이름
	private double isnew;	//최신글
	
	private String commentcount; //댓글 수
	
	private int thread;	//답변형
	private int depth;	//답변형
	
	private String attach; //첨부파일
	
	private ArrayList<String> tag; //해쉬태그
	
	private String secret;
	
}
