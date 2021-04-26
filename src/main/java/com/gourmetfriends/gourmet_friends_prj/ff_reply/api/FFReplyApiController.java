package com.gourmetfriends.gourmet_friends_prj.ff_reply.api;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.domain.FFReply;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.service.FFReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/replies")
@RequiredArgsConstructor
@Log4j2
public class FFReplyApiController {

    private final FFReplyService ffReplyService;

    //댓글 목록 조회
    @GetMapping("/{ffBno}/{page}")
    public ResponseEntity<Map<String,Object>> getList(
            @PathVariable Long ffBno,
            @PathVariable int page){
        log.info("/api/v1/replies/" + ffBno + "/" + page + "GET");
        Criteria cri = new Criteria(page, 10);
        Map<String,Object> replies = ffReplyService.getList(ffBno,cri);
        return new ResponseEntity<>(replies, HttpStatus.OK);
    }

    //댓글 개별 조회
    @GetMapping("/{ffRno}")
    public ResponseEntity<FFReply> get(@PathVariable Long ffRno) {
        log.info("/api/v1/replies/" + ffRno + " : GET!!");
        return new ResponseEntity<>(ffReplyService.get(ffRno), HttpStatus.OK);
    }

    //댓글 등록
    @PostMapping("/")
    public ResponseEntity<String> create(@RequestBody FFReply ffReply) {
        log.info("/api/v1/replies/ POST : " + ffReply);

        int count = ffReplyService.register(ffReply);

        return count == 1 ?
                new ResponseEntity<>("regSuccess", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    //댓글 수정
    @PutMapping("/{ffRno}")
    @PatchMapping("/{ffRno}")
    public ResponseEntity<String> modify(@PathVariable Long ffRno, @RequestBody FFReply ffReply){
        ffReply.setFfRno(ffRno);
        log.info("/api/v1/replies/" + ffRno + "PUT: " + ffReply);
        int modCount = ffReplyService.modify(ffReply);
        return modCount == 1 ?
                new ResponseEntity<>("modSuccess",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //댓글 삭제
    @DeleteMapping("/{ffBno}/{ffRno}")
    public ResponseEntity<String> delete(@PathVariable Long ffRno,@PathVariable Long ffBno){

        log.info("/api/v1/replies/" + ffBno + "/" + ffRno + "DELETE");
        int delCount = ffReplyService.remove(ffBno, ffRno);

        return delCount == 1 ?
                new ResponseEntity<>("delSuccess",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
