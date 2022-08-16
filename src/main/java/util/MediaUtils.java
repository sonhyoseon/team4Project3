package util;

import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.Map;

public class MediaUtils {

    private static Map<String, MediaType> mediaMap;

    // mediaMap에 이미지 확장자명에 따른 MINEType 저장
    static {
        mediaMap = new HashMap<String, MediaType>();
        mediaMap.put("jpg", MediaType.IMAGE_JPEG);
        mediaMap.put("gif", MediaType.IMAGE_GIF);
        mediaMap.put("png", MediaType.IMAGE_PNG);
    }

    public static MediaType getMediaType(String type){
        return mediaMap.get(type.toUpperCase());
    }
}
