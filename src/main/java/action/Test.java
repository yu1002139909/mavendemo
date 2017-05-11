package action;

import dao.EmpDao;
import entity.Emp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by yuyu on 2017/3/22.
 */
//声明为一个控制类
@Controller
public class Test {
    private EmpDao empDao;
    @Resource(name="studentDaoID")
    public void setEmpDao(EmpDao empDao) {
        this.empDao = empDao;
    }

    //设置访问路径
    @RequestMapping(value = "/hello.action")
    public String index(final Model model, String eid,String ename,String esal,String esex) {
        System.out.println("简介");
        System.out.println(eid);
        System.out.println(ename);
        System.out.println(esal);
        System.out.println(esex);
        model.addAttribute("message", "注解");
        return "index";
    }
    /**
     * 注册员工
     */
    @RequestMapping(value="/regest.action")
    public String registerMethod(Emp emp, Model model, @RequestParam(value="file", required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
        //调用dao
        //获取webapp的物理路劲
        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path="";
        if(!file.isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=file.getContentType();
            //获得文件后缀名称
            System.out.println(contentType);
            String imageName=contentType.substring(contentType.indexOf("/")+1);
            path="/static/images/"+uuid+".jpg";
            emp.setImg(path);
            file.transferTo(new File(pathRoot+path));
        }
        empDao.add(emp);
        List<Emp> list =  empDao.getall();
        model.addAttribute("list",list);
        return "list";
    }
    /*
    修改员工信息
     */
    @RequestMapping(value = "/eidemp.action")
    public String update(String eid, Model model, HttpServletRequest request){
       Emp emp =  empDao.findById(request.getParameter("eid"));
        model.addAttribute("emp",emp);
        return "eidui";
    }
}

