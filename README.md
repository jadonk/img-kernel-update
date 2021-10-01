# img-kernel-update

1. Extracted eMMC/microSD contents to a file (need to document the process)
2. Downloaded replacement kernel using `dowget.sh`
3. Extracted kernel/firmware contents using `doextract.sh`
4. Found offset in the file using `findoffset.sh`
5. Mounted the partitions using loop mount and `domount.sh`
6. Installed new kernel using `doinstall.sh`
7. Unmounted partitions sync'd drive, xz compressed and copied the image to buildroot/package/beaglebone_flasher/flasher.img.xz
8. Followed instructions at [buildroot/README.md](buildroot/README.md) to create a Buildroot-based flasher image
