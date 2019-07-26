/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.mp3Library.controller;

import com.assignment.mp3Library.dao.SongService;
import com.assignment.mp3Library.model.Song;
import com.assignment.mp3Library.utils.Mp3Tags;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author creoo
 */
@Controller
public class SongController {

    @Autowired
    SongService songService;
    @Autowired
    Mp3Tags mp3Tags;
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getSongs(ModelMap mm) {
        List<Song> songs = songService.getSongs();
        mm.addAttribute("songs", songs);
        return "home";
    }

    @RequestMapping(value = "downloadSong/{id}", method = RequestMethod.GET, produces = MediaType.ALL_VALUE)
    public @ResponseBody
    byte[] downloadFile(ModelMap mm, @PathVariable("id") int id) {
        Song s = songService.findById(id);
        return s.getFile();

    }

    @RequestMapping(value = "getLyrics/{id}", method = RequestMethod.GET)
    public String getLyrics(ModelMap mm, @PathVariable("id") int id) {
        Song s = songService.findById(id);
        String title=s.getTitle();
        String artist=s.getArtist();
        mm.addAttribute("title", title);
        mm.addAttribute("artist", artist);
        return "getLyrics";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insertSong(ModelMap mm) {
        Song s = new Song();
        mm.put("song", s);
        return "insertSong";
    }
  @RequestMapping(value = "/doinsert2", method = RequestMethod.POST)
    public String update(ModelMap m,@ModelAttribute("song") Song s,@RequestParam("id") int id) {
      s.setFile(songService.findById(id).getFile());
      s.setFilename(songService.findById(id).getFilename());
    
        songService.insert(s);

        return "redirect:/home";
    }
    @RequestMapping(value = "/doinsert1", method = RequestMethod.POST)
    public String doinsertSong2(ModelMap mm, @ModelAttribute Song s, @RequestParam(value = "myfile") MultipartFile multipart) {
        s.setFilename(multipart.getOriginalFilename());
        try {
            File f=Mp3Tags.multipartToFile(multipart, multipart.getName());
            s.setTitle(mp3Tags.getTitle(f));
            s.setAlbum(mp3Tags.getAlbum(f));
            s.setArtist(mp3Tags.getArtist(f));
            s.setFile(multipart.getBytes());
        } catch (IllegalStateException | IOException ex) {
            Logger.getLogger(SongController.class.getName()).log(Level.SEVERE, null, ex);
        }
        songService.insert(s);
        return "insertSong2";
    }
    
}
