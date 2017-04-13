package service;


import entity.User;

import java.util.List;
import java.util.Map;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 20:17
 */
public interface UserService {
    public void add(User user) throws Exception;
    public void delete(Integer id) throws Exception;
    public List<User> findById(Integer id) throws Exception;
    public List<User> getAll() throws Exception;
    public void update(User admin) throws Exception;
    public List<User> pageDate(Map<String,Integer> map);
    public Integer allCount();
}
