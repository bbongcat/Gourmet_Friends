package com.gourmetfriends.gourmet_friends_prj.common;


import com.gourmetfriends.gourmet_friends_prj.utils.FileUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
@Log4j2
public class UploadController {

    private static final String uploadPath = "D:\\git-practice\\upload";

    //업로드된 파일을 처리
    @PostMapping("/upload")
    public String upload(@RequestParam("file") List<MultipartFile> fileList) throws IOException {

        for (MultipartFile file : fileList) {
            log.info("파일명: " + file.getOriginalFilename());
            log.info("용량: " + file.getSize());
            log.info("파일타입: " + file.getContentType());

            FileUtils.uploadFile(file, uploadPath);
        }
        return "";
    }

    //비동기로 전송된 파일 업로드 처리
    @PostMapping("/ajaxUpload")
    @ResponseBody
    public ResponseEntity<String[]> ajaxUpload(List<MultipartFile> files) throws IOException {

        int len = (files == null) ? 0: files.size();

        String[] fileNameList = new String[len];
        for (int i = 0; i < len; i++) {
            MultipartFile file = files.get(i);
            log.info(file.getOriginalFilename());
            log.info(file.getSize());

            fileNameList[i] = FileUtils.uploadFile(file, uploadPath);
        }
        return new ResponseEntity<>(fileNameList, HttpStatus.CREATED);
    }

    //파일 로딩 요청 처리
    @GetMapping("/loadFile")
    @ResponseBody
    public ResponseEntity<byte[]> loadFile(String fileName){

        log.info("request file name: " + fileName);
        log.info("request file full path: " + (uploadPath + fileName));

        File file = new File(uploadPath + fileName);
        if(!file.exists()){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        try {
            InputStream in = new FileInputStream(file);


            HttpHeaders headers = new HttpHeaders();

            String ext = FileUtils.getFileExtension(fileName);
            MediaType mediaType = FileUtils.getMediaType(ext);

            if(mediaType != null){
                headers.setContentType(mediaType);
            }
            return new ResponseEntity<>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
        }catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}
