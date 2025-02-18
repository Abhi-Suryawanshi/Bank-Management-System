package com.bankingsystem.dao;

import java.util.Collection;
import com.bankingsystem.entity.MSDefinitionEntity;

public interface MSDefinitionDAO {
	public Collection<MSDefinitionEntity> getAll () throws Exception;
	public Collection<MSDefinitionEntity> findByCategory (String entity) throws Exception;
	public Collection<String> getAllCategories() throws Exception;
	public MSDefinitionEntity findByDefId(int def_Id) throws Exception; 
	public String createDefinition(MSDefinitionEntity msEntity) throws Exception; 
	public int getMaxDefIdByCategory(String category) throws Exception;
	public String updateDefinition(MSDefinitionEntity msEntity) throws Exception;
	public MSDefinitionEntity findByNameAndCategory(String name, String category) throws Exception;
	public Collection<MSDefinitionEntity> findByReligion(String religion) throws Exception;
}	
	
