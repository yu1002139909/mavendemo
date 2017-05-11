import entity.User;
import mapper.UserMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/13 10:07
 */
public class TestPage {
    @Test
    public void  select() {
        // 创建一个spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 从spring容器中获取mapper代理对象
        UserMapper mapper = context.getBean(UserMapper.class);
        UserService userService = context.getBean(UserService.class);
        Map<String,Integer> map = new HashMap<String,Integer>();
        map.put("pstart",0);
        map.put("size",10);
        List<User> users = userService.pageDate(map);
        for (User user: users){
            System.out.println(user.getId());
        }
    }
}