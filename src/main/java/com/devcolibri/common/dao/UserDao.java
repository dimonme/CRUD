package com.devcolibri.common.dao;


import com.devcolibri.common.model.User;

import java.util.List;

public interface UserDao {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);//method poluchaet Usera s pomoschiu id

    public List<User> getUsersByName(String userName);

    public List<User> listUsers(); //vivodit spisok Users

}
