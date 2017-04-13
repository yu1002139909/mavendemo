package dao;

import entity.Emp;

import java.util.List;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/3/30 20:48
 */
public interface EmpDao {
    public void add(Emp emp);
    public List<Emp> getall();
    public void update(Emp emp);
    public Emp findById(String empId);

}
