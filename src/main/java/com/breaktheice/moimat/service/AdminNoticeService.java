package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;

@Service
public interface AdminNoticeService {

	
	// 게시물 목록
	public List<PostDomain> list(PostDomain domain);
	// 게시물 상세
	public PostDomain view(PostDomain domain);
	// 게시물 추가
	public Long add(PostDomain domain);
	// 게시물 수정
	public Long update(PostDomain domain);
	// 게시물 삭제
	public Long remove(PostDomain domain);
	

}