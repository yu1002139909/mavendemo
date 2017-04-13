package service.impl;

import entity.User;
import mapper.UserExample;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import service.UserService;

import java.util.List;
import java.util.Map;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 20:18
 */
public class UserServiceImpl implements UserService {
    /*
    注入mapper
     */
    @Autowired
    private UserExample userExample;
    @Autowired
    private UserMapper userMapper;

    public void setUserExample(UserExample userExample) {
        this.userExample = userExample;
    }

    public void add(User user) throws Exception {
          userMapper.insert(user);
    }

    @Override
    public void delete(Integer id) throws Exception {
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andIdEqualTo(id);
        userMapper.deleteByExample(userExample);
    }

    @Override
    public List<User> findById(Integer id) throws Exception {
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andIdEqualTo(id);
        return userMapper.selectByExample(userExample);
    }

    @Override
    public List<User> getAll() throws Exception {
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andIdIsNotNull();
        return userMapper.selectByExample(userExample);
    }

    @Override
    public void update(User admin) throws Exception {

    }

    @Override
    public List<User> pageDate(Map<String,Integer> map) {
         return userMapper.pageDate(map);
    }

    @Override
    public Integer allCount() {
        return userMapper.countByExample(userExample);
    }
}
