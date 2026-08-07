Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7DC246788
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786070038; cv=none; b=OJfNw7P/UO9WHqa3c4HwWV/F6jT1JwGqAr804IOu5Git/PvqdR8LGoC1YlgFkhSk7kSusrm5WAFEBA7/aUVOVMM5fvSgw7uTGQmnfY3vsekIIiiAv4EJsyDvaOCp0P7aLJV/ZaWlqA6wdRI7guXEYr6MA+VkPb86d7b7D5MteH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786070038; c=relaxed/simple;
	bh=8PGa+y+wE6LJqRaPLF2tQwhpcV4RGZp+GawwOxuMCLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9X/5oXzd0KqowABkiJVmEuMCCV2lchwN+t9petEDjO9LamneyXgg/KVMgOuH4xzxTt8TWVU+WE6tzrb4fyw+OAwR8OjeK7RaoNfQeCRfbIxGGqTJQPNWnka5SnhI8QEtvIiARjlt1/En/MdZZVCv/VvJXmJClmcZKaNf8+NshI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRE/mXpN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRE/mXpN"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so3115660a91.3
        for <dtrace@lists.linux.dev>; Thu, 06 Aug 2026 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786070037; x=1786674837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=trdUNXd6P6DKT9PxxU64QygWdStSWjomF1nEXn7dbGg=;
        b=WRE/mXpNFgEILJStH6toEATQLav7q1TuNzHEcgJJuQwP+SbDoqQxasJEkYYJ9BCGz3
         kRa/1LFPLywgU+o3+4gQAm+vmaBfDCLJy6fd88/7u7t29zC/3yt/6NKhGokURVhdmWK3
         CToTjK9I6CgrEDHnP9X8Wq42f6GoxUMNFX4IEDaJaxXwVr6FiVuqZwltPilZBS98Jm1k
         XDUpSXpIrrROamxg4TUcSZYr8XXnCMCD8wXK9GUyBdbNr4k2my/LDCGhxvYQ849lefHM
         bstiy2bLKXrRAYPTiHYGyEY6C1iJifU8H9hPySJe7pCWj/cnvtQTEJA1Deh1wUrI8SaX
         pyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786070037; x=1786674837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trdUNXd6P6DKT9PxxU64QygWdStSWjomF1nEXn7dbGg=;
        b=C3nDmc18KhfFcXNdUT8y38Wxy5xoZfPq5XXvafHrs9+AsBeb4czITbQFS7Y+2XDE8J
         vjrmWIgeHQPcze4ObomkKi7vLLcQ8v7wOLKvSL9TZ37MgKDygVJVHikVOlSTa+l/yUy/
         LRXpmZsXIcRlkTm9+Nb6FnGoXAGoKjvEZ8sQZi7l7fCIwsHwNk+PQ0J4d9Ia0sKAzmL6
         YOFO3IdwyE1xQ3Q5d1OqPl0UY54nrVVTf5BA0zmpVNUyCvMlPA75a/7QWUbvhdupcED8
         FoQJb0kyIpg/lA6bhOf0Fdt0Vz56hXJhR5I0XHfSnQ/UA4t0f/K0gUSweBHwgJ+0nwdC
         M+jg==
X-Forwarded-Encrypted: i=1; AHgh+RpWnzMNks+hd61L/QWPMninuqJfyjE9AsTOELGmsnVcNTmpyVZJgakpxFBL7zqI9bzryYwPwPY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGgP7WBJ40QZrOqT+obi2U3R4ANpLytZSqYGN6Lq/Ze3A3BuC3
	7Rl92KbOBJQvL9pQge6PTJbqItwPTxhAFKeG2RCcZ94rJYing2sw8XZR
X-Gm-Gg: AR+sD12dNNmFq9hHxEzBGVOIzQTlB9E7T5/ylzQ1TO2VOr7pnMTLqET+zj48kh4kvcV
	p0u5K2WFL6brZ+JO+FfKCyCkHhlq+fj1l7Ymsba7BbdZNE4fF4FRNPHyOOZE5wio/8X8CT2gQ4I
	7NffcSpWXDfSU1kHILLoTJ8yIOM2wEPa9+7gHp3NKdoOKjXYsPaArZVdgRFWQTupG9x1GP5nthy
	Azb6pSoDVa7ANhRMNaCVSCXYWKV+OaVPQiwCgh1oi9s0fEwVAcYZ6gLOfaN8qGY71SOB78z7ete
	6aLAUHuhe3rad5Yz0SBv4q7w3FlKLinyva8Zt3wtSO9pEY4AZQJMmZVY/5r/Ogx0iX2P5n5ZzB3
	vYZjwYqTD75l5trDLXvzyrcCADJNBSGAFsmEq3x5frrML1VeOZeXL3OpPHHyAEprs118Qcd9kl+
	A/Sr9NvpFFYE0glbr53cFE+CKtkIsLh8fG3PtZHzHKWW22zObiV1qDGZyBWS1Tag6l1HZHGwrt7
	vyiIR3NIzTu
X-Received: by 2002:a17:90b:2f03:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-3903c53404amr20820427a91.7.1786070036703;
        Thu, 06 Aug 2026 19:33:56 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm163254a91.2.2026.08.06.19.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 19:33:56 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Greg Marsden <greg.marsden@oracle.com>,
	dtrace@lists.linux.dev,
	dtrace-devel@oss.oracle.com,
	zhanxusheng@xiaomi.com
Subject: [PATCH] llm: fix newline escape in the SKILL.md script skeleton
Date: Fri,  7 Aug 2026 10:33:49 +0800
Message-ID: <20260807023349.1133517-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The skeleton's BEGIN and ERROR clauses use "\\n" where "\n" is meant.
In a D string literal that is an escaped backslash followed by 'n', so
printf() emits a stray backslash instead of a newline.

Agents copy the skeleton verbatim, and "\\n" is a valid literal, so the
'dtrace -e' check prescribed in the same file does not catch it.

Every other D snippet in the tree uses a single backslash.

Assisted-by: Kiro:claude-opus-4.8
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Not tested under DTrace; this is purely a string-literal escape.
Applies to devel (30c9c22).

One thing I left alone: the skeleton's ERROR clause prints probeprov/
probemod/probefunc/probename, but those describe the probe that is
currently firing, which inside an ERROR clause is dtrace:::ERROR itself
rather than the probe that faulted.
doc/userguide/reference/dtrace_providers_dtrace.md gives the culprit as
arg1 (its EPID) and the fault type as arg4, and
examples/language_features/001intro-ERROR-probe.d sidesteps this by
printing a static message.  Should the skeleton use arg1/arg4?

Also minor: the "Target one process" pattern needs -p PID or -c CMD,
which the suggested "sudo dtrace -s script.d" does not provide.

 llm/SKILL.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/llm/SKILL.md b/llm/SKILL.md
index e5e2f3e..a6ff502 100644
--- a/llm/SKILL.md
+++ b/llm/SKILL.md
@@ -66,7 +66,7 @@ probe-descriptions
 
 dtrace:::BEGIN
 {
-    printf("Tracing started...\\n");
+    printf("Tracing started...\n");
 }
 
 /* tracing clauses */
@@ -78,7 +78,7 @@ dtrace:::END
 
 dtrace:::ERROR
 {
-    printf("DTrace error at %s:%s:%s:%s\\n", probeprov, probemod, probefunc, probename);
+    printf("DTrace error at %s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
 }
 ```
 
-- 
2.43.0

