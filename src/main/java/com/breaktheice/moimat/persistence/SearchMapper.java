package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;

public interface SearchMapper {
	
	public List<InterestDomain> intList();
	
	public List<InterestDomain> recommend(String keyword);
	
	public List<TeamDomain> autocomplete(String intName);
	
}
