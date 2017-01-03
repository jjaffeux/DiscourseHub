server "159.203.173.249", user: "root", roles: %w{app}

set :ssh_options, {
  forward_agent: true
}
