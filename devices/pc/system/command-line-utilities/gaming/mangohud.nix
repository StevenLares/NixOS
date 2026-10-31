{ pkgs, ... }: {

  # Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
