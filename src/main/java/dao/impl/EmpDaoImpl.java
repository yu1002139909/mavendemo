package dao.impl;

import dao.EmpDao;
import entity.Emp;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/3/30 20:47
 */
public class EmpDaoImpl implements EmpDao {
    private SqlSessionFactory sqlSessionFactory;

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public void add(Emp emp) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.insert("empNamespace.add",emp);
        sqlSession.close();
    }

    @Override
    public List<Emp> getall() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        return sqlSession.selectList("empNamespace.getAll");
    }

    @Override
    public void update(Emp emp) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.update("empNamespace.update",emp);
        sqlSession.close();
    }

    @Override
    public Emp findById(String empId) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
         return sqlSession.selectOne("empNamespace.findById",empId);
    }

}
