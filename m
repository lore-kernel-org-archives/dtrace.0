Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC1261591
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542442; cv=none; b=Pbg0CQNA3iQHp9fg9nibEfIKJjvULtCqvrcfdsQ6CSHE/cpSeA2GjiCT9Wf8SL0u7LNIZxiNs/NjvpnmJc4PR3O5g+EQTga8EG2j4b9IRgCext8sSNoxrVE7b9lR8+Ldovv/BFA4A8YNN6AF5ysCdMMYwBs/uVIFXOTgs1OVupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542442; c=relaxed/simple;
	bh=COdZLkWl5d3vlNHzxoF6Sbx/SfDyXIfHMphAXDtdnms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MgIk+DACUfU3mcwG+yyGipSPPs6AQK/pgU8KKseab25Ga0r4+d9v6wyAVjB+WKdzJTL8bVvhQlOXONBzMFr95pAeJOdgepf4qwJmBp+GX2O/yP3V890xLrClXec4DHcMFb4sAV9zgqI0+EQx3R4X0UsczCih7Hd1R1XNv1FcPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PFq9QKTJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PFq9QKTJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639Yu2g015512
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 11:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=x78lOe497INndprOzZ6aecg19lJrB
	DX9vvhC2STvzj0=; b=PFq9QKTJjq2XT3+xWYHojx+rz3N81YGUUJjmY1zZfud0B
	houbPPh12ZJWwNrryL74nfi9GNeNJX04WsIGET3bBp/lXxt2Y5/TG/UyWWd7dfiu
	0QNmjQrbTZUms2vEuEamIcW0U1NFqnDBYi7NzNy+XwMi9X4v7EFVfJgjSh0OZnOf
	QzuowaMsGlzMVzUut81m/slYRFKy7Qh7BBm9CDbgyvYy+NYgRAm4E4IFPCY6V2S/
	KWhrz0cO1Zp1nFmWVVmnzLAm76j97EJP7MFOijKOrbpm6CB+LSW9FnOhhIILUqTZ
	y44vClDQ+Vc9J5E6uax6M47BSgplLsHQ4yL4BK8MA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766gvp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 11:33:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563BP2kp033801
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 11:33:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucgpjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 11:33:51 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 563BXp2N003074
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 11:33:51 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-189.vpn.oracle.com [10.154.62.189])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47j6ucgphj-1;
	Thu, 03 Jul 2025 11:33:51 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH] test/utils: add more reliable "get remote address" approach
Date: Thu,  3 Jul 2025 12:33:45 +0100
Message-ID: <20250703113345.1273604-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030096
X-Proofpoint-GUID: ahby2JjSoGLT6O-H-p_QyqsR-KQHOceu
X-Proofpoint-ORIG-GUID: ahby2JjSoGLT6O-H-p_QyqsR-KQHOceu
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68666aa1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=25raihVBmVyqM6VAs4YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5NSBTYWx0ZWRfX3e3wXKR/R6Oc 2AkZxfglxWWWI7A2hJWFkvqhrpTyi0mHFjkcpmYDPZVjvSSNGi3sPBNaOUXWqaFnEartwgMM8Qh sLIsvvGJoyOgKIoWe/rieB9wi80DbH3zd4nWfO352v5MC3HkbRoX0Kxngywa3qS4aU5E84h2A23
 5AUH9wLHSK0c2CQxk/U6WaCCglbJxoibBW0Q1OdbgEDnnghoXkr1XM4pDCqnPUJlAyh69uzIreq i/0oLE/A79muSFLF87oIcYF1uh3NOnw4Y0bxUm1ZireoUHmpgbyw9oXde4hW+pj+z3RFl9z+fuO K96gy1nwmTk6FsVjkeG7iqLp1DO69I1GBCCFlYcv+9iUK2t+Y8O8w3+c+KbcwCTp5BykMViv7lh
 Fk0TWwaZjuIz15tx+o38EH38vJamiKYlM+ZcFm4EoUoo/3oHKNx5CuRil7oYJ17HxkuGhvMg

