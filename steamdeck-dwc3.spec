%if 0%{?fedora}
%global debug_package %{nil}
%endif

Name:     steamdeck-dwc3
Version:  {{{ git_dir_version }}}
Release:  1%{?dist}
Summary:  Driver for enabling DRD support on Steam Deck hardware
License:  GPLv2
URL:      https://github.com/KyleGospo/steamdeck-dwc3-kmod

Source:   %{url}/archive/refs/heads/main.tar.gz

Provides: %{name}-kmod-common = %{version}
Requires: %{name}-kmod >= %{version}

BuildRequires: systemd-rpm-macros

%description
Driver for enabling DRD support on Steam Deck hardware

%prep
%setup -q -c %{name}-kmod-main

%build
install -D -m 0644 %{name}-kmod-main/%{name}.conf %{buildroot}%{_modulesloaddir}/%{name}.conf

%files
%doc %{name}-kmod-main/README.md
%license %{name}-kmod-main/LICENSE
%{_modulesloaddir}/%{name}.conf

%changelog
{{{ git_dir_changelog }}}
