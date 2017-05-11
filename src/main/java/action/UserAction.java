package action;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/12 20:40
 */
@Controller
public class UserAction {
    @Autowired
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @RequestMapping(value = "/userlist.action")
    public String  list(Model model,Integer start) throws Exception {
        Map<String,Integer> map = new HashMap<String,Integer>();
        System.out.println(start);
        //如果首次请求aciton,默认显示第一页
        if(start==null){
            start = 0;
        }

        System.out.println(start);
        map.put("pstart",start);
        map.put("size",10);
        List<User> userlist = userService.pageDate(map);
       model.addAttribute("userlist",userlist);
       Integer allCount = userService.allCount();
       model.addAttribute("allcount",allCount);
       model.addAttribute("start",start);
       return "userlist";
    }
}
