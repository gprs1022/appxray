# REA integration notes

REA is an external MCP/CLI toolset maintained at https://github.com/morluto/rea.

## Integration contract

1. The agent skill is installed independently from REA.
2. REA MCP registration and its tools are configured separately for each agent/client.
3. At runtime, inspect the connected server's actual tool list and input schemas. Upstream `main` documentation can be newer than a user's installed npm release.
4. Do not call setup/doctor on every task when a working server is already connected.
5. Preserve evidence, digests, diagnostics, coverage and limitations.

## Android

For Android APK code/classes/methods/references, the upstream skill currently routes to `inspect_android_package`, then focused Android tools if advertised. For package inventory, use the artifact route described by the installed REA skill. Android device inspection uses caller-supplied ADB. APK analysis prerequisites include a full JDK and headless JADX; REA setup does not install these dependencies.

## iOS / Apple artifacts

REA's upstream skill describes `open_binary` for IPA/package inventory and `open_bundle_resources` for Apple plist, Interface Builder, asset catalog and keyed-archive resources. Native code analysis is a separate workflow and may require a supported native provider. This does not imply unrestricted iOS device app enumeration or extraction.

## Web

For a user-owned browser page, upstream REA documents browser target discovery (for example `list_browser_targets`) and browser scenario capture workflows. These require the browser connection and supported tools to be available. Prefer passive observation; get approval before actions that change state.

## Source of truth

- REA repository: https://github.com/morluto/rea
- Upstream skill: https://github.com/morluto/rea/blob/main/.agents/skills/reverse-engineer-anything/SKILL.md

Always re-check upstream instructions and the installed server's schemas before implementation. Tool names and availability may change.
