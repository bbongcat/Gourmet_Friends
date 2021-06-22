package com.gourmetfriends.gourmet_friends_prj.utils;


import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

//파일 업로드 다운롣드 관련 공통 처리를 위한 클래스
public class FileUtils {

    private static final Map<String, MediaType> mediaMap;

    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG",MediaType.IMAGE_JPEG);
        mediaMap.put("PNG",MediaType.IMAGE_PNG);
        mediaMap.put("GIF",MediaType.IMAGE_GIF);
    }

    public static MediaType getMediaType(String ext){
        ext = ext.toUpperCase();
        if(mediaMap.containsKey(ext)){
            return mediaMap.get(ext);
        }else {
            return null;
        }
    }

    public static String uploadFile(MultipartFile file,String uploadPath) throws IOException {

        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

        String newUploadPath = getNewUploadPath(uploadPath);

        File saveFile = new File(newUploadPath,newFileName);

        try {
            file.transferTo(saveFile);
        } catch (IOException e){
            e.printStackTrace();
        }

        String resFileName = newUploadPath.substring(uploadPath.length()) + File.separator + newFileName;

        String ext = getFileExtension(newFileName);

        if(getMediaType(ext) == null){
            return resFileName.replace("\\","/");
        }else {
            String thumbnailFullPath = makeThumbnail(newUploadPath,newFileName);
            return thumbnailFullPath.substring(uploadPath.length()).replace("\\","/");
        }
     }

     private static String makeThumbnail(String uploadDitPath,String fileName) throws IOException {

         BufferedImage srcImg = ImageIO.read(new File(uploadDitPath, fileName));

         BufferedImage desrImg = Scalr.resize(srcImg,Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);

         String thumbnailName = uploadDitPath + File.separator + "s_" + fileName;

         File newFile = new File(thumbnailName);

         ImageIO.write(desrImg,getFileExtension(fileName),newFile);

         return thumbnailName;
     }
;
     public static String getNewUploadPath(String uploadPath){

         LocalDate now = LocalDate.now();
         int y = now.getYear();
         int m = now.getMonthValue();
         int d = now.getDayOfMonth();

         String newUploadPath = uploadPath;
         String[] dateInfo = {String.valueOf(y),len2(m),len2(d)};
         for (String date : dateInfo) {
             newUploadPath += File.separator + date;
             File dirName = new File(newUploadPath);

             if(!dirName.exists()){
                 dirName.mkdir();
             }
         }

         return newUploadPath;
     }

     private static String len2(int n){
         return new DecimalFormat("00").format(n);
     }

     public static String getFileExtension(String fileName){
         return fileName.substring(fileName.lastIndexOf(".") + 1);
     }
}
