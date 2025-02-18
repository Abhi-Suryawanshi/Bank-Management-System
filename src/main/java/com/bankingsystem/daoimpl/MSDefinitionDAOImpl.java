package com.bankingsystem.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

import com.bankingsystem.dao.MSDefinitionDAO;
import com.bankingsystem.entity.MSDefinitionEntity;
import com.bankingsystem.util.DataConnection;

public class MSDefinitionDAOImpl implements MSDefinitionDAO{
	
	private MSDefinitionDAOImpl () {
		
	}
	
	private static MSDefinitionDAOImpl instance = null;
	public static MSDefinitionDAOImpl getInstance() {
		if (instance == null) {
			instance = new MSDefinitionDAOImpl();
		}
		return instance;
	}
	
	Connection con = DataConnection.getConnection();
	
	@Override
	public Collection<MSDefinitionEntity> getAll() throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from MS_defination");
		ResultSet rs = pst.executeQuery();
		Collection<MSDefinitionEntity> msdefinitionEntities = new ArrayList<MSDefinitionEntity>();
		while (rs.next()) {
			MSDefinitionEntity defEntity = new MSDefinitionEntity();
			defEntity.setDefId(rs.getInt("def_Id"));
			defEntity.setName(rs.getString("name"));
			defEntity.setCategory(rs.getString("category"));
			defEntity.setDescription(rs.getString("DESCRIPTION"));
			defEntity.setStatus(rs.getInt("status"));			
			msdefinitionEntities.add(defEntity);			
		}
		return msdefinitionEntities;
	}

	@Override
	public Collection<MSDefinitionEntity> findByCategory(String catagory) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from MS_defination where category=? and status = 1");
        pst.setString(1, catagory);
        ResultSet rs = pst.executeQuery();
        Collection<MSDefinitionEntity> msdefinitionEntities = new ArrayList<MSDefinitionEntity>();
        while (rs.next()) {
            MSDefinitionEntity defEntity = new MSDefinitionEntity();
            defEntity.setDefId(rs.getInt("def_Id"));
            defEntity.setName(rs.getString("name"));
            defEntity.setCategory(rs.getString("category"));
            defEntity.setDescription(rs.getString("DESCRIPTION"));
            defEntity.setStatus(rs.getInt("status"));
            defEntity.setCustomN1(rs.getInt("CUSTOM_N1"));
            defEntity.setCustomN2(rs.getInt("CUSTOM_N2"));
            defEntity.setCustomN3(rs.getInt("CUSTOM_N3"));
            defEntity.setCustomV1(rs.getString("CUSTOM_V1"));
            defEntity.setCustomV2(rs.getString("CUSTOM_V2"));
            defEntity.setCustomV3(rs.getString("CUSTOM_V3"));
            msdefinitionEntities.add(defEntity);
            
        }
        return msdefinitionEntities;
	}
	
	@Override
	public Collection<String> getAllCategories() throws Exception {
		PreparedStatement pst = con.prepareStatement("select distinct(category) from MS_defination where status=1");
		ResultSet rs = pst.executeQuery();
		Collection<String> catagoriesList = new ArrayList<String>();
		while (rs.next()) {
			catagoriesList.add(rs.getString("category"));
		}
		return catagoriesList;
	}

	@Override
	public MSDefinitionEntity findByDefId(int def_Id) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from MS_defination where DEF_ID=" + def_Id);
		ResultSet rs = pst.executeQuery();
		MSDefinitionEntity defEntity = null;
		while(rs.next()) {
			defEntity = new MSDefinitionEntity();
			defEntity.setDefId(rs.getInt("def_Id"));
            defEntity.setName(rs.getString("name"));
            defEntity.setCategory(rs.getString("CATEGORY"));
            defEntity.setDescription(rs.getString("DESCRIPTION"));
            defEntity.setStatus(rs.getInt("status"));
            defEntity.setCustomN1(rs.getInt("custom_N1"));
            defEntity.setCustomN2(rs.getInt("custom_N2"));
            defEntity.setCustomN3(rs.getInt("custom_N3"));
            defEntity.setCustomV1(rs.getString("custom_V1"));
            defEntity.setCustomV2(rs.getString("custom_V2"));
            defEntity.setCustomV3(rs.getString("custom_V3"));
		}				
		return defEntity;
	}
 
	@Override
	public String createDefinition(MSDefinitionEntity msEntity) throws Exception {

		PreparedStatement pst = con.prepareStatement("insert into MS_defination(def_Id, name, category, status, DESCRIPTION) values(?, ?, ?, ?, ?)");
		
		pst.setInt(1, msEntity.getDefId());
		pst.setString(2, msEntity.getName());
		pst.setString(3, msEntity.getCategory());
		pst.setInt(4, msEntity.getStatus());
		pst.setString(5, msEntity.getDescription());
		
		int status = pst.executeUpdate();
		return status>0? "success":"error";

	}

	@Override
	public int getMaxDefIdByCategory(String category) throws Exception {
		PreparedStatement pst = con.prepareStatement("select max(def_id) as MAX_defId from MS_defination where category='"+category+"'");
		ResultSet rs = pst.executeQuery();
		int maxDefId=0;
		while (rs.next()) {
			
			maxDefId = rs.getInt("MAX_defId");
		}		
		return  maxDefId;
	}

	@Override
	public String updateDefinition(MSDefinitionEntity msEntity) throws Exception {
		PreparedStatement pst = con.prepareStatement("update MS_defination set name=?, category=?, status=?, DESCRIPTION=?,custom_N1=?,custom_N2=?,custom_N3=?,custom_V1=?,custom_V2=?,custom_V3=? where def_Id=?");
		pst.setString(1, msEntity.getName());
		pst.setString(2, msEntity.getCategory());
		pst.setInt(3, msEntity.getStatus());
		pst.setString(4, msEntity.getDescription());
		pst.setInt(5, msEntity.getCustomN1());
		pst.setInt(6, msEntity.getCustomN2());
		pst.setInt(7, msEntity.getCustomN3());
		pst.setString(8, msEntity.getCustomV1());
		pst.setString(9, msEntity.getCustomV2());
		pst.setString(10, msEntity.getCustomV3());
		pst.setInt(11, msEntity.getDefId());
		int status = pst.executeUpdate();
		return status>0? "success":"error";
	}

	@Override
	public MSDefinitionEntity findByNameAndCategory(String name, String category) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from MS_defination where name='" + name+"' and category='"+category+"'");
		ResultSet rs = pst.executeQuery();
		MSDefinitionEntity defEntity = null;
		while(rs.next()) {
			defEntity = new MSDefinitionEntity();
			defEntity.setDefId(rs.getInt("def_Id"));
            defEntity.setName(rs.getString("name"));
            defEntity.setCategory(rs.getString("category"));
            defEntity.setDescription(rs.getString("DESCRIPTION"));
            defEntity.setStatus(rs.getInt("status"));
            defEntity.setCustomN1(rs.getInt("custom_N1"));
            defEntity.setCustomN2(rs.getInt("custom_N2"));
            defEntity.setCustomN3(rs.getInt("custom_N3"));
            defEntity.setCustomV1(rs.getString("custom_V1"));
            defEntity.setCustomV2(rs.getString("custom_V2"));
            defEntity.setCustomV3(rs.getString("custom_V3"));
		}				
		return defEntity;
	}

	@Override
	public Collection<MSDefinitionEntity> findByReligion(String religion) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from MS_defination where category=? ");
        pst.setString(1, religion);
        ResultSet rs = pst.executeQuery();
        Collection<MSDefinitionEntity> msdefinitionEntities = new ArrayList<MSDefinitionEntity>();
        while (rs.next()) {
            MSDefinitionEntity defEntity = new MSDefinitionEntity();
            defEntity.setDefId(rs.getInt("def_Id"));
            defEntity.setName(rs.getString("name"));
            defEntity.setCategory(rs.getString("category"));
            defEntity.setDescription(rs.getString("DESCRIPTION"));
            defEntity.setStatus(rs.getInt("status"));
            defEntity.setCustomN1(rs.getInt("custom_N1"));
            defEntity.setCustomN2(rs.getInt("custom_N2"));
            defEntity.setCustomN3(rs.getInt("custom_N3"));
            defEntity.setCustomV1(rs.getString("custom_V1"));
            defEntity.setCustomV2(rs.getString("custom_V2"));
            defEntity.setCustomV3(rs.getString("custom_V3"));
            msdefinitionEntities.add(defEntity);
            
        }
        return msdefinitionEntities;
	}

	
}

