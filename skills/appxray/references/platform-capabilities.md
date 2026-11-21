# Platform capabilities and boundaries

## Android

- Discovery: ADB can enumerate packages visible to the connected device/user. This project currently provides a best-effort third-party package listing script.
- Artifact: APK path retrieval is separate from discovery. Packages may consist of base + split APKs; access can be restricted by device policy, profile, OEM, or permissions.
- Analysis: REA supports Android APK declarations/classes/methods/references when its Android tooling and external prerequisites are installed.
- Runtime: ADB logs, screenshots, dumps and package operations are subject to user authorization and Android restrictions.
- Explicitly out of scope: reading another app's private `/data/data` sandbox or extracting credentials/session data.

## iOS

- Discovery: do not promise unrestricted enumeration of installed apps on stock iOS devices.
- Inputs: user-provided IPA, source repository, build artifacts, simulator, or a specifically supported and authorized device workflow.
- Analysis: package inventory, Apple bundle resources and supported Mach-O/native analysis are distinct capabilities; availability depends on tools/providers.
- Runtime: require an approved simulator/device workflow and user confirmation before interaction.

## Web

- Discovery: user-provided URL or a connected browser target.
- Static: page structure, scripts, assets and source maps where legitimately accessible.
- Runtime: browser capture and interaction only within the approved origin/scope.
- Network: use user-supplied HAR/SAZ/capture or explicitly approved capture; redact credentials and personal data.
- Do not claim an API is absent when it was outside the capture's origin/scope or not exercised.
