import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.User;
import mapper.UserExample;
import mapper.UserMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

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
        UserExample example = new UserExample();
        //分页处理，显示第一页的10条数据
        PageHelper.startPage(1, 5);
        List<User> list = mapper.selectByExample(example);//查询

        for(User user : list) {
            System.out.println(user.getNamne());
        }
        System.out.println("分页");
        // 取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        long total = pageInfo.getTotal(); //获取总记录数
        System.out.println("共有用户信息：" + total);
    }
}
