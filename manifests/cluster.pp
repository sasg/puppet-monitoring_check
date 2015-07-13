# == Define: monitoring_check::cluster
#
# A define for managing cluster checks.
#
# === Parameters
#
# [*check*]
# Check name, defaults to $name
#
# [*command_add*]
# Additional command arguments
#
# For rest see @monitoring_check.
#
#
define monitoring_check::cluster (
    $runbook,
    $check                 = $name,
    $command_add           = '',
    $tip                   = undef,
    $check_every           = undef,
    $alert_after           = undef,
    $realert_every         = undef,
    $irc_channels          = undef,
    $notification_email    = undef,
    $ticket                = undef,
    $project               = undef,
    $sla                   = undef,
    $page                  = undef,
    $team                  = undef,
    $dependencies          = undef,
    $sensu_custom          = undef
) {
  require monitoring_check::check_cluster_install

  require monitoring_check::params
  $cluster = $monitoring_check::params::cluster_name

  monitoring_check { "${cluster}_${name}":
    command             => "/etc/sensu/plugins/check-cluster.rb  --cluster-name ${cluster} --check ${check} ${command_add}",
    runbook             => $runbook,
    check_every         => $check_every,
    alert_after         => $alert_after,
    realert_every       => $realert_every,
    irc_channels        => $irc_channels,
    notification_email  => $notification_email,
    ticket              => $ticket,
    project             => $project,
    tip                 => $tip,
    sla                 => $sla,
    page                => $page,
    team                => $team,
    dependencies        => $dependencies,
    sensu_custom        => $sensu_custom
  }
}
