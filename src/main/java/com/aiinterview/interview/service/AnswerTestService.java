package com.aiinterview.interview.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aiinterview.analysis.dao.HabitAnalysisMapper;
import com.aiinterview.analysis.dao.KeywordAnalysisMapper;
import com.aiinterview.analysis.dao.RepeatAnalysisMapper;
import com.aiinterview.analysis.vo.HabitAnalysisVO;
import com.aiinterview.analysis.vo.KeywordAnalysisVO;
import com.aiinterview.analysis.vo.RepeatAnalysisVO;
import com.aiinterview.interview.dao.AnswerMapper;
import com.aiinterview.interview.vo.AnswerVO;

@Service("answerTestService")
public class AnswerTestService {
	
	@Resource(name="answerMapper")
	private AnswerMapper answerMapper;

	@Resource(name="habitAnalysisMapper")
	private HabitAnalysisMapper habitAnalysisMapper;
	
	@Resource(name="repeatAnalysisMapper")
	private RepeatAnalysisMapper repeatAnalysisMapper;
	
	@Resource(name="keywordAnalysisMapper")
	private KeywordAnalysisMapper keywordAnalysisMapper;
	
	public void create(Map<String, Object> map) throws Exception{
		
//		AnswerVO answerVO = (AnswerVO) map.get("answerVO");
//		
//		answerMapper.create(answerVO);
		int i = 1300;
		String ansSq = i+"";

		/* 습관어 insert */
		List<HabitAnalysisVO> habitAnalysisVOList = (List<HabitAnalysisVO>) map.get("habitAnalysisVOList");
		for (HabitAnalysisVO habitAnalysisVO : habitAnalysisVOList) {
			habitAnalysisVO.setAnsSq(ansSq);
			habitAnalysisMapper.create(habitAnalysisVO);
		}
		
		/* 반복어 insert */
		List<RepeatAnalysisVO> repeatList = (List<RepeatAnalysisVO>) map.get("repeatList");
		for (RepeatAnalysisVO repeatAnalysisVO : repeatList) {
			repeatAnalysisVO.setAnsSq(ansSq);
			repeatAnalysisMapper.create(repeatAnalysisVO);
		}
		
		/* 키워드 분석 (인재상 ) insert */
		List<KeywordAnalysisVO> keywordAnalysisList = (List<KeywordAnalysisVO>) map.get("keywordAnalysisList");
		for (KeywordAnalysisVO keywordAnalysisVO : keywordAnalysisList) {
			keywordAnalysisVO.setAnsSq(ansSq);
			keywordAnalysisMapper.create(keywordAnalysisVO);
		}
	}
}