{ pkgs, config, lib, ... }: {
  let 
    v4l2loopback-dc = config.boot.kernelPackages.callPackage ./v4l2loopback-dc.nix { };
    droidcam = pkgs.callPackage ./droidcam.nix {};
  in {
    boot.extraModulePackages = [ v4l2loopback-dc ];
    environment.systemPackages = [ droidcam ];
  }
}
