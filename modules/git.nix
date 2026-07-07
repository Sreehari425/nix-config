{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Sreehari Anil";
        email = "sreehari7102008@gmail.com";
      };
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
        "ssh".program = "ssh-keygen";
      };
      commit.gpgSign = true;
      filter."lfs" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
      sendemail = {
        smtpserver = "smtp.gmail.com"; # Fixed your broken string here too!
        smtpuser = "sreehari7102008@gmail.com";
        smtpencryption = "tls";
        smtpserverport = 587;
      };
    };
    signing = {
      key = "/home/sreehari/.ssh/id_rsa.pub";
      signByDefault = true;
    };
  };
}
