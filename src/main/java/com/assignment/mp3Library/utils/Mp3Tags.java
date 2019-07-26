/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.mp3Library.utils;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.farng.mp3.MP3File;
import org.farng.mp3.TagException;
import org.farng.mp3.id3.AbstractID3v1;
import org.farng.mp3.id3.AbstractID3v2;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author creoo
 */
@Component
public class Mp3Tags {
    public String getTitle(File sourceFile) {
       String title = null;
       try {

           MP3File mp3file = new MP3File(sourceFile);
           if (mp3file.hasID3v2Tag()) {
               AbstractID3v2 tag = mp3file.getID3v2Tag();
               title = tag.getSongTitle();

           } else if (mp3file.hasID3v1Tag()) {
               AbstractID3v1 tag = mp3file.getID3v1Tag();
               title = tag.getSongTitle();
           }

       } catch (IOException | TagException ex) {
           Logger.getLogger(Mp3Tags.class.getName()).log(Level.SEVERE, null, ex);
       }
       return title;
   }

   public String getAlbum(File sourcefile) {
       String album = null;
       try {

           MP3File mp3file = new MP3File(sourcefile);
           if (mp3file.hasID3v2Tag()) {
               AbstractID3v2 tag = mp3file.getID3v2Tag();
               album = tag.getAlbumTitle();

           } else if (mp3file.hasID3v1Tag()) {
               AbstractID3v1 tag = mp3file.getID3v1Tag();
               album = tag.getAlbumTitle();
           }

       } catch (IOException | TagException ex) {
           Logger.getLogger(Mp3Tags.class.getName()).log(Level.SEVERE, null, ex);
       }
       return album;
   }

   public String getArtist(File sourcefile) {
       String artist = null;
       try {

           MP3File mp3file = new MP3File(sourcefile);
           if (mp3file.hasID3v2Tag()) {
               AbstractID3v2 tag = mp3file.getID3v2Tag();
               artist = tag.getLeadArtist();

           } else if (mp3file.hasID3v1Tag()) {
               AbstractID3v1 tag = mp3file.getID3v1Tag();
               artist = tag.getLeadArtist();
           }

       } catch (IOException | TagException ex) {
           Logger.getLogger(Mp3Tags.class.getName()).log(Level.SEVERE, null, ex);
       }
       return artist;
   }

//    public void getArtist(Mp3File mp3file) {
//        String artist = null;
//
//        if (mp3file.hasId3v1Tag()) {
//            ID3v1 id3v1Tag = mp3file.getId3v1Tag();
//            System.out.println("Track: " + id3v1Tag.getTrack());
//            System.out.println("Artist: " + id3v1Tag.getArtist());
//            System.out.println("Title: " + id3v1Tag.getTitle());
//            System.out.println("Album: " + id3v1Tag.getAlbum());
//            System.out.println("Year: " + id3v1Tag.getYear());
//            System.out.println("Genre: " + id3v1Tag.getGenre() + " (" + id3v1Tag.getGenreDescription() + ")");
//            System.out.println("Comment: " + id3v1Tag.getComment());
//        }
//    }
   public static File multipartToFile(MultipartFile multipart, String fileName) throws IllegalStateException, IOException {
       File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + fileName);
       multipart.transferTo(convFile);
       return convFile;
   }
}
