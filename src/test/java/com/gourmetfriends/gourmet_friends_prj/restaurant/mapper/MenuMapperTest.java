package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MenuMapperTest {

    @Autowired
    MenuMapper menuMapper;

    @Test
    void menuInserTest(){

        Menu menu = new Menu();

        menu.setMenuNo(1L);
        menu.setMenuName("비빔밥");
        menu.setRestName("계절밥상");
        menu.setMenuPrice(11000L);
        menu.setMenuIntro("대표적인 한국 요리의 하나로, 밥에 고기나 나물, 달걀 등과 고추장, 참기름 등 양념을 넣고 비벼서 섞어 먹는 음식");
        menu.setMenuImg("비빔밥.jpg");

        menuMapper.menuInsert(menu);
    }

}