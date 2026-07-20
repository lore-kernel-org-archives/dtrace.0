Received: from outbound.ms.icloud.com (ms-2001g-snip4-11.eps.apple.com [57.103.73.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF76182D6
	for <dtrace@lists.linux.dev>; Mon, 20 Jul 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554307; cv=none; b=qPpzd4sprirGX74GnWV/IPTvvlPyCIj2wJ7cIo9jlAPek/QP69EGZe0c/SacupJAbsTIu0GQWK66fdoDYWUCq4yy9o7FRqVCpJr8gLeimSB24wo+3fHYE0ED0ST0aEptdWaK8KtC8/2LJXz6p3H3/qW+Amsy4kPan57Zoh0WDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554307; c=relaxed/simple;
	bh=gG1q6qVcFfmhZsA1LtbqJ8wdlV0UPmuqoWCJyvD9Bjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9gFHLs6kut55cwtPDWysr5yvcayyd9u7YLmUI1rCTHWfsyMr6I8LW5HM6zs2pDxEAIZp+ET1Ec4fULG3XuVmc0mlgb56mZL3MeeqAtS1kJIpQwg/Ka/O5qRiVTh2/IoS2VIE/FynleLlxyJMSeJs1d5zBfaHTTwr99ikgNmopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=IwmxzP1s; arc=none smtp.client-ip=57.103.73.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="IwmxzP1s"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id A7D9518000E7;
	Mon, 20 Jul 2026 13:31:42 +0000 (UTC)
X-ICL-RepId: 019f7fb9-aca9-7c8c-b13f-65fb7d0fcdf1
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFxVAQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKVwBAC04DWgVbA0MKSQNdGVwFRQ5LHl4aD10fWzheCBkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1784554305; x=1787146305; bh=SGpiOqIQFYz4RfqI42D7dQYswTA8qdRdfBimHcXZLec=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IwmxzP1sARGxnNvD2dzp3OD8nkx1h2qsveBcBcMKuwjlnorkSiiuQbj4gM30UV2P0oaOyT5IQmvIiFQMU5T9AXAIglPeweUM8kLDfhCrOcncDqt8ZltTT2FTmaYhpOl7NtgbLZg4Arobnn6Kru2x+yoxikHPHM+C38wAySG2iH8NIha+4v2tR8pO7+GdTD7dDON5+uUZ7cTGznrZ9JDOEnRxbWBbBFBCwaUF1SEukt3A6dekekbfPyGY6wYyqYWVJCEA99iJ23vzeIepph2a2NCmsGqzCKwYLaMCATD1YFzK9JCWzq6f8Axqh7/GcKa1ijKvVHPNKcKUpRTnUx7Tsw==
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id 93F3B18000CE;
	Mon, 20 Jul 2026 13:31:41 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH 2/3] libdtrace: derive io provider dev_name from the device model
Date: Mon, 20 Jul 2026 15:30:59 +0200
Message-ID: <20260720133100.77573-3-doob@me.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720133100.77573-1-doob@me.com>
References: <20260720133100.77573-1-doob@me.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w92ejCtuoQRQzz1ux5be2OivMFcAgsJS
X-Proofpoint-ORIG-GUID: w92ejCtuoQRQzz1ux5be2OivMFcAgsJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfXw06krP02B+dM
 O3FtTwTwTw0RAu9glxI12RLS921uU8axisbUXd8FprciYDNMO7m/smLAPjMMk8mhBi9EyGM006I
 cg9waCukHgRzsfYFbRx1dg7/vnx6882wfsKcPz9tQWs31HGVwGKrlVip8nDWXF0iTpyU4h3EGIr
 qRG8Vl6+K/XR+p25KHlxzC4pLu78rcixrSxlFq4lpL+AXWjMiW3KL0/Qhk2yrAgiVNLvHP0kbFB
 BVHLamL7h7iiZ+rNC1JaW8sZEhmuexE9rBU4XkdQtTUqW7WKvWKdT2jAH/U5mMxSeUG+BXpKq6x
 VUqxVXqiWHE6TiCVnkt
X-Apple-Category-Label: MjcyNzI1Njc5OiRjYXRlZ29yeSRfUGVyc29uYWws

Without this fix, running any DTrace commands, like `dtrace -l`,
results in:

```
dtrace: invalid probe specifier :::: "/usr/lib64/dtrace/6.12.0/io.d",
line 134: failed to resolve vmlinux`major_names: Unknown symbol name
```

The issue is that on newer kernels the `major_names` symbols is not
available in `kallsyms` anymore. For example, running `grep -w
major_names /proc/kallsyms` on a newer kernel shows no results.
Running the same command on an older kernel gives the following
result:

```
$ grep -w major_names /proc/kallsyms
0000000000000000 b major_names
```

The fix is to stop depending on the `major_names` symbol and instead
derive `dev_name` from the device model (the driver name), mirroring
the `struct buffer_head` translator.

Signed-off-by: Jacob Carlborg <doob@me.com>
---
 libdtrace/io.d.in | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index 5ea356ee..e96a5b23 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -124,16 +124,27 @@ translator devinfo_t < struct buffer_head *B > {
 		       );
 };
 
+define_for_kernel([[__part0_dev]], [[(m4_kver(5,11,0), [[part0->bd_device]])]], [[part0.__dev]])
 #pragma D binding "1.6.3" translator
 translator devinfo_t < struct bio *B > {
 	dev_major = B->__disk_chk == NULL ? 0 : getmajor(B->__bio_part_dev);
 	dev_minor = B->__disk_chk == NULL ? 0 : getminor(B->__bio_part_dev);
 	dev_instance = 0;
+	/*
+	 * Derive the driver name from the device model rather than the kernel's
+	 * `major_names` array: that symbol became static and is no longer
+	 * resolvable via kallsyms on newer kernels.  This mirrors how the
+	 * struct buffer_head devinfo translator above obtains dev_name.
+	 */
 	dev_name = B->__disk_chk == NULL
 		? "nfs"
-		: stringof(((struct blk_major_name **)vmlinux`major_names)[
-				getmajor(B->__bio_part_dev) % 255
-			   ]->name);
+		: B->__disk->__part0_dev.parent
+			? B->__disk->__part0_dev.parent->driver->name
+				? stringof(B->__disk->__part0_dev.parent->driver->name)
+				: "<none>"
+			: B->__disk->__part0_dev.driver->name
+				? stringof(B->__disk->__part0_dev.driver->name)
+				: "<none>";
 	dev_statname = B->__disk_chk == NULL ? "nfs" :
 	    (B->__bio_partno) == 0 ? stringof(B->__disk->disk_name) :
 	    strjoin(stringof(B->__disk->disk_name), lltostr(B->__bio_partno));
-- 
2.50.1 (Apple Git-155)

