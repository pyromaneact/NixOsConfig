{pkgs, inputs, ... }:

{
  imports =[ 

  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
cairo.out
eudev.out
fontconfig.lib
gccNGPackages_15.libstdcxx.out
gdk-pixbuf.out
glamoroustoolkit.out
glib.out
glibc.out
glibc_memusage.out
glibc_multi.out
glibc_multi.static
gtk3.out
libGL.out
libgcc.lib
libgcc.libgcc
libpng.out
libsm.out
libudev-zero.out
libx11
libxxf86vm.out
libxxf86vm.out
libxxf86vm.out
pango.out
primus_lib.out
pyfa.out
pyfa.out
rigsofrods-bin.out
robo3t.out
rocmPackages.clang.out
systemd.out
systemdLibs.out
systemdMinimal.out
systemdUkify.out
xorg_sys_opengl.out
libxxf86vm
  ];

  environment.systemPackages = with pkgs; [
     binutils
     stdenv
     wget 
     dpkg 
     nix-index
     stdenv.cc
     patchelf
     libxxf86vm
  ];
}
