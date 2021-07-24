package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.MenuService;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import com.gourmetfriends.gourmet_friends_prj.utils.UploadFileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
@Log4j2
public class AdminController {

    private final RestaurantService restaurantService;
    private final MenuService menuService;

    private static final String REST_UPLOAD_PATH = "F:\\\\GourmetFriends\\\\src\\\\main\\\\resources\\\\static";
    private static final String MENU_UPLOAD_PATH = "F:\\\\GourmetFriends\\\\src\\\\main\\\\resources\\\\static";

    //관리자 메인 페이지 접속
    @GetMapping("/manager")
    public String adminManager(){
        log.info("/admin/manager 관리자 페이지 이동");
        return "admin/manager";
    }

    //메뉴 등록 페이지 접속
    @GetMapping("/menu_insert")
    public String menuInsert(){
        log.info("/admin/menu_insert 메뉴 등록 페이지 이동");
        return "admin/menu_insert";
    }

    //음식점 관리 페이지 접속
    @GetMapping("/rest_manage")
    public String restManage(Criteria cri, Model model){
        log.info("/admin/rest_manage 음식점 관리 페이지 이동");
        List restList = restaurantService.restList(cri);

        if(!restList.isEmpty()){
            model.addAttribute("restList",restList);
        }else {
            model.addAttribute("restListChk","empty");
        }

        int total = restaurantService.restGetTotal(cri);

        model.addAttribute("pageInfo", new PageMaker(cri, restaurantService.restGetTotal(cri)));

        return "admin/rest_manage";
    }

    //음식점 등록 페이지 접속
    @GetMapping("/rest_insert")
    public String restInsert(Model model) throws Exception {
        log.info("/admin/rest_insert 음식점 등록 페이지 이동");

        ObjectMapper objm = new ObjectMapper();

        List list = restaurantService.cateList();

        String cateList = objm.writeValueAsString(list);

        model.addAttribute("cateList",cateList);

        return "admin/rest_insert";
    }

    //메뉴 등록
    @PostMapping("/menu_insert")
    public String menuInsert(Menu menu, MultipartFile file ,RedirectAttributes ra) throws Exception {
        log.info("/admin/menu_insert POST요청: " + menu);

        String imgUploadPath = MENU_UPLOAD_PATH + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
        String fileName = null;

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

            menu.setMenuImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
            menu.setMenuThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        } else {
            fileName = MENU_UPLOAD_PATH + File.separator + "img" + File.separator + "none.png";
            menu.setMenuImg(fileName);
            menu.setMenuThumbImg(fileName);
        }

