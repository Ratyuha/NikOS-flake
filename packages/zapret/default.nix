{pkgs-unstable, ...}: {
  services.zapret = {
    enable = true;
    package = pkgs-unstable.zapret;
    params = [
      "--filter-udp=443 --hostlist=${./lists/list-general.txt} --hostlist-exclude=${./lists/list-exclude.txt} --ipset-exclude=${./lists/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./fake/quic_initial_www_google_com.bin} --new ^"
      "--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^"
      "--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fake-tls=${./fake/tls_clienthello_www_google_com.bin} --new ^"
      "--filter-tcp=443 --hostlist=${./lists/list-general.txt} --ip-id=zero --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fake-tls=${./fake/tls_clienthello_www_google_com.bin} --new ^"
      "--filter-tcp=80,443 --hostlist=${./lists/list-general.txt} --hostlist-exclude=${./lists/list-exclude.txt} --ipset-exclude=${./lists/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fake-tls=${./fake/tls_clienthello_max_ru.bin} --new ^"
      "--filter-udp=443 --ipset=${./lists/ipset-all.txt} --hostlist-exclude=${./lists/list-exclude.txt} --ipset-exclude=${./lists/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./fake/quic_initial_www_google_com.bin} --new ^"
      "--filter-tcp=80,443,1024-65535 --ipset=${./lists/ipset-all.txt} --hostlist-exclude=${./lists/list-exclude.txt} --ipset-exclude=${./lists/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fake-tls=${./fake/tls_clienthello_max_ru.bin} --new ^"
      "--filter-udp=1024-65535 --ipset=${./lists/ipset-all.txt} --ipset-exclude=${./lists/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=${./files/fake/quic_initial_www_google_com.bin} --dpi-desync-cutoff=n3"
    ];
    whitelist = [ ];
  };
}
