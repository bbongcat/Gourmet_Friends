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
    public void revRegister(Review review) {
        reviewMapper.revWrite(review);

        //첨부파일이 있는 경우
        List<String> revPhotos = review.getRevPhotos();
        if(revPhotos != null){
            for (String photo : revPhotos) {
                reviewMapper.addRevPhoto(photo);
            }
        }
    }

    @Override
    public Review revGet(Long revBno) {
        return reviewMapper.revFindByBno(revBno);
    }

    @Override
    public List<String> getRevPhoto(Long revBno) {
        return reviewMapper.findRevPhoto(revBno);
    }

    @Override
    public boolean revModify(Review review) {
        return reviewMapper.revUpdate(review) == 1;
    }

    @Override
    public boolean revRemove(Long revBno) {
        return reviewMapper.revDelete(revBno) == 1;
    }

    @Override
    public List<Review> revGetList(Criteria cri) {
        return reviewMapper.revGetListWithPaging(cri);
    }

    @Override
    public int revGetTotal( Criteria cri) {
        return reviewMapper.revGetSearchTotal(cri);
    }

    @Override
    public List<Review> revSearchList(Criteria cri) {
        return reviewMapper.revGetSearchList(cri);
    }


}
