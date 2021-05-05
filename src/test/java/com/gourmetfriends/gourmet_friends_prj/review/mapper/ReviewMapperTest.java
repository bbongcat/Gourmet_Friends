package com.gourmetfriends.gourmet_friends_prj.review.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import com.gourmetfriends.gourmet_friends_prj.review.service.ReviewService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewMapperTest {

    @Autowired ReviewMapper reviewMapper;
    @Autowired ReviewService reviewService;

    @Test
    @DisplayName("데이터 베이스에서 게시글 전체를 조회할 수 있어야 한다.")
    void revFindAllTest(){
        List<Review> reviewList = reviewMapper.revGetList();

        assertTrue(reviewList.size() == 6);

        for (Review review : reviewList) {
            System.out.println(review);
        }
    }

    @Test
    @DisplayName("데이터베이스 저장에 성공해야한다.")
    void revInsertTest(){
        Review newReview = new Review();
        newReview.setRestNo(2L);
        newReview.setRevContent("리뷰내용2-2");
        newReview.setRevStar(5L);
        newReview.setUserId("fff3456");

        reviewMapper.revWrite(newReview);

        assertTrue(reviewMapper.revGetList().get(0).getRevBno() == 7);
    }

    @Test
    @DisplayName("글 번호를 전달하면 해당 글 정보를 얻어야 한다.")
    void revFindOneTest(){
        Review review = reviewMapper.revFindByBno(3L);
        System.out.println("review = " + review);

        assertTrue(review.getRevBno() == 3);
    }

    @Test
    @DisplayName("글내용,음식점 번호,작성자를 수정할 수 있어야 한다.")
    void revUpdateTest(){
        Review newReview = new Review();
        newReview.setRestNo(1L);
        newReview.setRevContent("리뷰내용 수정");
        newReview.setRevStar(4L);
        newReview.setUserId("rrr4567");
        newReview.setRevBno(4L);

        reviewMapper.revUpdate(newReview);

        assertTrue(reviewMapper.revFindByBno(4L).getUserId().equals("rrr4567"));

    }

    @Test
    @DisplayName("글번호를 전달하면 해당 글 정보가 삭제되어야 한다.")
    void revDeleteTest(){
        reviewMapper.revDelete(1L);

        assertNull(reviewMapper.revFindByBno(1L));
    }

    @Test
    @DisplayName("페이지 정보대로 목록이 조회되어야 한다.")
    void revPagingTest(){
        Criteria cri = new Criteria(1,10,0);
        List<Review> reviewList = reviewMapper.revGetListWithPaging(cri);

        for (Review review : reviewList) {
            System.out.println(review);
        }
    }

    @Test
    @DisplayName("총 게시물 수를 잘 조회해야 한다.")
    void revTotalCountTest(){
        int revTotalCount = reviewMapper.revGetTotalCount();

        System.out.println("revTotalCount = " + revTotalCount);

        assertTrue(revTotalCount == 6);
    }

    @Test
    @DisplayName("음식점 코드번호로 검색 수행")
    void revSearchByRestNoTest(){
        Criteria cri = new Criteria();
        cri.setKeyword("1");

        List<Review> reviewList = reviewMapper.revGetListByRestNo(cri);
        for (Review review : reviewList) {
            System.out.println(review);
        }
    }

    @Test
    @DisplayName("포토 첨부 기능 테스트")
    void addRevPhotoTest(){

        Review review = new Review();
        review.setRestNo(2L);
        review.setRevContent("사진리뷰");
        review.setRevStar(3L);
        review.setUserId("hhh9999");
        review.setRevPhotos(Arrays.asList("dog.jpg","cat.jpg"));

        reviewService.revRegister(review);
    }


}