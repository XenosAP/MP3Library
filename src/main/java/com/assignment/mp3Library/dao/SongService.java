/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.mp3Library.dao;

import com.assignment.mp3Library.model.Song;
import com.assignment.mp3Library.repo.SongRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author creoo
 */
@Service
public class SongService {
    @Autowired SongRepo songRepo;
    public void insert(Song s) {
     songRepo.save(s);
    }
    
    public List<Song> getSongs(){
    List<Song> songs=songRepo.findAll();
    return songs;}
    
    public Song findById(int id){
   Song s= songRepo.getOne(id);
    return s;}
    
}
