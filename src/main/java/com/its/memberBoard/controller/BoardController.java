package com.its.memberBoard.controller;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.service.BoardService;
import com.its.memberBoard.service.CommentService;
import com.its.memberBoard.service.MemberService;
//import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")

public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String saveForm(){
        return "board/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required = false, defaultValue = "1") int page,
                          Model model){
        List<BoardDTO> boardDTOList = boardService.findAll(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", paging);
        return "board/list";
    }

    @GetMapping("/findAllHits")
    public String findAllHits(@RequestParam(value="page", required = false, defaultValue = "1") int page,
                          Model model){
        List<BoardDTO> boardDTOList = boardService.findAllHits(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", paging);
        return "board/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDetail",boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "board/detail";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        boardService.delete(id);
        return "redirect: /board/findAll";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id,
                         @RequestParam("loginId") Long loginId, Model model){
        BoardDTO boardDTO = boardService.findById(id);
        MemberDTO memberDTO = memberService.findById(loginId);
        model.addAttribute("board", boardDTO);
        model.addAttribute("member", memberDTO);
        return "board/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO){
        if(boardService.update(boardDTO)){
            return "redirect: /board/detail?id=" + boardDTO.getId();
        }else {
            return "redirect: /board/findAll";
        }
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model){
    List<BoardDTO> searchList =boardService.search(searchType, q);
    model.addAttribute("boardList", searchList);
    return "board/list";
    }


}
