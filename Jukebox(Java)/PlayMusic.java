package jukebox;

import java.io.FileNotFoundException;
import java.io.IOException;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

/**
 *
 * @author Casey Dixon Date Feb 2,2017
 */
public class PlayMusic {

    private AudioInputStream audio;
    private Clip songTitle;
    private boolean isPlaying = false;

    public PlayMusic(String buttonPush) {
        try {
            switch (buttonPush) {
                case "Pink Floyd":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/Eclipse.wav"));
                    break;
                case "Rolling Stones":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/Paint It Black.wav"));
                    break;
                case "The Clash":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/Should I Stay or Should I Go.wav"));
                    break;
                case "Black Eyed Peas":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/I Gotta Feeling.wav"));
                    break;
                case "Devo":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/Whip It.wav"));
                    break;
                case "Van Halen":
                    audio = AudioSystem.getAudioInputStream(getClass().getResource("/music/Panama.wav"));
                    break;

            }

        } catch (IOException | UnsupportedAudioFileException e) {
        }

    }

    public void PlayMusic() throws FileNotFoundException, IOException {
        try {
            songTitle = AudioSystem.getClip();
            songTitle.open(audio);
            isPlaying = true;

        } catch (IOException | LineUnavailableException e) {
        }
        songTitle.start();

    }

}
