---
description: Update transcube-webapp cask to a specified version
allowed-tools: Read, Edit, Bash, WebFetch
argument-hint: <version> (e.g., 0.2.0)
---

# Update TransCube Webapp Cask

Update the transcube cask to version **$ARGUMENTS**.

## Steps to Follow

1. **Validate the version argument**: Ensure a version number was provided. If not, ask the user for the version.

2. **Fetch SHA256 from GitHub Release**:
   - The release URL pattern is: `https://github.com/STRRL/transcube-webapp/releases/download/v{version}/TransCube-{version}-macOS.dmg`
   - Use the GitHub API to get the release info and find the SHA256 checksum
   - API endpoint: `https://api.github.com/repos/STRRL/transcube-webapp/releases/tags/v{version}`
   - If the SHA256 is not available in the API, download the DMG and compute the checksum using `shasum -a 256`

3. **Update the cask file**:
   - File location: `Casks/transcube.rb`
   - Update the `version` line to the new version
   - Update the `sha256` line with the correct checksum

4. **Verify the update**:
   - Read the updated file to confirm changes are correct
   - Run `ruby -c Casks/transcube.rb` to validate Ruby syntax

## Reference

The cask file structure:
```ruby
cask "transcube" do
  version "X.Y.Z"
  sha256 "..."

  url "https://github.com/STRRL/transcube-webapp/releases/download/v#{version}/TransCube-#{version}-macOS.dmg"
  ...
end
```