The current approach of looking for remote addresses
is brittle and fails in many environments; it checks the
default route gateway and looks for open ports in the TCP
case.

We can however achieve the same goal reliably by creating
a network namespace on the system and configuring either
IPv4 or IPv6 addresses on the namespaced and local veth
interfaces that support communication between namespaces.
If a tcp port is required start sshd to listen on that port.

Teardown is managed in runtest.sh as signal handling for
timeouts within the test scripts is not working; a trap
function does not trigger for TERM.

Move the get_remote.sh script to test/utils also as it
seems a more natural location.

One issue - this cannot be run on a local system with
a VPN running as the VPN connection is pretty aggressive
in disconnecting/reconnecting when spotting a link-up event
associated with the global netns side of the veth.  However
in my experience the remote IP tests do not work reliably
in that environment anyway.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 runtest.sh                                  |  2 +
 test/unittest/ip/get.ipv4remote.pl          | 87 ---------------------
 test/unittest/ip/get.ipv6remote.pl          | 70 -----------------
 test/unittest/ip/tst.ipv4remoteicmp.sh      | 10 +--
 test/unittest/ip/tst.ipv4remotetcp.sh       | 25 ++----
 test/unittest/ip/tst.ipv4remoteudp.sh       |  8 +-
 test/unittest/ip/tst.ipv6remoteicmp.sh      | 16 ++--
 test/unittest/tcp/tst.ipv4remotetcp.sh      | 24 ++----
 test/unittest/tcp/tst.ipv4remotetcpstate.sh | 29 +++----
 test/unittest/udp/tst.ipv4remoteudp.sh      |  4 +-
 test/utils/get_remote.sh                    | 71 +++++++++++++++++
 11 files changed, 116 insertions(+), 230 deletions(-)
 delete mode 100755 test/unittest/ip/get.ipv4remote.pl
 delete mode 100755 test/unittest/ip/get.ipv6remote.pl
 create mode 100755 test/utils/get_remote.sh

diff --git a/runtest.sh b/runtest.sh
index 156e7dec..9f06a499 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -1473,6 +1473,8 @@ for dt in $dtrace; do
 
         log "\n"
 
+	test/utils/get_remote.sh cleanup
+
         if [[ -n $regression ]]; then
             # If regtesting, we run a second time, with intermediate results
             # displayed, and output redirected to a per-test, per-dtrace
