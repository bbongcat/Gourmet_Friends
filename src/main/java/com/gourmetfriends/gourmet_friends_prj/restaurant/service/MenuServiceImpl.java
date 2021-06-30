package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import com.gourmetfriends.gourmet_friends_prj.restaurant.mapper.MenuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;

    @Transactional
    @Override
    public void menuInsert(Menu menu) {
        menuMapper.menuInsert(menu);
    }

    @Override
    public List<Menu> menuList(Criteria cri) {
        return menuMapper.menuList(cri);
    }

    @Override
    public int menuGetTotal(Criteria cri) {
        return menuMapper.menuGetTotal(cri);
    }

    @Override
    public Menu menuGetDetail(Long menuNo) {
        return menuMapper.menuGetDetail(menuNo);
    }

    @Override
    public int menuModify(Menu menu) {
        return menuMapper.menuModify(menu);
    }

    @Override
    public int menuDelete(Long menuNo) {
        return menuMapper.menuDelete(menuNo);
    }

    @Override
    public List<Menu> restMenuList(Long restNo) {
        return menuMapper.restMenuList(restNo);
    }
}
