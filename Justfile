distrobox-rebuild:
  distrobox assemble rm
  distrobox assemble create

cedarville-vpn:
  sudo gpclient --fix-openssl connect globalprotect.cedarville.edu --hip
