# AOSPMirrorTool
A BASH-based utility that will enable setup, creation, and maintenence of Android source code for local development.

It is based on instructions from <a href="https://source.android.com" target="new">source.android.com</a>, but also tweaked for added compatibility with Fedora. <br>
AOSPMirrorTool will allow easy, automated setup of a local development environment based on those instructions. <br>
<hr>
<h3> Proposed Features - Short Term </h3>
<ul>
  <li>Install missing packages required for downloading and compiling AOSP, including the Android Repo utility from Google.</li>
  <li>Import Google's GPG key and verify it.</li>
  <li>Download AOSP source code, with configurable settings for speciific branches.</li>
  <li>Run various utilities for compiling, such as 'lunch'.</li>
  <li>Fix common errors encountered when working with AOSP code.</li>
  <li>Allow for easy rebasing of code when new versions of AOSP are released.</li>
  <li>Support for various devices.</li>
  </ul>
<hr>

<h3> Proposed Features - Long Term </h3>
<ul>
  <li>Future support for AOSP forks, including LineageOS and Android-x86 are planned.</li>
  <li>An easy to use menu system for initial setup, downloads, compilation, syncing, and more.</li>
  <li>Allow for archiving old copies of AOSP source via TarMonster. (requires TONS of disk space!!!) </li>
  <li>Integration of custom modifications.</li>
</ul>

<hr>

> [!NOTE]
> This code is in the very early stages of development and is far from complete. <br>
> It is based on instructions from source.android.com, but also tweaked for compatibility with Fedora. <br>
> AOSPMirrorTool will allow easy setup of a local development environment based on those instructions, automating them.
<hr>

> [!WARNING]
> This code is highly experiemental and has NOT been fully implemented or tested yet. <br>
<hr>

> [!IMPORTANT]
> Code is NOT suitable for production, and still lacks most features.
