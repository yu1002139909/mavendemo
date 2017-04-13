package service.impl;

import mapper.Admin;
import mapper.AdminExample;
import mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import service.AdminService;

import java.util.List;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 19:42
 */
public class AdminServiceImpl implements AdminService{
    //注入mapper
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private AdminExample adminExample;

    public void setAdminExample(AdminExample adminExample) {
        this.adminExample = adminExample;
    }

    @Override
    public void add(Admin admin) throws Exception {
         adminMapper.insert(admin);
    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public Admin findById(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<Admin> getAll() throws Exception {
        return null;
    }

    @Override
    public void update(Admin admin) throws Exception {

    }
}
