package service;

import mapper.Admin;

import java.util.List;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 15:37
 */
public interface AdminService {
    public void add(Admin admin) throws Exception;
    public void delete(Integer id) throws Exception;
    public Admin findById(Integer id) throws Exception;
    public List<Admin> getAll() throws Exception;
    public void update(Admin admin) throws Exception;
}
