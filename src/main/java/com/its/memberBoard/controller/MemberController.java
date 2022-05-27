package com.its.memberBoard.controller;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")

public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "/member/saveForm";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("호출됨");
        System.out.println("memberDTO = " + memberDTO);
        if(memberService.save(memberDTO)){
            return "member/login";
        }else {
            return "index";
        }
    }


    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String duplicateResult = memberService.duplicateCheck(memberId);
        return duplicateResult;
    }

    @GetMapping("/login")
    public String loginForm(){
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("loginMember = " + loginMember);
        if(loginMember!=null){
            session.setAttribute("loginMemberId",loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            if(loginMember.getMemberId() == "admin"){
                return "member/admin";
            } else{
            return "board/list";
            }
        }else {
            return "member/login";
        }
    }
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "member/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        if(memberService.delete(id)){
            return "redirect: /member/findAll";
        }else{
            return "delete-fail";
        }
    }
    @GetMapping ("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/detail";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model){
        Long updateId = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "member/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return "board/list";
    }
}
