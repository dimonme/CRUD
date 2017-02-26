package com.devcolibri.common.controller;

import com.devcolibri.common.model.User;
import com.devcolibri.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController
{
    private UserService userService;

    @Autowired(required = true) //automaticheskoe svyasivanie
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //search
    @RequestMapping(value = "/search", method = RequestMethod.GET)
     public String getUsersByName(@RequestParam("requestName") String requestName,Model model)
        {
            model.addAttribute("user",new User());
            model.addAttribute("listUsers", userService.getUsersByName(requestName));
            return "search";
        }

    //poluchaem spisok users
    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers( Model model)
    {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";  //return "WEB-INF/pages/users.jsp";
    }

    //sposob dobavlyat users, nuzna dopolnitelnaya stranica
    @RequestMapping(value = "/users/add", method =RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user)
    {
        if (user.getId() == 0) //if id=0 to dobavlyaem usera
        {
            this.userService.addUser(user);
        }
        else
        {
            this.userService.updateUser(user);
        }

        return "redirect:/users"; //perenapravlyaemsya na glavnuyu stranicu users
    }

    //stranica chtobi udalyat users
    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id)
    {
        this.userService.removeUser(id);

        return "redirect:/users";
    }

    //method redaktirovaniya users
    @RequestMapping("edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers()); //vivodim vsex users

        return "users"; //vozvraschaemsya na stranicu users
    }

    //prosmatrivat dannie na kazdoi otdelnoi stranice
    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("user",this.userService.getUserById(id));

        return "userdata";
    }
}
