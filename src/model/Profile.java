package model;

public class Profile {
   private int seq;
   private String my_img;
   
   
   public Profile() {}

   public Profile(int seq, String my_img) {
      this.seq = seq;
      this.my_img = my_img;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getMy_img() {
      return my_img;
   }

   public void setMy_img(String my_img) {
      this.my_img = my_img;
   }

   @Override
   public String toString() {
      return "Profile [seq=" + seq + ", my_img=" + my_img + "]";
   }   
}