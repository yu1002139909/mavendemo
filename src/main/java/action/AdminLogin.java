package action;

import exception.CustomException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author qq_emial1002139909@qq.com
 * @Date 2017/4/17 17:21
 */
@Controller
public class AdminLogin {
    //如果登录失败，从request域名取出登录异常信息
    @RequestMapping("adminlogin.action")
    public String login(HttpServletRequest request) throws  Exception{
      String shiroLoingexception = (String) request.getAttribute("shiroLoginFailure");
        System.out.println("哈哈哈");
      if (shiroLoingexception!=null){
          if(UnknownAccountException.class.getName().equals(shiroLoingexception)){
              throw  new CustomException("账户不存在");
          }
          else if(IncorrectCredentialsException.class.getName().equals(shiroLoingexception)){
              throw  new CustomException("账户/密码错误");
          }
          else {
              throw  new Exception();
          }
      }
      return "login";
   }
}
