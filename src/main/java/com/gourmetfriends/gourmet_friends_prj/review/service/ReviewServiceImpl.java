package com.gourmetfriends.gourmet_friends_prj.review.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import com.gourmetfriends.gourmet_friends_prj.review.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;

    @Transactional
    @Override
    public void register(Review review) {
        reviewMapper.write(review);

        //첨부파일이 있는 경우
        List<String> revPhoto = review.getRevPhoto();
        if(revPhoto != null){
            for (String photo : revPhoto) {
                reviewMapper.addRevPhoto(photo);
            }
        }
    }

    @Override
    public Review get(Long revBno) {
        return reviewMapper.findByBno(revBno);
    }

    @Override
    public List<String> getRevPhoto(Long revBno) {
        return reviewMapper.findRevPhoto(revBno);
    }

    @Override
    public boolean modify(Review review) {
        return reviewMapper.update(review) == 1;
    }

    @Override
    public boolean remove(Long revBno) {
        return reviewMapper.delete(revBno) == 1;
    }

    @Override
    public List<Review> getList(Criteria cri) {
        return reviewMapper.getListWithPaging(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return reviewMapper.getSearchTotal(cri);
    }

    @Override
    public List<Review> searchList(Criteria cri) {
        return reviewMapper.getSearchList(cri);
    }
}