diff --git a/test/unittest/ip/get.ipv4remote.pl b/test/unittest/ip/get.ipv4remote.pl
deleted file mode 100755
index 3cc47d01..00000000
--- a/test/unittest/ip/get.ipv4remote.pl
+++ /dev/null
@@ -1,87 +0,0 @@
-#!/usr/bin/perl -w
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-
-#
-# get.ipv4remote.pl [tcpport]
-#
-# Find an IPv4 reachable remote host using both ip(8) and ping(8).
-# If a tcpport is specified, return a host that is also listening on this
-# TCP port.  Print the local address and the remote address, or an
-# error message if no suitable remote host was found.  Exit status is 0 if
-# a host was found.  (Note: the only host we check is the gateway.  Nobody
-# responds to broadcast pings these days, and portscanning the local net is
-# unfriendly.)
-#
-
-use strict;
-use IO::Socket;
-
-my $TIMEOUT = 3;
-my $tcpport = @ARGV == 1 ? $ARGV[0] : 0;
-
-#
-# Determine gateway IP address
-#
-
-my $local = "";
-my $remote = "";
-my $responsive = "";
-my $up;
-open IP, '/sbin/ip -o -4 route show |' or die "Couldn't run ip route show: $!\n";
-while (<IP>) {
-	next unless /^default /;
-
-	if (/via (\S+)/) {
-		$remote = $1;
-	}
-}
-close IP;
-die "Could not determine gateway router IP address" if $remote eq "";
-
-open IP, "/sbin/ip -o route get to $remote |" or die "Couldn't run ip route get: $!\n";
-while (<IP>) {
-	next unless /^$remote /;
-	if (/src (\S+)/) {
-		$local = $1;
-	}
-}
-close IP;
-die "Could not determine local IP address" if $local eq "";
-
-#
-# See if the rmote host responds to an icmp echo.
-#
-open PING, "/bin/ping -n -s 56 -w $TIMEOUT $remote |" or
-    die "Couldn't run ping: $!\n";
-while (<PING>) {
-	if (/bytes from (.*): /) {
-		my $addr = $1;
-
-		if ($tcpport != 0) {
-			#
-			# Test TCP
-			#
-			my $socket = IO::Socket::INET->new(
-				Proto    => "tcp",
-				PeerAddr => $addr,
-				PeerPort => $tcpport,
-				Timeout  => $TIMEOUT,
-			);
-			next unless $socket;
-			close $socket;
-		}
-
-		$responsive = $addr;
-		last;
-	}
-}
-close PING;
-die "Can't find a remote host for testing: No suitable response from " .
-    "$remote\n" if $responsive eq "";
-
-print "$local $responsive\n";
diff --git a/test/unittest/ip/get.ipv6remote.pl b/test/unittest/ip/get.ipv6remote.pl
deleted file mode 100755
index b2136c5b..00000000
--- a/test/unittest/ip/get.ipv6remote.pl
+++ /dev/null
@@ -1,70 +0,0 @@
-#!/usr/bin/perl -w
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-
-#
-# get.ipv6remote.pl
-#
-# Find an IPv6 reachable remote host using both ip(8) and ping(8).
-# Print the local address and the remote address, or print nothing if either
-# no IPv6 interfaces or remote hosts were found.  (Remote IPv6 testing is
-# considered optional, and so not finding another IPv6 host is not an error
-# state we need to log.)  Exit status is 0 if a host was found.
-#
-
-use strict;
-use IO::Socket;
-
-my $TIMEOUT = 3;			# connection timeout
-
-# possible paths for ping6
-$ENV{'PATH'} = "/bin:/usr/bin:/sbin:/usr/sbin:$ENV{'PATH'}";
-
-#
-# Determine local IP address
-#
-my $local = "";
-my $remote = "";
-my $responsive = "";
-my $up;
-open IP, '/sbin/ip -o -6 route show |' or die "Couldn't run ip route show: $!\n";
-while (<IP>) {
-	next unless /^default /;
-
-	if (/via (\S+)/) {
-		$remote = $1;
-	}
-}
-close IP;
-die "Could not determine gateway router IPv6 address" if $remote eq "";
-
-open IP, "/sbin/ip -o route get to $remote |" or die "Couldn't run ip route get: $!\n";
-while (<IP>) {
-	next unless /^$remote /;
-	if (/src (\S+)/) {
-		$local = $1;
-	}
-}
-close IP;
-die "Could not determine local IPv6 address" if $local eq "";
-
-#
-# Find the first remote host that responds to an icmp echo,
-# which isn't a local address.
-#
-open PING, "ping6 -n -s 56 -w $TIMEOUT $remote 2>/dev/null |" or
-    die "Couldn't run ping: $!\n";
-while (<PING>) {
-	if (/bytes from (.*): /) {
-		$responsive = $1;
-		last;
-	}
-}
-close PING;
-exit 2 if $responsive eq "";
-
-print "$local $responsive\n";
diff --git a/test/unittest/ip/tst.ipv4remoteicmp.sh b/test/unittest/ip/tst.ipv4remoteicmp.sh
index c165cbdc..854797a7 100755
--- a/test/unittest/ip/tst.ipv4remoteicmp.sh
+++ b/test/unittest/ip/tst.ipv4remoteicmp.sh
@@ -13,9 +13,7 @@
 #
 # 1. A change to the ip stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. No physical network interface is plumbed and up.
