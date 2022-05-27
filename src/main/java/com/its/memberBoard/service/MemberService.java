package com.its.memberBoard.service;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
@Autowired
private MemberRepository memberRepository;

    public String duplicateCheck(String memberId) {
        MemberDTO memberDTO = memberRepository.duplicateCheck(memberId);
        if(memberDTO == null){
            return "ok";
        }else {
            return "no";
        }
    }

    public boolean save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberFile = memberDTO.getMemberFile(); //1.
        String memberFileName = memberFile.getOriginalFilename(); //2.
        memberFileName = System.currentTimeMillis() + "-" + memberFileName; //2.1
        memberDTO.setMemberFileName(memberFileName); //3
        String savePath = "D:\\spring_img\\" + memberFileName; // 4.
        if (!memberFile.isEmpty()) { //5.
            memberFile.transferTo(new File(savePath));
        }
        int saveResult = memberRepository.save(memberDTO);
        System.out.println("saveResult = " + saveResult);
        if(saveResult > 0){
            return true;
        }else {
            return false;
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public boolean delete(Long id) {
        int result = memberRepository.delete(id);
        if(result > 0){
            return true;
        } else {
            return false;
        }

    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
