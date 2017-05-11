import entity.User;
import mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 20:05
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestDemo {
  @Autowired
  private UserMapper userMapper;
  @Autowired
  private UserService service;

    public void setService(UserService service) {
        this.service = service;
    }

    @Test
  public void add()throws Exception{
      User user = new User();
      user.setGender(false);
      user.setAccount("a001");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
       String formatstr = simpleDateFormat.format(new Date());
       System.out.println(formatstr);
      user.setBirthday(simpleDateFormat.parse(formatstr));
      user.setDept("开发部");
      user.setEmail("1001222");
      user.setState("1");
      user.setNamne("张三");
      user.setMemo("哈哈");
      user.setMobile("ooo");
      user.setHeadimg("111");
       for (int i = 0;i<=100;i++){
           service.add(user);
       }
  }
    @Test
    public void delete()throws Exception{
       service.delete(1);
    }
    @Test
    public void findByid()throws Exception{
//        List<User> byId = service.getAll();
//        for (User user:byId){
//             Date date = user.getBirthday();
//           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
//           String format = simpleDateFormat.format(date);
//           System.out.println(format);
//
//        }
    }
}
