package action;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import java.util.List;

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
    public String  list(Model model) throws Exception {
        List<User> userlist = userService.getAll();
        model.addAttribute("userlist",userlist);
        return "userlist";
    }
}
