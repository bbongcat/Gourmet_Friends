package com.gourmetfriends.gourmet_friends_prj.rev_reply.api;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.domain.RevReply;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.service.RevReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v2/replies")
@RequiredArgsConstructor
@Log4j2
public class RevReplyApiController {

    private final RevReplyService revReplyService;

    //리뷰 댓글 목록 조회
    @GetMapping("/{revBno}/{page}")
    public ResponseEntity<Map<String,Object>> revGetList(
            @PathVariable Long revBno,
            @PathVariable int page
    ){
        log.info("/api/v2/replies/" + revBno + "/" + page + " GET");
        Criteria cri = new Criteria(page, 10,0);

        Map<String, Object> replies = revReplyService.revGetList(revBno, cri);

        return new ResponseEntity<>(replies, HttpStatus.OK);
    }

    //리뷰 댓글 개별 조회
    @GetMapping("/{revRno}")
    public ResponseEntity<RevReply> revGet(@PathVariable Long revRno){
        log.info("/api/v2/replies/" + revRno + " :GET");
        return new ResponseEntity<>(revReplyService.revGet(revRno),HttpStatus.OK);
    }

    //리뷰 댓글 등록
    @PostMapping("/")
    public ResponseEntity<String> revCreate(@RequestBody RevReply revReply){
        log.info("/api/v2/replies/ POST: " + revReply);

        int count = revReplyService.revRegister(revReply);
        System.out.println(revReply);

        System.out.println(count);

        return count == 1 ?
                new ResponseEntity<>("regSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    //리뷰 댓글 수정
    @PutMapping("/{revRno}")
    @PatchMapping("/{revRno}")
    public ResponseEntity<String> revModify(@PathVariable Long revRno, @RequestBody RevReply revReply){
        revReply.setRevRno(revRno);
        log.info("/api/v2/replies/" + revRno + "PUT: " + revReply);
        int modCount = revReplyService.revModify(revReply);
        return modCount == 1 ?
                new ResponseEntity<>("modSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //리뷰 댓글 삭제
    @DeleteMapping("/{revBno}/{revRno}")
    public ResponseEntity<String> revDelete(@PathVariable Long revRno, @PathVariable Long revBno){
        log.info("/api/v2/replies/" + revBno + "/" + revRno + "DELETE");
        int delCount = revReplyService.revRemove(revBno, revRno);
        return delCount == 1 ?
                new ResponseEntity<>("delSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
