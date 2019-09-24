package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.persistence.MeetingMapper;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Inject
	private MeetingMapper mapper;
	
	@Override
	@Transactional
	public void createMeet(MeetVO meetVO, Long memberSeq) {//정모 생성한 사람은 자동으로 해당 정모 참가 
		mapper.regMeet(meetVO);
		mapper.attendMeet(meetVO.getMeetId(),memberSeq);
	}

	@Override
	@Transactional
	public MeetingPageVO readMeet(Long seq, Long memberSeq) {
		MeetVO meetVO = mapper.getMeet(seq);
		List<MeetMemberVO> memberList = mapper.getMeetingMember(seq);
		boolean isAttend = mapper.isAttend(seq,memberSeq);
		MeetingPageVO meetingPageVO = new MeetingPageVO(meetVO, memberList, isAttend);
		return meetingPageVO;
	}

	@Override
	public void modifyMeet(MeetVO meetVO) {
		mapper.modifyMeet(meetVO);
	}

	@Override
	public void deleteMeet(Long meetId) {
		mapper.deleteMeet(meetId);
	}

	@Override
	public void attendMeet(Long meetId, Long tmemId) {
		mapper.attendMeet(meetId, tmemId);
	}

	@Override
	public void cancelAttend(Long meetId, Long tmemId) {
		mapper.cancelAttend(meetId, tmemId);
	}

	@Override
	@Transactional
	public MeetListVO getMeetList(Long teamId,Long tmemId) {
		// TODO Auto-generated method stub
		List<MeetVO> list = mapper.getMeetList(teamId);
		HashMap<Long,Integer> countMeetMember = new HashMap<Long, Integer>();
		HashMap<Long,Boolean> isAttend = new HashMap<Long, Boolean>();
		for (MeetVO meetVO : list) {
			Long meetId = meetVO.getMeetId();
			countMeetMember.put(meetId, mapper.countMeetMember(meetId));
			isAttend.put(meetId, mapper.isAttend(meetId, tmemId));
		}
		MeetListVO meetListTestVO = new MeetListVO(list,countMeetMember,isAttend);
		return meetListTestVO;
	}	
}