-# 3. The subnet gateway is not reachable.
-# 4. An unrelated ICMP between these hosts was traced by accident.
+# 2. An unrelated ICMP between these hosts was traced by accident.
 #
 
 if (( $# != 1 )); then
@@ -25,18 +23,20 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/get.ipv4remote.pl
+getaddr=$testdir/../../utils/get_remote.sh
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-set -- $($getaddr)
+
+set -- $($getaddr ipv4)
 source="$1"
 dest="$2"
 if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
 	exit 67
 fi
+
 $dtrace $dt_flags -c "$testdir/perlping.pl icmp $dest" -qs /dev/stdin <<EOF | \
 	sort -n
 ip:::send
diff --git a/test/unittest/ip/tst.ipv4remotetcp.sh b/test/unittest/ip/tst.ipv4remotetcp.sh
index 577c5668..f164d9d0 100755
--- a/test/unittest/ip/tst.ipv4remotetcp.sh
+++ b/test/unittest/ip/tst.ipv4remotetcp.sh
@@ -13,9 +13,7 @@
 #
 # 1. A change to the ip stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. No physical network interface is plumbed and up.
-# 3. The subnet gateway is not reachable and listening on ssh.
-# 4. An unlikely race causes the unlocked global send/receive
+# 2. An unlikely race causes the unlocked global send/receive
 #    variables to be corrupted.
 #
 # This test performs a TCP connection and checks that at least the
@@ -32,27 +30,20 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/get.ipv4remote.pl
-tcpports="22 80"
-tcpport=""
+getaddr=$testdir/../../utils/get_remote.sh
+tcpport="22"
 dest=""
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-for port in $tcpports ; do
-	res=`$getaddr $port 2>/dev/null`
-	if (( $? == 0 )); then
-		read s d <<< $res
-		tcpport=$port
-		source=$s
-		dest=$d
-		break
-        fi
-done
 
-if [ -z $tcpport ]; then
+set -- $($getaddr ipv4 $tcpport)
+source="$1"
+dest="$2"
+
+if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
 	exit 67
 fi
 
diff --git a/test/unittest/ip/tst.ipv4remoteudp.sh b/test/unittest/ip/tst.ipv4remoteudp.sh
index 3d25e1f5..f88ab35b 100755
--- a/test/unittest/ip/tst.ipv4remoteudp.sh
+++ b/test/unittest/ip/tst.ipv4remoteudp.sh
@@ -13,9 +13,7 @@
 #
 # 1. A change to the ip stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. No physical network interface is plumbed and up.
-# 3. The gateway is not reachable and listening on rpcbind.
-# 4. An unlikely race causes the unlocked global send/receive
+# 2. An unlikely race causes the unlocked global send/receive
 #    variables to be corrupted.
 #
 # This test sends a UDP message using ping and checks that at least the
@@ -31,13 +29,13 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/get.ipv4remote.pl
+getaddr=$testdir/../../utils/get_remote.sh
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-set -- $($getaddr)
+set -- $($getaddr ipv4)
 source="$1"
 dest="$2"
 if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
diff --git a/test/unittest/ip/tst.ipv6remoteicmp.sh b/test/unittest/ip/tst.ipv6remoteicmp.sh
index 90fd48b4..0107a3ae 100755
--- a/test/unittest/ip/tst.ipv6remoteicmp.sh
+++ b/test/unittest/ip/tst.ipv6remoteicmp.sh
@@ -19,7 +19,7 @@
 #
 # @@tags: unstable
 
-# possible paths for ping6
+# possible paths for ping
 export PATH=/bin:/usr/bin:/sbin:/usr/sbin:$PATH
 
 if (( $# != 1 )); then
@@ -29,24 +29,24 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/get.ipv6remote.pl
+getaddr=$testdir/../../utils/get_remote.sh
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-set -- $($getaddr)
+
+set -- $($getaddr ipv6)
 source="$1"
 dest="$2"
+
 if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
 	echo -n "Could not find a local IPv6 interface and a remote IPv6 " >&2
 	echo "host.  Aborting test." >&2
 	exit 67
 fi
 
-nolinkdest="$(printf "%s" "$dest" | sed 's,%.*,,')"
-
-$dtrace $dt_flags -c "ping6 -c 6 $dest" -qs /dev/stdin <<EOF | \
+$dtrace $dt_flags -c "ping -6 -c 10 $dest" -qs /dev/stdin <<EOF | \
     gawk '/ip:::/ { print $0 }' | sort -n
 /* 
  * We use a size match to include only things that are big enough to
@@ -54,7 +54,7 @@ $dtrace $dt_flags -c "ping6 -c 6 $dest" -qs /dev/stdin <<EOF | \
  */
 
 ip:::send
-/args[2]->ip_saddr == "$source" && args[2]->ip_daddr == "$nolinkdest" &&
+/args[2]->ip_saddr == "$source" && args[2]->ip_daddr == "$dest" &&
     args[5]->ipv6_nexthdr == IPPROTO_ICMPV6 && args[2]->ip_plength > 32/
 {
 	printf("1 ip:::send    (");
@@ -64,7 +64,7 @@ ip:::send
 }
 
 ip:::receive
-/args[2]->ip_saddr == "$nolinkdest" && args[2]->ip_daddr == "$source" &&
+/args[2]->ip_saddr == "$dest" && args[2]->ip_daddr == "$source" &&
     args[5]->ipv6_nexthdr == IPPROTO_ICMPV6 && args[2]->ip_plength > 32/
 {
 	printf("2 ip:::receive (");
diff --git a/test/unittest/tcp/tst.ipv4remotetcp.sh b/test/unittest/tcp/tst.ipv4remotetcp.sh
index 333760a1..d8673d4b 100755
--- a/test/unittest/tcp/tst.ipv4remotetcp.sh
+++ b/test/unittest/tcp/tst.ipv4remotetcp.sh
@@ -13,9 +13,7 @@
 #
 # 1. A change to the tcp stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. No physical network interface is plumbed and up.
-# 3. No other hosts on this subnet are reachable and listening on ssh.
-# 4. An unlikely race causes the unlocked global send/receive
+# 2. An unlikely race causes the unlocked global send/receive
 #    variables to be corrupted.
 #
 # This test performs a TCP connection and checks that at least the
@@ -32,9 +30,8 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/../ip/get.ipv4remote.pl
-tcpports="22 80"
-tcpport=""
+getaddr=$testdir/../../utils/get_remote.sh
+tcpport="22"
 dest=""
 
 if [[ ! -x $getaddr ]]; then
@@ -42,18 +39,11 @@ if [[ ! -x $getaddr ]]; then
         exit 3
 fi
 
-for port in $tcpports ; do
-	res=`$getaddr $port 2>/dev/null`
-	if (( $? == 0 )); then
-		read s d <<< $res
-		tcpport=$port
-		source=$s
-		dest=$d
-		break
-	fi
-done
+set -- $($getaddr ipv4 $tcpport)
+source="$1"
+dest="$2"
 
-if [[ -z $tcpport ]]; then
+if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
 	exit 67
 fi
 
diff --git a/test/unittest/tcp/tst.ipv4remotetcpstate.sh b/test/unittest/tcp/tst.ipv4remotetcpstate.sh
index 74fb4ce3..e9ff218d 100755
--- a/test/unittest/tcp/tst.ipv4remotetcpstate.sh
+++ b/test/unittest/tcp/tst.ipv4remotetcpstate.sh
@@ -17,8 +17,7 @@
 #
 # 1. A change to the ip stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. The remote ssh service is not online.
-# 3. An unlikely race causes the unlocked global send/receive
+# 2. An unlikely race causes the unlocked global send/receive
 #    variables to be corrupted.
 #
 # This test performs a TCP connection to the ssh service (port 22) and
@@ -40,29 +39,21 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/../ip/get.ipv4remote.pl
+getaddr=$testdir/../../utils/get_remote.sh
 client=$testdir/../ip/client.ip.pl
-tcpports="22 80"
-tcpport=""
-dest=""
+tcpport="22"
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-for port in $tcpports ; do
-	res=`$getaddr $port 2>/dev/null`
-	if (( $? == 0 )); then
-		read s d <<< $res
-		tcpport=$port
-		source=$s
-		dest=$d
-		break
-	fi
-done
-
-if [ -z $tcpport ]; then
-        exit 67
+
+set -- $($getaddr ipv4 $tcpport)
+source="$1"
+dest="$2"
+
+if [[ $? -ne 0 ]] || [[ -z $dest ]]; then
+	exit 67
 fi
 
 
diff --git a/test/unittest/udp/tst.ipv4remoteudp.sh b/test/unittest/udp/tst.ipv4remoteudp.sh
index 1c5f2a9a..4fe70f5a 100755
--- a/test/unittest/udp/tst.ipv4remoteudp.sh
+++ b/test/unittest/udp/tst.ipv4remoteudp.sh
@@ -34,14 +34,14 @@ fi
 
 dtrace=$1
 testdir="$(dirname $_test)"
-getaddr=$testdir/../ip/get.ipv4remote.pl
+getaddr=$testdir/../../utils/get_remote.sh
 port=31337
 
 if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-read source dest <<<`$getaddr 2>/dev/null`
+read source dest <<<`$getaddr ipv4 2>/dev/null`
 if (( $? != 0 )) || [[ -z $dest ]]; then
 	exit 67
 fi
diff --git a/test/utils/get_remote.sh b/test/utils/get_remote.sh
new file mode 100755
index 00000000..d8a4d450
--- /dev/null
+++ b/test/utils/get_remote.sh
@@ -0,0 +1,71 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# get_remote.sh ipv4|ipv6|cleanup [tcpport]
+#
+# Create (or cleanup) a network namespace with either IPv4 or IPv6
+# address associated.
+#
+# Print the local address and the remote address, or an
+# error message if a failure occurred during setup.
+#
+# If tcpport is specified, start sshd on that port.
+#
+# Exit status is 0 if all succceeded.
+#
+
+cmd=$1
+tcpport=$2
+
+prefix=$(basename $tmpdir)
+netns=${prefix}ns
+veth1=${prefix}v1
+veth2=${prefix}v2
+mtu=1500
+
+set -e
+
+case $cmd in
+cleanup)	pids=$(ip netns pids ${netns} 2>/dev/null)
+		if [[ -n "$pids" ]]; then
+			kill -TERM $pids
+		fi
+		ip netns del ${netns} 2>/dev/null
+		exit 0
+		;;
+ ipv4)		veth1_addr=192.168.168.1
+		veth2_addr=192.168.168.2
+		prefixlen=24
+		family=
+		;;
+ ipv6)		veth1_addr=fd::1
+		veth2_addr=fd::2
+		prefixlen=64
+		family=-6
+		;;
+ *)		echo "Unexpected cmd $cmd" >2
+		exit 1
+		;;
+esac
+
+ip netns add $netns
+ip link add dev $veth1 mtu $mtu netns $netns type veth \
+   peer name $veth2 mtu $mtu
+ip netns exec $netns ip $family addr add ${veth1_addr}/$prefixlen dev $veth1
+ip netns exec $netns ip link set $veth1 up
+ip addr add ${veth2_addr}/${prefixlen} dev $veth2
+ip link set $veth2 up
+
+if [[ -n "$tcpport" ]]; then
+	sshd=$(which sshd)
+	ip netns exec $netns $sshd -p $tcpport &
+fi
+
+echo "$veth2_addr $veth1_addr"
+exit 0
-- 
2.43.5

