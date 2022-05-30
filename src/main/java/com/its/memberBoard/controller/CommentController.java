package com.its.memberBoard.controller;

import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id,
                         @RequestParam("boardId") Long boardId){
        commentService.delete(id);
        return "redirect: /board/detail?id="+boardId;
    }


}
