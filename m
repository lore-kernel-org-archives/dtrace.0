Received: from outbound.pv.icloud.com (p-west1-cluster6-host2-snip4-10.eps.apple.com [57.103.67.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509CB284B29
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862857; cv=none; b=T7uhRTYEVormm2HcgzqqYcYJpZvFo8KvMkBhDZ+rNIdYcG4WQLXXup6Z9mqfkpXTCnaJbm1WUv3gdnaNKBRCh+qTv9FQjuPG/zxPRzRgv7q/JyQLzz4WIa35ouKp+bR8HtSGb5xrJULxDuFwbzUAi8vR+HLSwgdXLCP+TH1R4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862857; c=relaxed/simple;
	bh=ffkjvh5W5oW6yXjtKq5p3Lx0WltiMpwY3dF/+wPz0aw=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:To:Date; b=CO3swx4dqAelhVURRx8jq2keOWUsy+KAA6EY62ouVX2lrHK11IbJ8qBFkPKSUibz53CC8rxP3DwA5pWXLLOqocWEbPsRnLnIZjaPP7b0CoKKNygZPjwNJKR/hg1KWLC5V/i00GrxzgMZcWLaHf31yqxIsgSk/MksJ/f7NeRGU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=WcYPSKyM; arc=none smtp.client-ip=57.103.67.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="WcYPSKyM"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPS id A54D51800307
	for <dtrace_at_lists_linux_dev_c76fc5d2c52evd_84x56070@icloud.com>; Mon, 30 Mar 2026 09:27:34 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1774862855; x=1777454855; bh=4B/5YOYpMWQvGKDL83SW4zsoYuwqYzVqtStTV9x6WSs=; h=From:Content-Type:Mime-Version:Subject:Message-Id:To:Date:x-icloud-hme; b=WcYPSKyMFnVKuthOK+m28TPmPDkp2DR9KsjXNUhNdDwN5YgHEdVbwwjH+RRD7+wRCdH2x56/Eyh8rVDTNnN1TTWrXmo6yLGe4gq2k6FiH+L8hMl7lJxcn/eX79LDtfW4X5XtlxiRDBX82kq9MQLO5IySpvwmR8fCOx114SgvPLiZMGjINO43Zb0tbyKirwbkI3HmXR92qZhPDdxEqE0445u9WvWThtlaOT9U48bGFCJJ1tTmjjf6vwaeMRlzfDJPoQsef3lKmd5d9fqghzT3trGJFUICsl8WmwcCfJcCxOeapVnm9N8ErfmpcBVZ++pukmydjtPuCkqLMl7uXZOnDQ==
Received: from smtpclient.apple (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPSA id D450E1800317
	for <dtrace_at_lists_linux_dev_c76fc5d2c52evd_84x56070@icloud.com>; Mon, 30 Mar 2026 09:27:33 +0000 (UTC)
From: cornet.newest_7d@icloud.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Running DTrace in container
Message-Id: <1A79B12A-61B9-4789-BA80-04F98DA80121@icloud.com>
To: dtrace@lists.linux.dev
Date: Mon, 30 Mar 2026 11:27:21 +0200
X-Mailer: Apple Mail (2.3864.500.181)
X-CLX-Shades: None
X-CLX-UShades: None
X-CLX-Score: 80
X-CLX-UnSpecialScore: None
X-CLX-Spam: false
X-MANTSH: 1TFkXEhoRCllEF29SQkd/fEhwQlB/EQpZTRdkRURPEQpZSRcacRoQGncGHBpxGRA
 adwYYGgYaEQpZXhdobnkRCkNOF3lDelhYeFpIZGleH2Z+ekZec09ZZFlZaVJDHXJGTWZBEQpYX
 BcZBBoEHx4FGxoEGxwfBBgYBBgeHRAbHhofGhEKXlkXTQUBS0IRCkxaF2hba29rEQpFWRdva2s
 RCkNaFxsdBB8cBBMEGRwRCkJeFxsRCkReFxgRCl5OFxsRCkJFF21Je1pFE2FrBVJ+EQpCThdsc
 GB5QB1iUmkaYhEKQkwXbUl7WkUTYWsFUn4RCkJuF2ZNQ0RrT3ByX0VlEQpCbBdtSXtaRRNhawV
 SfhEKQkAXbHhjck1pHhwbb1gRCkJYF20TSVlCa0kZTnJrEQpNXhcbEQpFQxcbEQpwaBduXkVpZ
 WN9YUwTYRAZGhEKcGgXelsZeEJwcH5zS0gQGRoRCnBoF2tMU1IFYEZdcx1PEBkaEQpwaBdrHV9
 AAWVcU31gRRAZGhEKcGgXa3xSHRxTEmt/b1MQGRoRCnBoF25PWh5FZx9kc0wbEBkaEQpwaBdjZ
 2VlfVN8eVpaUhAZGhEKcGgXa15kfF4fehIfW0UQGRoRCnBMF2sdTG9JbV0cb15LEBkaEQptfhc
 bEQpYTRdLEQ==
X-Proofpoint-ORIG-GUID: SiPrrRpbNCt5LTPltYesNssCxi7XlgLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MyBTYWx0ZWRfXwtcsEzahA74+
 xEozAZ83jhwD442QvuLR8Tbl7wYNPoG1+9sS7d/JS1bUKcpDyn54SoyfVrHyFpq+fxVHZHKDYds
 Ht6VLa+ePkpQ6L75tznUQjBOnGRhwTR1r7GUBakkDtBVDBbq95kQJU7dAvZsDu4bvBaSz820kQk
 qtYiUZFM02o3BZ6Y6W5O8oW8qxleJ/46uoQQbK8jvuSP3YOgyEcqsLE6J/RbDpvL3GotAf3aqCl
 VhvpKC4Hku5xYkYiF+QeJnXn3gyElsJda0QyoWv/bZoOZsKsGc8gr14xTwHBKrds0udwF58BUI+
 ifU1xIXqdzH7jwhAU+6CEeNm78OHma61IRp6oMoYvoBCyWN3YUP+CQvAWFBrQs=
X-Authority-Info-Out: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=69ca4206
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10
 a=x7bEGLp0ZPQA:10 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=vTL-2scTMd7vKW9QFAgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: SiPrrRpbNCt5LTPltYesNssCxi7XlgLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=80 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603300073

Hi, I'm trying to run DTrace inside a Docker container but I get an =
error from one of the bundled DTrace files:

$ docker run -it --rm --privileged dtrace
root@b72fbbee0b66:/dtrace# dtrace -n 'syscall::openat:entry /pid =3D=3D =
$target/ { trace(copyinstr(arg1)); } ' -c 'cat README'
dtrace: invalid probe specifier syscall::*open*:entry /pid =3D=3D =
$target/ { trace(copyinstr(arg1)); } : =
"/usr/lib64/dtrace/6.10/procfs.d", line 131: operator -> cannot be =
applied to pointer to type "void"; must be applied to a struct or union =
pointer

I'm using Docker through OrbStack on macOS ARM64 (so this is running =
Linux AArch64). The Linux kernel that OrbStack is using is 6.17.8:

$ docker run dtrace uname -r                                             =
                                                                         =
 =20
6.17.8-orbstack-00308-g8f9c941121b1

When building DTrace I've based my Docker image on Ubuntu 25.10, which =
uses the 6.17.0 kernel by default. See the exact Dockerfile I've used to =
build DTrace at the end of this message. I've also tried to build and =
run DTrace without Docker in a virtual machine using QEMU running Ubuntu =
25.10. Then DTrace is working fine in the virtual machine.

Have I made some mistake when building DTrace or is it not expected to =
be able to run DTrace inside a container? Or is DTrace not compatible =
with this particular version of the Linux kernel?

Dockerfile:

FROM ubuntu:25.10

ARG KERNEL_VERSION=3D6.17.8
ARG KERNEL_MAJOR=3D6

RUN apt update && apt install -y\
  libc6-dev \
  bison \
  flex \
  gcc-bpf \
  binutils-bpf \
  libpcap-dev \
  wireshark \
  valgrind \
  libfuse3-dev \
  \
  libelf-dev \
  make \
  binutils-dev \
  libpfm4-dev \
  libbpf-dev \
  gawk \
  \
  curl \
  xz-utils && \
  ln -s /usr/include/ctf-api.h /usr/include/sys/ctf_api.h

RUN \
  kernel_version=3D$(uname -r | cut -f 1 -d - | cut -f 1 -d +) && \
  kernel_major=3D$(echo $kernel_version | cut -f 1 -d .) && \
  curl -L =
"https://cdn.kernel.org/pub/linux/kernel/v$kernel_major.x/linux-$kernel_ve=
rsion.tar.xz" -o "linux-$kernel_version.tar.xz" && \
  tar xf "linux-$kernel_version.tar.xz" && \
  cd "linux-$kernel_version" && \
  make mrproper

RUN \
  curl -L =
https://github.com/oracle/dtrace/archive/refs/heads/devel.tar.gz -o =
dtrace.tar.gz && \
  mkdir dtrace && \
  tar -x -f dtrace.tar.gz -C dtrace --strip-components=3D1

RUN \
  kernel_version=3D$(uname -r | cut -f 1 -d - | cut -f 1 -d +) && \
  kernel_major=3D$(echo $kernel_version | cut -f 1 -d .) && \
  cd dtrace && \
  ./configure \
    --kernels=3D"$kernel_version" \
    --kernel-mod-dir=3D"../linux-$kernel_version/" \
    --kernel-src-dir=3D../linux-$kernel_version/ \
    --kernel-src-suffix=3D"" \
    --kernel-obj-suffix=3D"build" && \
  make BPFC=3Dbpf-gcc BPFLD=3Dbpf-ld && \
  make install && \
  mv /usr/lib64/libdtrace.so* /lib/aarch64-linux-gnu/

--
/Jacob Carlborg=
