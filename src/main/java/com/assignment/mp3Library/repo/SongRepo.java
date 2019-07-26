/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.mp3Library.repo;

import com.assignment.mp3Library.model.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 *
 * @author creoo
 */
@Repository
public interface SongRepo extends JpaRepository<Song,Integer>{
    
}
