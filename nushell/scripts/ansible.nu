def --env ansible-interactive [image?: string] {
  let gcloud_service_account = "fernando.elizalde@revolut.com"
  let devops_setup_repo = $"($env.HOME)/Documents/projects/devops/"
  let ansible_setup_repo = $"($env.HOME)/Documents/projects/devops/infra/ansible"

  let gcp_auth_kind = "${GCP_AUTH_KIND:-application}"
  let vault_addr = "https://vault.revolut.codes"
  let vault_files_dir = "/Users/fernando.elizalde/.config/ansible-vault"

  let ansible_image = match $image {
    "agent" => "eu.gcr.io/revolut-prod-apps/teamcity-agent-base-py3:latest"
    _ => "eu.gcr.io/revolut-labs/ansible:latest"
  }

  print $ansible_image

  let volumes = [
    $"-v/var/run/docker.sock:/var/run/docker.sock"
    $"-v($env.HOME)/.docker:/home/revolut/.docker:ro"
    $"-v($env.HOME)/.ssh:/root/.ssh"
    $"-v($env.HOME)/.config:/home/revolut/.config"
    $"-v($env.HOME)/.bash_history_ansible:/home/revolut/.bash_history"
    $"-v($env.PWD):/ansible/workdir"
    $"-v($vault_files_dir):/ansible/.vault"
    $"-v($ansible_setup_repo)/lookup:/ansible/lookup"
    $"-v($ansible_setup_repo)/modules:/ansible/modules"
    $"-v($ansible_setup_repo)/playbooks:/ansible/playbooks"
    $"-v($ansible_setup_repo)/plugins:/ansible/plugins"
    $"-v($ansible_setup_repo)/inventory:/ansible/inventory"
    $"-v($ansible_setup_repo)/roles:/ansible/roles"
    $"-v($ansible_setup_repo)/scripts:/ansible/scripts"
    $"-v($ansible_setup_repo)/resources:/ansible/resources"
    $"-v($devops_setup_repo):/devops"
    $"-v($devops_setup_repo)/infra/infra-apps-conf:/appconfigs"
  ]

  let envs = [
    $"-eGCLOUD_SERVICE_ACCOUNT=($gcloud_service_account)"
    $"-eVAULT_ADDR=($vault_addr)"
    "-eANSIBLE_LOOKUP_PLUGINS=/ansible/lookup:/ansible/plugins"
    "-eANSIBLE_LIBRARY=/ansible/modules"
    "-eGCP_AUTH_KIND=machineaccount"
    "-eDOCKER_HOST=unix:///var/run/docker.sock"
  ]

  docker run --privileged --user root --name myansible --rm --net=host -h ansible -it ...$volumes ...$envs $ansible_image /bin/bash
}
