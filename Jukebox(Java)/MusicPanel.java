package jukebox;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.SwingConstants;

/**
 *
 * @author Casey Dixon Date Feb 2,2017
 */
public class MusicPanel extends JPanel {

    private JLabel Music;

    public MusicPanel() {
        Icon musicIcon = new ImageIcon((getClass().getResource("/images/Floyd.png")));
        Music = new JLabel("Greatest Hits", musicIcon, SwingConstants.LEFT);
        add(Music);

    }

}