        menuService.menuInsert(menu);
        ra.addFlashAttribute("insert_result", menu.getMenuName());
        return "redirect:/admin/menu_manage";
    }

    //음식점 검색 팝업창
    @GetMapping("/rest_pop")
    public void restPop(Criteria cri, Model model){
        log.info("/admin/rest_pop GET요청");

        List restList1 = restaurantService.restList(cri);

        if(!restList1.isEmpty()){
            model.addAttribute("restList",restList1);
        }else {
            model.addAttribute("restListChk","empty");
        }

        int total = restaurantService.restGetTotal(cri);

        model.addAttribute("pageInfo", new PageMaker(cri, restaurantService.restGetTotal(cri)));
    }

    //메뉴 관리 페이지 접속
    @GetMapping("/menu_manage")
    public void menuManage(Criteria cri, Model model){
        log.info("/admin/menu_manage GET요청");

        List menuList = menuService.menuList(cri);

        if(!menuList.isEmpty()){
            model.addAttribute("menuList", menuList);
        }else {
            model.addAttribute("menuListChk","empty");
            return;
        }

        int total = menuService.menuGetTotal(cri);

        model.addAttribute("pageInfo",new PageMaker(cri, menuService.menuGetTotal(cri)));
    }

    //메뉴 조회
    @GetMapping({"/menu_detail","menu_modify"})
    public void menuGetInfo(Long menuNo, Criteria cri, Model model){
        log.info("/admin/menu_detail GET요청");

        model.addAttribute("cri",cri);

        model.addAttribute("menuInfo",menuService.menuGetDetail(menuNo));
    }

    //메뉴 정보 수정
    @PostMapping("/menu_modify")
    public String menuModify(Menu menu, MultipartFile file, HttpServletRequest req, RedirectAttributes ra) throws Exception {
        log.info("/admin/menu_modify POST요청: " + menu);

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            new File(MENU_UPLOAD_PATH + req.getParameter("menuImg")).delete();
            new File(MENU_UPLOAD_PATH + req.getParameter("menuThumbImg")).delete();

            String imgUploadPath = MENU_UPLOAD_PATH + File.separator + "imgUpload";
            String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
            String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),ymdPath);

            menu.setMenuImg(File.separator + "imgUpload"+ ymdPath + File.separator + fileName);
            menu.setMenuThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        }else {
            menu.setMenuImg(req.getParameter("menuImg"));
            menu.setMenuThumbImg(req.getParameter("menuThumbImg"));
        }

        int result = menuService.menuModify(menu);
        ra.addFlashAttribute("modify_result",result);

        return "redirect:/admin/menu_manage";
    }

    //메뉴 삭제
    @PostMapping("/menu_delete")
    public String menuDelete(Long menuNo, RedirectAttributes ra){
        log.info("/admin/menu_delete POST요청: " + menuNo);

        int result = menuService.menuDelete(menuNo);

        ra.addFlashAttribute("delete_result",result);

        return "redirect:/admin/menu_manage";
    }


    //음식점 등록
    @PostMapping("/rest_insert")
    public String restInsert(Restaurant restaurant, MultipartFile file, RedirectAttributes ra) throws Exception {
        log.info("/admin/rest_insert POST요청: " + restaurant);

        String imgUploadPath = REST_UPLOAD_PATH + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
        String fileName = null;

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            fileName = UploadFileUtils.fileUpload(imgUploadPath,file.getOriginalFilename(), file.getBytes(), ymdPath);
            restaurant.setRestImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
            restaurant.setRestThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" +fileName);
        } else {
            fileName = REST_UPLOAD_PATH + File.separator + "img" + File.separator + "none.png";

            restaurant.setRestImg(fileName);
            restaurant.setRestThumbImg(fileName);
        }


        restaurantService.restInsert(restaurant);
        ra.addFlashAttribute("insert_result",restaurant.getRestName());
        return "redirect:/admin/rest_manage";
    }

    //음식점 상세 페이지
    @GetMapping({"/rest_detail", "/rest_modify"})
    public void restGetInfo(Long restNo, Criteria cri, Model model) throws JsonProcessingException {
        log.info("/admin/rest_detail GET요청");
        ObjectMapper mapper = new ObjectMapper();
        model.addAttribute("cateList",mapper.writeValueAsString(restaurantService.cateList()));
        model.addAttribute("cri",cri);
        model.addAttribute("restInfo",restaurantService.restGetDetail(restNo));
    }

    //음식점 정보 수정
    @PostMapping("/rest_modify")
    public String restModify(Restaurant restaurant, MultipartFile file, HttpServletRequest req, RedirectAttributes ra) throws Exception {
        log.info("/admin/rest_modify POST요청: " + restaurant);

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            new File(REST_UPLOAD_PATH + req.getParameter("restImg")).delete();
            new File(REST_UPLOAD_PATH + req.getParameter("restThumbImg")).delete();

            String imgUploadPath = REST_UPLOAD_PATH + File.separator + "imgUpload";
            String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
            String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),ymdPath);

            restaurant.setRestImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
            restaurant.setRestThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        }else {
            restaurant.setRestImg(req.getParameter("restImg"));
            restaurant.setRestThumbImg(req.getParameter("restThumbImg"));
        }

        int result = restaurantService.restModify(restaurant);
        ra.addFlashAttribute("modify_result",result);
        return "redirect:/admin/rest_manage";
    }

    //음식점 정보 삭제
    @PostMapping("/rest_delete")
    public String restDelete(Long restNo, RedirectAttributes ra){
        log.info("/admin/rest_delete POST요청: " + restNo);
        int result = 0;

        try {
            result = restaurantService.restDelete(restNo);
        }catch (Exception e){
            e.printStackTrace();
            result = 2;
            ra.addFlashAttribute("delete_result", result);
            return "redirect:/admin/rest_manage";
        }
        ra.addFlashAttribute("delete_result",result);

        return "redirect:/admin/rest_manage";
    }


}
