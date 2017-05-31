package yeleia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import yeleia.entity.Type;
import yeleia.service.BlogService;
import yeleia.service.TypeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-16.
 */
@Controller
public class TypeController {
    @Resource
    private TypeService typeService;
    @Resource
    private BlogService blogService;
    @RequestMapping("/type")
    public ModelAndView hh(){
        List<Type> type=typeService.selectType();
        return new ModelAndView("typeGl","type",type);
    }
    @RequestMapping("/addType")
    public String addType(Type type){
        typeService.addType(type);
        return "redirect:/type";
    }
    @RequestMapping("/deleteType")
    public String deleteType(@RequestParam(value = "id")Integer id){
        Type type=typeService.selectById(id);
        typeService.deleteType(id);
        blogService.updateType(type.getBlogType());
        return "redirect:/type";
    }
}
