_: {

  filetype = {

    filename = {
      "Jenkinsfile" = "groovy";
      "flake.lock" = "json";
    };

    pattern = {
      "docker-compose.ya?ml" = "yaml.docker-compose";
      ".*/.github/workflows/.*%.ya?ml" = "yaml.gh_actions";

      # ansible
      "playbook.ya?ml" = "yaml.ansible";
      ".*/playbooks/.*%.ya?ml" = "yaml.ansible";
      ".*/roles/.*%.ya?ml" = "yaml.ansible";
      ".*/group_vars/.*" = "yaml.ansible";
      ".*/host_vars/.*" = "yaml.ansible";
      ".*/playbooks/inventories/.*%/hosts" = "conf";

      # k8s-helm
      ".*/helm%-charts/.*%.ya?ml" = "helm";

      # conf
      ".*%.cfg" = "conf";
      ".*%.conf" = "conf";
      ".*%.service" = "conf";

      # terraform
      ".*%.tf" = "terraform";
      "terraform.tfstate.*" = "json";
    };

  };

}
