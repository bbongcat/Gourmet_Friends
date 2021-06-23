package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import com.gourmetfriends.gourmet_friends_prj.restaurant.mapper.MenuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;

    @Override
    public void menuInsert(Menu menu) {
        menuMapper.menuInsert(menu);
    }
}
