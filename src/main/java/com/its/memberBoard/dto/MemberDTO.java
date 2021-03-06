package com.its.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data

public class MemberDTO {

    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
    private String memberMobile;
    private MultipartFile memberFile;
    private String memberFileName;

}
