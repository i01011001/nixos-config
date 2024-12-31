{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    cups-pdf.enable = true;
    drivers = [
      # (pkgs.callPackage ../pkgs/driver/dcpj125.nix {inherit pkgs;})
      (import ../../customs/driver/dcpj125.nix { inherit pkgs; }).driver
      (import ../../customs/driver/dcpj125.nix { inherit pkgs; }).cupswrapper
    ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "DCP-J125";
        location = "Home";
        deviceUri = "usb://Brother/DCP-J125?serial=BROE2F352003";
        # model = "drv:///sample.drv/generic.ppd";
        model = "brother_dcpj125_printer_en.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
  };
}
