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
@RequestMapping("/api/v1/rev_replies")
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
        log.info("/api/v1/rev_replies/" + revBno + "/" + page + "GET");
        Criteria cri = new Criteria(page, 10,0);

        Map<String, Object> revReplies = revReplyService.revGetList(revBno, cri);

        return new ResponseEntity<>(revReplies, HttpStatus.OK);
    }

    //리뷰 댓글 개별 조회
    @GetMapping("/{revRno}")
    public ResponseEntity<RevReply> revGet(@PathVariable Long revRno){
        log.info("/api/v1/rev_replies/" + revRno + " :GET");
        return new ResponseEntity<>(revReplyService.revGet(revRno),HttpStatus.OK);
    }

    //리뷰 댓글 등록
    @PostMapping("/{revRno}")
    public ResponseEntity<String> revCreate(@RequestBody RevReply revReply){
        log.info("/api/v1/rev_replies/ POST: " + revReply);

        int revRegCount = revReplyService.revRegister(revReply);

        return revRegCount == 1 ?
                new ResponseEntity<>("regSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //리뷰 댓글 수정
    @PutMapping("/{revRno}")
    @PatchMapping("{revRno}")
    public ResponseEntity<String> revModify(@PathVariable Long revRno, @RequestBody RevReply revReply){
        revReply.setRevRno(revRno);
        log.info("/api/v1/rev_replies/" + revRno + "PUT: " + revReply);
        int revModCount = revReplyService.revModify(revReply);
        return revModCount == 1 ?
                new ResponseEntity<>("modSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //리뷰 댓글 삭제
    @DeleteMapping("/{revBno}/{revRno}")
    public ResponseEntity<String> revDelete(@PathVariable Long revRno, @PathVariable Long revBno){
        log.info("/api/v1/rev_replies/" + revBno + "/" + revRno + "DELETE");
        int revDelCount = revReplyService.revRemove(revBno, revRno);
        return revDelCount == 1 ?
                new ResponseEntity<>("delSuccess", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
