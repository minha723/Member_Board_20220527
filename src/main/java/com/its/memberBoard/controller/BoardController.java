package com.its.memberBoard.controller;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")

public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String saveForm(){
        return "board/saveForm";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect: /board/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute(boardDTOList);
        return "board/list";
    }
}
