package src.main.java.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import src.main.java.mapper.Xx;
import src.main.java.mapper.XxExample;

public interface XxMapper {
    int countByExample(XxExample example);

    int deleteByExample(XxExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Xx record);

    int insertSelective(Xx record);

    List<Xx> selectByExample(XxExample example);

    Xx selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Xx record, @Param("example") XxExample example);

    int updateByExample(@Param("record") Xx record, @Param("example") XxExample example);

    int updateByPrimaryKeySelective(Xx record);

    int updateByPrimaryKey(Xx record);
}