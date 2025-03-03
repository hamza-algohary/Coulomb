package gui;

import java.util.ArrayList;

import ch.bailu.gtk.gtk.Image;
import graphics.Color;

public class Icon extends Image{
    public static ArrayList<Icon> icons = new ArrayList<>();
    public static void updateAll(){
        for(var icon : icons) {
            icon.updateSettings();
        }
    }

    private String name;

    Icon(String name){
        this.name = name;
        icons.add(this);
        this.updateSettings();
    }

    public void updateSettings(){
        try{
            System.out.println("=======Updating Icon: "+name+" ================");
            Color.initImage(this, name);
        }catch(Exception e){
            System.out.println("Could not load icon " + name);
        }
    }

}
