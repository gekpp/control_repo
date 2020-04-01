class profile::agent_notes {
  include dockeragenet
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}
}
