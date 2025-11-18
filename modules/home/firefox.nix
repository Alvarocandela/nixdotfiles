{ config, pkgs, lib, profileMode, ...}:

let
    addons = pkgs.nur.repos.rycee.firefox-addons;

    commonExtensions = with addons; [
      ublock-origin
      proton-pass
      darkreader
    ];
    commonSettings = {
      "app.normandy.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "browser.contentblocking.category" = "strict";
      "browser.ctrlTab.previews" = false;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "browser.newtabpage.activity-stream.feeds.snippets" = false;
      "browser.newtabpage.activity-stream.feeds.tabs" = false;
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;
      "browser.ping-centre.telemetry" = false;
      "browser.safebrowsing.downloads.remote_block_potentially_unwanted" = false;
      "browser.safebrowsing.downloads.remote_block_uncommon" = false;
      "browser.safebrowsing.malware.enabled" = false;
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.search.suggest.trendint" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.startup.page" = 3;
      "browser.tabgroups.recompositions.enabled" = false;
      "browser.tabs.firefox-view" = false;
      "browser.tabs.tabmanager.enabled" = false;
      "browser.urlbar.suggest.calculator" = true;
      "browser.vpn_promo.enabled" = false;
      "browser.warnOnQuit" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "dom.security.https_only_mode" = true;
      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      "extensions.autoDisableScopes" = 0;
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "geo.provider.use_geoclue" = false;
      "geo.provider.use_gpsd" = false;
      "identity.fxaccounts.enabled" = false;
      "identity.fxaccounts.telemetry.clientAssociationPing.enabled" = false;
      "identity.fxaccounts.ui.enabled" = false;
      "layout.css.prefers-color-scheme.content-override" = 0;
      "layout.spellcheckDefault" = 0;
      "network.connectivity-service.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "services.sync.enabled" = false;
      "sidebar.main.tools" = "history,bookmarks";
      "sidebar.notification.badge.aichat" = false;
      "sidebar.revamp" = true;
      "sidebar.verticalTabs" = true;
      "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
      "signon.autofillForms" = false;
      "signon.firefoxRelay.enabled" = false;
      "signon.generation.enabled" = false;
      "signon.management.page.breach-alerts.enabled" = false;
      "signon.rememberSignons" = false;
      "toolkit.coverage.endpoint.base" = "";
      "toolkit.coverage.opt-out" = true;
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.reportingpolicy.firstRun" = false;
      "toolkit.telemetry.server" = "data:,";
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabledFirstsession" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
    };
    profilesConfig = {
      "default" = {
        id = 0;
        isDefault = true;
	settings = commonSettings // {
	  # Settings specific for default profile
	};
	extensions = commonExtensions ++ [
	  # Extensions specific for default profile
      	  addons.sponsorblock
      	  addons.youtube-shorts-block
	];
        search = {
          default = "Startpage";
          engines = {
            "Startpage" = {
              urls = [{
                template = "https://www.startpage.com/sp/search?q={searchTerms}";
              }];
              icon = "https://www.startpage.com/sp/cdn/images/favicon.1500310260.svg";
              definedAliases = [ "@sp" ];
            };
            nix-packages = {
              name = "Nix Packages";
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            nixos-wiki = {
              name = "NixOS Wiki";
              urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
              iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
              definedAliases = [ "@nw" ];
            };
          };
        };
      };
      "uni" = {
        id = 1;
	settings = commonSettings // {
	  # Settings specific for uni profile
	};
	extensions = commonExtensions ++ [
	  # Extensions specific for uni profile
	];
	search = {
          default = "Startpage";
          engines = {
            "Startpage" = {
              urls = [{
                template = "https://www.startpage.com/sp/search?q={searchTerms}";
              }];
              icon = "https://www.startpage.com/sp/cdn/images/favicon.1500310260.svg";
              definedAliases = [ "@sp" ];
            };
	  };
	};
      };
      "dev" = {
        id = 2;
	settings = commonSettings // {
	  # Settings specific for dev profile
	};
	extensions = commonExtensions ++ [
	  # Extensions specific for dev profile
	];
	search = {
          default = "Startpage";
          engines = {
            "Startpage" = {
              urls = [{
                template = "https://www.startpage.com/sp/search?q={searchTerms}";
              }];
              icon = "https://www.startpage.com/sp/cdn/images/favicon.1500310260.svg";
              definedAliases = [ "@sp" ];
            };
	  };
	};
      };
      "hack" = {
        id = 3;
	settings = {
	  # Settings for hack profile
	};
	extensions = [
	  # Extensions for hack profile
	  addons.foxyproxy-standard
	  addons.wappalyzer
	];
      };
    };
in
{
  programs.firefox = {
    enable = true;
    profiles = lib.mapAttrs (name: data: {
      inherit name;
      inherit (data) id settings extensions;
      isDefault = (profileMode == name) || (builtins.elem profileMode (data.triggerTags or []));
    }) profilesConfig;
  };
}
