local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local tagsProtectionRuleset() = orgs.newRepoRuleset('tags-protection') {
  target: "tag",
  include_refs: [
    '~ALL'
  ],
  allows_creations: true,
  allows_deletions: false,	
  allows_updates: false,
  required_pull_request: null,
  required_status_checks: null,
};

orgs.newOrg('iot.californium', 'eclipse-californium') {
  settings+: {
    description: "",
    name: "Eclipse Californium™",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('californium') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "CoAP/DTLS Java Implementation ",
      homepage: "https://www.eclipse.org/californium/",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "coap",
        "dtls",
        "eclipseiot",
        "internet-of-things",
        "iot",
        "java"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        tagsProtectionRuleset(),
      ],
    },
    orgs.newRepo('californium-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Californium website source",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('californium.actinium') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Californium project",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        tagsProtectionRuleset(),
      ],
    },
    orgs.newRepo('californium.tools') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Californium project",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        tagsProtectionRuleset(),
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
