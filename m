Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F49316E866
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222457; cv=none; b=BpSmC63ZA3q+Wyi7a1Pt/39Y8aU+OiUXIjRoy7YARkl6vtcIXW4cNs8OMFihviE2kEQ1pcI5tjJa3/1X24XzMsbhY4kjFT66rfWnHhSrtTl4hOyd71XJVcPhoIEb/ViaDeAyEnP+OpawAsrmlgoFneMfzJ4Ni/9ROxPhhtLZeIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222457; c=relaxed/simple;
	bh=k342j5ZBXrif9o5NwjQILmqf8z7YSWWzIU2QLl/xGRA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rv0o7nE+N7taXGIyyyBqArsvORj3vU+yIcbustdz4ofFKg4Sd5FMtUA5UOu9LjWOV0W7SnM4CaaxJNu8vGvcidQRkhgMSW/octvsEpPqJIy0FL3VgyHiLGrPxoT2oar6e4hvLWyFVOoBETkHTVr4FRuoXo+ar0FkkeZuDF2s1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] doc: updates to README
In-Reply-To: <SN7PR10MB628746AEDD5AF32C30E29A0DC28C2@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Mon, 19 Aug 2024
	19:10:36 -0400")
Organization: Gentoo
References: <SN7PR10MB628746AEDD5AF32C30E29A0DC28C2@SN7PR10MB6287.namprd10.prod.outlook.com>
Date: Wed, 21 Aug 2024 07:40:51 +0100
Message-ID: <87a5h6nzt8.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> Remove obsolete reference to kernel source and headers for building
> DTrace.
>
> Move build instructions for pre-1.13.2 versions to a new file.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Thanks for doing this!

Not that it matters much for this, but maybe add:
 Link: https://github.com/oracle/dtrace-utils/issues/77

Reviewed-by: Sam James <sam@gentoo.org>

