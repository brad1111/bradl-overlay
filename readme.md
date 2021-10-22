# bradl-overlay
This overlay has been archived, please do not use it at the packages are likely to be outdated.
I am currently running OpenSUSE and have a repo at https://build.opensuse.org/project/show/home:brad1111

## Adding the overlay
### Using `eselect repository`
Ensure you have [app-eselect/eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository) installed and setup then as root run the following: 
```
eselect repository add bradl-overlay git https://www.github.com/brad1111/bradl-overlay.git
emerge --sync bradl-overlay
```
### Using `layman`
Ensure you have [app-portage/layman](https://wiki.gentoo.org/wiki/Layman) installed and setup then as root run the following:
```
layman -o https://raw.github.com/brad1111/bradl-overlay/master/repositories.xml -f -a bradl-overlay
layman -s bradl-overlay
```
