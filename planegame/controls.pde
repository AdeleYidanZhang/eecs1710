void keyPressed() {
  if (key == ' ') {
    Ammo ammo11 = new Ammo(mouseX-24, mouseY-12);
    Ammo ammo2 = new Ammo(mouseX+24, mouseY-12);
    //positon of bullets
    ammos.add(ammo11);//
    ammos.add(ammo2);
  }
}
