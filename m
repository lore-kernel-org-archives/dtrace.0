Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A397D380
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724985765; cv=none; b=f7nqD1G//TLJSicf2Aip7GQdJhUpFlNZW5pHlR+hKDKv721ZOuSkSDMFwGjbBItEfz+Apo7wqJNSiUdCijp7BF5+QkM6SLhO83l+rYWPjR753Y8zbl8NLvSrHn7iYCuk0o3l7kx9BvWledWIpozXd4gkfSM//kH42ajpqmXpFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724985765; c=relaxed/simple;
	bh=2erBZLf+JbHd+dX521YXCFT4729vCCPPDNAMMP4AmwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+rLkHQzOMc/SmA0k83SvB/47Qf+iDYNeSHxlwoYn+RVbcW7TaK6YOMUfoks+DkLp4W7+2lCq/eex7ylmI2PXvsHEODtahYFI0Vzmc1B4+m9DDZsDveNx7Z/fCw2PD/4ydMQ6doCZOc+qbSdscj0SahzgNfQXBRwYCxVNtbeXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH] cmd: drop legacy DTrace references
Date: Fri, 30 Aug 2024 03:42:27 +0100
Message-ID: <66555d41665c9ed4e1cae5428739316ad8a2cb03.1724985747.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't have a kernel module anymore.

Signed-off-by: Sam James <sam@gentoo.org>
---
 cmd/dtrace.8 | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 44382e1e..d82ed209 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -181,15 +181,6 @@ Print CTF type library debugging output on standard error.
 Set a given DTrace option.
 
 Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
-.IP DTRACE_MODULES_CONF
-The location of the file containing names of kernel modules to load (see below).
-If unset, \fB/etc/dtrace-modules\fR.
-
-.SH "FILES"
-.LP
-The following files are consulted:
-.IP /etc/dtrace-modules
-A list of kernel module names, one per line, which are loaded in addition to \fBdtrace.ko\fR if the \fBdtrace\fR device is not found.  (Failure to load these modules is not an error.)
 
 .SH SEE ALSO
 .BR cpp (1),
-- 
2.46.0

