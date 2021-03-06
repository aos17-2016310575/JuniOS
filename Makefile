#/*  This file is part of The Firekylin Operating System.
# *
# *  Copyright 2016 Liuxiaofeng
# *
# *  Licensed under the Apache License, Version 2.0 (the "License");
# *  you may not use this file except in compliance with the License.
# *  You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# *  Unless required by applicable law or agreed to in writing, software
# *  distributed under the License is distributed on an "AS IS" BASIS,
# *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# *  See the License for the specific language governing permissions and
# *  limitations under the License.
# */

QEMU=qemu-system-i386 -boot d                                     \
	 -net nic,model=ne2k_pci,vlan=1,macaddr=12:54:00:12:34:56 \
	 -net tap,vlan=1,ifname=tap1                              \
	 -serial tcp::4444,server,nowait                          \
	 -serial tcp::4445,server,nowait                          \
	 -cdrom cdrom.iso                                         \
	 -hda hd.img

QEMU_CASEY=sudo qemu-system-i386 -boot d                          \
	 -serial tcp::4444,server,nowait                          \
	 -serial tcp::4445,server,nowait                          \
	 -cdrom cdrom.iso                                         \
	 -hda hd.img

all: complie cdrom hd.img

complie:
	make -C kernel #编译内核
	make -C lib	#编译系统库
	make -C bin	#编译系统组件
	make -C test	#编译测试文件
	make -C contrib
	
cdrom:
	@make complie 2>&1 > /dev/null
	@sh script/mkiso.sh	#制作镜像文件
	
hd.img:	#制作硬盘镜像文件
	@make complie 2>&1 > /dev/null
	@sh script/mkhdimg.sh
	
pdf:	#制作pdf说明文档
	@sh script/mkpdf.sh

clean:	#清理，删除文件
	@-make clean -C kernel
	@-make clean -C lib
	@-make clean -C bin
	@-make clean -C test
	@-make clean -C contrib
	@-rm -f cdrom.iso hd.img
	@-rm -f firekylin-source.pdf

distclean:clean
	@-rm -rf iso
	@-rm -rf Download
	
qemu:
	$(QEMU)

# for the QEMU without net-part 
#
qemu_c:
	$(QEMU_CASEY)

qemuS:
	$(QEMU) -S -gdb tcp::1234
