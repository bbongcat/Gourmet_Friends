package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {

    //메뉴 등록
    void menuInsert(Menu menu);

    //메뉴 리스트
    List<Menu> menuList(Criteria cri);

    //메뉴 총 개수
    int menuGetTotal(Criteria cri);

    //메뉴 조회
    Menu menuGetDetail(Long menuNo);

    //메뉴 수정
    int menuModify(Menu menu);

    //메뉴 삭제
    int menuDelete(Long menuNo);

    List<Menu> restMenuList(Long restNo);
}
