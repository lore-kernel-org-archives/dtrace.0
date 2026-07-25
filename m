Received: from outbound.mr.icloud.com (mr-2002i-snip4-11.eps.apple.com [57.103.68.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11F30C35E
	for <dtrace@lists.linux.dev>; Sat, 25 Jul 2026 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002695; cv=none; b=lKUAcL3l47RHtx+/2QkG/n0IR8qGAOsNVS1a1b6sv4doUuanB6ERrCrKwjFgyuifGDmMvJrX/ceKDAC6spLcEhMbd+J+5Hy+A/ZVEJ8vilixGX0DgviL+ydPZNZ5gs6GbBIGfAPh9r0S9sCf7vjBQuC3PU8f4vTXC6v58djIql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002695; c=relaxed/simple;
	bh=gG1q6qVcFfmhZsA1LtbqJ8wdlV0UPmuqoWCJyvD9Bjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BICuF3ulogVmj4pSjughvR+ZWZMJ/emWagBjVpUufXJ3x8QTI5yrqxwxNnKEMlekq21VAH5NJLHvPlmJqf4vCMAmnDF11ai4bl1E6Kzcn5yyQkbKdg+W2+EHcAeJrGH/FzwnD+L08jNSEcj0TTFZC+qGZ6dWlX83q7JFz/ZyIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=sGfEmTrX; arc=none smtp.client-ip=57.103.68.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="sGfEmTrX"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPS id 7E1E91800145;
	Sat, 25 Jul 2026 18:04:51 +0000 (UTC)
X-ICL-RepId: 019f9a73-8b78-7c14-baea-272a7f4bdd35
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBMHV8EXxxHAVYATVIPDxRWF1EtWg4cE1YVEwtTVl8VFxtcABcZUU0LWFsIWwQPH0wMUQJCBVZeVAodBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEFVZDVARfUFQRV1ALWQJCD0gEXwJaCkANSApDDl4CQQtVAEBTBF0SeRVWQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1785002693; x=1787594693; bh=SGpiOqIQFYz4RfqI42D7dQYswTA8qdRdfBimHcXZLec=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=sGfEmTrXWBMagmDKv6zhVd3vFwuAIIrLj9InRMhE9Zd3teJzmjdKjhgbujKVS0US7bh4SedFBxvOU0rUyUS0HunyN6Mi7gjdL2UW3ZRdRkDuTPl73cShMM76f0k7kiXu7AeUV6a/ND2mPucnNivG0RS3+Pwu1naVqUqIiR2KkE7d7jrdUo2S/oDvSNHGVthK4ZUEv55Xm0ZuPHa58h/UtMKIhbQedatkAdG89tN39Xm4srAxsTdlSd1wCY98/SLReqWjHc5zQG5IRFy3AtiY2DEvBwQDU+rA4FKdQt0rHpavPgBvAKidBAYfDmtYTOKkGcXyBQNOR34rIfx2b42qHQ==
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPSA id 3E09718002C8;
	Sat, 25 Jul 2026 18:04:50 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH v2 2/3] libdtrace: derive io provider dev_name from the device model
Date: Sat, 25 Jul 2026 20:04:08 +0200
Message-ID: <20260725180409.95012-3-doob@me.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260725180409.95012-1-doob@me.com>
References: <20260720133100.77573-1-doob@me.com>
 <20260725180409.95012-1-doob@me.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfXwLFQekYEa7FK
 cWGkHRRDNMJIQAAYDcOzJ+nT/+1XqXLJOThkhC9tJ4AwfWDdMcLNb2nl8g+GuZZCbVgOTDcp5Th
 EM8l2z56LC430uUBeTHJtIchhoftIOh9ahsjZ7YuqPa+SGzO5Mma63Tj3WJ+8cuBSzmOxkdcSX7
 y5zJjZmv5Yj8068pa4SHA7Y3tvkBgcyO6BkoKP3d80fhii6+3IQlf4m9b61EP6jHZ2RlUBs3hha
 5WhVVt1QDq1nX5pomMiGl+IwqhHAMnqj4svtbNfH15UGr5bejHCloxHUk4BBUY5dc1q0I9rN/k/
 szSczWjTtS0KyACTcMSP6CAlxAeRl8qGITmvjzRItGffmPZhvtzbbVWvGlHd7U=
X-Authority-Info-Out: v=2.4 cv=F/dat6hN c=1 sm=1 tr=0 ts=6a64fac3
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=RAioF0-LDSMA:10 a=x7bEGLp0ZPQA:10
 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=3uiSnKqcJIKFau5wHCwA:9
X-Proofpoint-ORIG-GUID: oxNL5qVFZvOeR0Um6rUanrsoOyeFYZpE
X-Proofpoint-GUID: oxNL5qVFZvOeR0Um6rUanrsoOyeFYZpE
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

