module.exports = {
  repositoryUrl: "https://github.com/RJPearson94/terraform-twilio-autopilot",
  tagFormat: "v${version}",
  branches: ["main"],
  plugins: [
    "@semantic-release/commit-analyzer",
    [
      "@semantic-release/release-notes-generator",
      {
        preset: "angular",
        releaseRules: [
          { type: "feat", release: true },
          { type: "fix", release: true },
          { type: "refactor", release: true },
          { type: "docs", release: "patch" },
          { type: "tests", release: false },
        ],
      },
    ],
    [
      "@semantic-release/changelog",
      {
        changelogTitle:
          "All notable changes to this module will be documented in this file.",
      },
    ],
    "@semantic-release/git",
    "@semantic-release/github",
  ],
};