> ---
>  README.md         |  86 ++------------------------
>  README.pre-1.13.2 | 152 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 156 insertions(+), 82 deletions(-)
>  create mode 100644 README.pre-1.13.2
>
> diff --git a/README.md b/README.md
> index 9c506694..5855a55a 100644
> --- a/README.md
> +++ b/README.md
> @@ -128,24 +128,9 @@ make BPFC=3Dbpf-gcc BPFLD=3Dbpf-ld
>  sudo make install
>  ```
>=20=20
> -In this scenario the build system expects that kernel sources can be fou=
nd at
> -`/lib/modules/$(uname -r)/build`.  It is also expected that the kernel u=
sed for
> -userspace build is compatible with the utils (the exported userspace hea=
ders in
> -the `include/uapi/linux/dtrace` are compatible with the utils version be=
ing
> -built).
> -
> -You can point at a different kernel version with the KERNELS variable, e=
.g.
> -```
> -make KERNELS=3D"5.16.8"
> -```
> -as long as the source tree that kernel was built with remains where it w=
as
> -when that kernel was installed.
> -
>  See `./configure --help`, `make help`, and the top-level GNUmakefile for=
 a
> -full list of options (building translators against multiple different
> -kernels at once, building against kernel sources found in different plac=
es,
> -building against a kernel built with O=3D, installing in different place=
s,
> -etc.)
> +full list of options (installing in different places, building translato=
rs for
> +kernels, etc.)
>=20=20
>  Some of the options (e.g., those specifying paths) may need to be specif=
ied
>  when installing as well as when building.  To avoid this, you can use the
> @@ -200,68 +185,5 @@ Support for DTrace is included in Oracle Linux suppo=
rt subscriptions. Individual
>=20=20
>  ## 7. Building Previous Releases of DTrace
>=20=20
> -For versions of DTrace prior to 2.0.0-1.13.2 a small number of kernel pa=
tches
> -patches are needed, which are
> -[here](https://github.com/oracle/dtrace-linux-kernel).  Branches named
> -starting v2/* are suitable.
> -
> -To build such versions of dtrace follow the steps below.
> -
> -### 7.1. Prerequisites
> -
> -See [above](#21-prerequisites).
> -
> -At this point, you will need an additional step:
> -
> -### 7.2. Build a kernel with add-on features that DTrace uses
> -
> -DTrace 2.0.0-1.13.1 and earlier depend on a few extra kernel features th=
at are
> -not available in the upstream kernel:
> -
> -- CTF type information extraction
> -- /proc/kallmodsyms
> -- New system call: waitfd()
> -
> -As noted above, patches that implement these features are available from=
 the
> -v2/* branches in our Linux kernel repository for features that DTrace us=
es:
> -https://github.com/oracle/dtrace-linux-kernel
> -
> -The customary way to obtain these patches is to clone an appropriate ups=
tream
> -kernel version (5.8.1 or later) and to merge our
> -[updated tree](https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.8=
.1)
> -into it.  The patch set is quite small, but may need some tweaking if it=
 is
> -being merged into a newer tree.  We occasionally push a new patched tree=
 to our
> -github repo, so do look around the repo to see if there is a branch with=
 better
> -match.
> -
> -Oracle Linux's [UEK7](https://github.com/oracle/linux-uek/tree/uek7/ga)
> -provides a simple alternative if you don't want to patch your own kernel.
> -
> -Building of a patched kernel from sources is also straightforward.
> -Please consult `Documentation/process/changes.rst` in the kernel source =
tree
> -to ensure all required dependencies are installed first.  The following =
steps
> -should build and install the kernel.
> -
> -```
> -# Start with your preferred .config options.  Features DTrace needs shou=
ld
> -# enable themselves automatically.
> -make olddefconfig
> -make
> -
> -# This step will produce vmlinux.ctfa, which holds all CTF data for the =
kernel
> -# and its modules.  If it doesn't work, you don't have a toolchain that =
is
> -# recent enough.
> -make ctf
> -
> -# Install with root privileges.
> -sudo make INSTALL_MOD_STRIP=3D1 modules_install
> -sudo make install
> -```
> -
> -It is preferred (but not required) to reboot into your new kernel before
> -trying to build DTrace.  (If you don't reboot into it, you need to speci=
fy
> -some extra options when running make.)
> -
> -### 7.3. Build DTrace
> -
> -See [above](#22-build-dtrace).
> +Refer to [these instructions](./README.pre-1.13.2.md) to build DTrace ve=
rsions
> +prior to 2.0.0-1.13.2.
> diff --git a/README.pre-1.13.2 b/README.pre-1.13.2
> new file mode 100644
> index 00000000..1509ec65
> --- /dev/null
> +++ b/README.pre-1.13.2
> @@ -0,0 +1,152 @@
> + Linux DTrace
> +
> +For versions of DTrace prior to 2.0.0-1.13.2 a small number of kernel pa=
tches
> +patches are needed, which are
> +[here](https://github.com/oracle/dtrace-linux-kernel).  Branches named
> +starting v2/* are suitable.
> +
> +To build such versions of dtrace follow the steps below.
> +
> +## 1. Prerequisites
> +
> +Please read this section carefully before moving over to the build
> +documentation to ensure your environment is properly configured.
> +
> +### 1.1. Verify that binutils is recent enough...
> +
> +DTrace uses a type introspection system called CTF.  This is supported by
> +upstream GCC and GNU Binutils.  Make sure you have binutils 1.36 or later
> +installed.
> +
> +If your distro provides libctf.so in a binutils development package, you=
 need
> +to install that too.
> +
> +### 1.2. or install a recent-enough binutils
> +
> +If your distro provides binutils 1.36 or later, you should install it.  =
If not,
> +you can build your own local copy (which can be configured with a --pref=
ix
> +specific to itself to avoid disturbing the distro version).
> +
> +### 1.3. Install other necessary packages
> +
> +A few other packages are required, either for building or at runtime.  T=
hey
> +should be part of most Linux distributions today and can be installed vi=
a the
> +package manager of your distro.  The table below gives package names for=
 Debian
> +and Oracle Linux.
> +
> +For building:
> +
> +| Prerequisite       | Debian                      | Oracle Linux       =
       |
> +|:-------------------|:----------------------------|:-------------------=
-------|
> +| glibc headers      | libc6-dev                   | glibc-headers      =
       |
> +| glibc (static)     | (in libc6-dev)              | glibc-static       =
       |
> +| glibc (32-bit dev) | libc6-dev-i386              | glibc-devel.i686   =
       |
> +| bison              | bison                       | bison              =
       |
> +| flex               | flex                        | flex               =
       |
> +| BPF gcc            | gcc-bpf                     | gcc-bpf-unknown-non=
e      |
> +| BPF binutils       | binutils-bpf                | binutils-bpf-unknow=
n-none |
> +| libpcap dev        | libpcap-dev                 | libpcap-devel      =
       |
> +| wireshark          | wireshark                   | wireshark          =
       |
> +| valgrind           | valgrind                    | valgrind-devel     =
       |
> +| fuse3 or fuse      | libfuse3-dev or libfuse-dev | fuse3-devel or fuse=
-devel |
> +| kernel headers     | linux-headers-<kver>-<arch> | kernel-uek-devel-<k=
ver>   |
> +|                    | linux-headers-<kver>-common |                    =
       |
> +
> +At runtime:
> +
> +| Prerequisite       | Debian                 | Oracle Linux            =
  |
> +|:-------------------|:-----------------------|:------------------------=
--|
> +| wireshark          | wireshark              | wireshark               =
  |
> +| fuse3 or fuse      | libfuse3-3 or libfuse2 | fuse3-devel or fuse-deve=
l |
> +
> +## 2. Build a kernel with add-on features that DTrace uses
> +
> +DTrace 2.0.0-1.13.1 and earlier depend on a few extra kernel features th=
at are
> +not available in the upstream kernel:
> +
> +- CTF type information extraction
> +- /proc/kallmodsyms
> +- New system call: waitfd()
> +
> +As noted above, patches that implement these features are available from=
 the
> +v2/* branches in our Linux kernel repository for features that DTrace us=
es:
> +https://github.com/oracle/dtrace-linux-kernel
> +
> +The customary way to obtain these patches is to clone an appropriate ups=
tream
> +kernel version (5.8.1 or later) and to merge our
> +[updated tree](https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.8=
.1)
> +into it.  The patch set is quite small, but may need some tweaking if it=
 is
> +being merged into a newer tree.  We occasionally push a new patched tree=
 to our
> +github repo, so do look around the repo to see if there is a branch with=
 better
> +match.
> +
> +Oracle Linux's [UEK7](https://github.com/oracle/linux-uek/tree/uek7/ga)
> +provides a simple alternative if you don't want to patch your own kernel.
> +
> +Building of a patched kernel from sources is also straightforward.
> +Please consult `Documentation/process/changes.rst` in the kernel source =
tree
> +to ensure all required dependencies are installed first.  The following =
steps
> +should build and install the kernel.
> +
> +```
> + Start with your preferred .config options.  Features DTrace needs should
> + enable themselves automatically.
> +make olddefconfig
> +make
> +
> + This step will produce vmlinux.ctfa, which holds all CTF data for the k=
ernel
> + and its modules.  If it doesn't work, you don't have a toolchain that is
> + recent enough.
> +make ctf
> +
> + Install with root privileges.
> +sudo make INSTALL_MOD_STRIP=3D1 modules_install
> +sudo make install
> +```
> +
> +It is preferred (but not required) to reboot into your new kernel before
> +trying to build DTrace.  (If you don't reboot into it, you need to speci=
fy
> +some extra options when running make.)
> +
> +## 3. Build DTrace
> +
> +The simplest way of building DTrace is done by issuing the following com=
mands
> +from the DTrace source tree:
> +
> +```
> +make
> +sudo make install
> +```
> +
> +Some distributions install the BPF gcc and binutils under different name=
s.  You
> +can specify the executables to use using the **BPFC** and **BPFLD** vari=
ables.
> +E.g. on Debian you could use:
> +
> +```
> +make BPFC=3Dbpf-gcc BPFLD=3Dbpf-ld
> +sudo make install
> +```
> +
> +In this scenario the build system expects that kernel sources can be fou=
nd at
> +`/lib/modules/$(uname -r)/build`.  It is also expected that the kernel u=
sed for
> +userspace build is compatible with the utils (the exported userspace hea=
ders in
> +the `include/uapi/linux/dtrace` are compatible with the utils version be=
ing
> +built).
> +
> +You can point at a different kernel version with the KERNELS variable, e=
.g.
> +```
> +make KERNELS=3D"5.16.8"
> +```
> +as long as the source tree that kernel was built with remains where it w=
as
> +when that kernel was installed.
> +
> +See `./configure --help`, `make help`, and the top-level GNUmakefile for=
 a
> +full list of options (building translators against multiple different
> +kernels at once, building against kernel sources found in different plac=
es,
> +building against a kernel built with O=3D, installing in different place=
s,
> +etc.)
> +
> +Some of the options (e.g., those specifying paths) may need to be specif=
ied
> +when installing as well as when building.  To avoid this, you can use the
> +configure script: it bakes variable settings into the makefile so that t=
hey
> +persist across multiple invocations, including `make install`.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZsWL9F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAaqQEAi4nKF1pUx6SOuBHULPBBLXVyZmB7ujznnnPO
xuPKth4A/ju4pkurULE78S800/YCnR/KSfxbj8a9pRgo17BiEtsA
=Jnet
-----END PGP SIGNATURE-----
--=-=-=--
