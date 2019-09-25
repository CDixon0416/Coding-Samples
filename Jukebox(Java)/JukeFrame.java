package jukebox;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 *
 * @author Casey Dixon Date Feb 2,2017
 */
public class JukeFrame extends JFrame {

    private MusicPanel myMusic;
    private JButton musicSelect1;
    private JButton musicSelect2;
    private JButton musicSelect3;
    private JButton musicSelect4;
    private JButton musicSelect5;
    private JButton musicSelect6;
    private JButton stop;
    private JPanel musicSelect;

    public JukeFrame() {
        setTitle("Casey's Dope Tracks");
        setSize(600, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        myMusic = new MusicPanel();
        add(myMusic, BorderLayout.NORTH);

        musicSelect = new JPanel();
        Icon pFloyd = new ImageIcon(getClass().getResource("/images/DarkSide.png"));
        musicSelect1 = new JButton("Pink Floyd", pFloyd);
        Icon vh = new ImageIcon(getClass().getResource("/images/VH.jpg"));
        musicSelect2 = new JButton("Van Halen", vh);
        Icon stones = new ImageIcon(getClass().getResource("/images/Stones.jpg"));
        musicSelect3 = new JButton("Rolling Stones", stones);
        Icon devo = new ImageIcon(getClass().getResource("/images/Devo.jpg"));
        musicSelect4 = new JButton("Devo", devo);
        Icon clash = new ImageIcon(getClass().getResource("/images/Clash.png"));
        musicSelect5 = new JButton("The Clash", clash);
        Icon bep = new ImageIcon(getClass().getResource("/images/bep.jpg"));
        musicSelect6 = new JButton("Black Eyed Peas", bep);

        musicSelect.add(musicSelect1);
        musicSelect.add(musicSelect2);
        musicSelect.add(musicSelect3);
        musicSelect.add(musicSelect4);
        musicSelect.add(musicSelect5);
        musicSelect.add(musicSelect6);

        musicSelect.setLayout(new GridLayout(3, 2, 0, 0));
        add(musicSelect, BorderLayout.CENTER);

        MyButtonHandler musicPush = new MyButtonHandler();
        musicSelect1.addActionListener(musicPush);
        musicSelect2.addActionListener(musicPush);
        musicSelect3.addActionListener(musicPush);
        musicSelect4.addActionListener(musicPush);
        musicSelect5.addActionListener(musicPush);
        musicSelect6.addActionListener(musicPush);
        setVisible(true);

    }

    private class MyButtonHandler implements ActionListener {

        PlayMusic song;

        @Override
        public void actionPerformed(ActionEvent event) {
            try {
                song = new PlayMusic(event.getActionCommand());
                song.PlayMusic();

            } catch (IOException ex) {
                Logger.getLogger(JukeFrame.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
