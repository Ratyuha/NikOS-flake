{pkgs, lib, ...}: {
  environment.systemPackages = with pkgs; [
    mesa                # OpenGL/Vulkan support
    vulkan-tools        # includes vkcube, vulkaninfo
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXScrnSaver
    libpng
    libpulseaudio
    libvorbis
    libkrb5
    keyutils
  ];
}
