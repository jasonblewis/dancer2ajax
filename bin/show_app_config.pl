# bin/show_app_config.pl
use Dancer2;
printf "template: %s\n", config->{'template'}; # simple
printf "log: %s\n",      config->{'log'};      # undef
