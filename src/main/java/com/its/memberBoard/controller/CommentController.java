package com.its.memberBoard.controller;

import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        /**
         * 1. ajax로 받아온 새로운 댓글 내용을 DB에 저장
         * 2. DB에서 해당 글에 대한 댓글 목록을 가져와서 리턴
         */
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;

    }


}
