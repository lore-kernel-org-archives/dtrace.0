Received: from outbound.ms.icloud.com (ms-2002i-snip4-2.eps.apple.com [57.103.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E361DED4C
	for <dtrace@lists.linux.dev>; Mon, 20 Jul 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554311; cv=none; b=ovSwRCEGB04SIar4A15a9hmt58Ugeef9Z7fU7OvmxpA5ysAyhvq/U5zduuvzUGWE3RQhScxRFpw5O/H1YgIq/IFMEmhSRyUnw500DTSK+xIwK8J/HloET2F/1KuR7Dzb/YSt+A40LKlZBg1Xd2JYIuuaXDo7y8xFGDjgdb8v+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554311; c=relaxed/simple;
	bh=CS3U4oNNg/vmn580U4SVh1thqTTnlvw+hc+bRG41OIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bi6cXSUnJ5N+9D8YeANPv6HR+HehRcKynDsjt92d3B+P4gmQ3si1W53ge05+ONno7P8sZcHinza1andbvkcq6DEGMcvaSgoIs1ZzKcSiDKDcnlOWGwl/ed7zf4jqx8t+DvsKBBjNZlDWOVmi6mN/+7i2Lq5Jy0Ec8ioP/LFJniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=EW7Ovk9C; arc=none smtp.client-ip=57.103.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="EW7Ovk9C"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id 73D5418000B7;
	Mon, 20 Jul 2026 13:31:46 +0000 (UTC)
X-ICL-RepId: 019f7fb9-bb3e-7ef9-b7d3-037e7de562a3
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFxVAQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKVwBAC04DWgVbA0MKSQNdGVwFRQ5LHlkaD10fWzheCBkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1784554309; x=1787146309; bh=JSXnfvQZiJVKe7a58oahju+g3VpUinmf9G8lUAUjJPg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=EW7Ovk9C6pLEbNUIkj4aivb49NXqdt04l/YCyqxKpAxUM5sC3E79CYPGabD5rj9up/PLcpFcfrpPxzl36oPHjeUu+qiIFhlhrhcFv7JRUBs8aP6UeTAnCTAO8ZmWZ1IAsy4s8Q9PxeMhDOOTNlG+Ml+C54ExuE/Wckmj8r4uDSbeR7opql0k0t7alycGk7+w2wh50HTpbtamzudaEe5tEVIcHbZpn5FdD7pS6Lt36TbD22VRB4Sxva21nFC7jRaGV5+c8WZBXB+n2ipjvjyE2FrqZS/iPIzQqj143al2oW7S1IJzpVIZobPjlw4K09gfeHrdEugM6s/ALhULPm9Jgw==
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id 0A6931800098;
	Mon, 20 Jul 2026 13:31:44 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH 3/3] libdtrace: match BEGIN/END PID in the tracer's own PID namespace
Date: Mon, 20 Jul 2026 15:31:00 +0200
Message-ID: <20260720133100.77573-4-doob@me.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX0GNG58aVWRmr
 ycMG1cvXTlFF9J1zpBvjI5pNA7lLxtoUEHOCJfdDTZeXTU4FhLYO2JvBzzL9h4Lxrhh4blg77Nh
 dR2112x/L2pbMmeA9siuS/GyEMWEI+ovrXRqIl6FtOvjeZpumSi//ItWTXoXq7INv7Dm0kiYA+Y
 92cbDYwxofGgPD2areHYq91/knqA3JRvA7fqwUnuqyegivMyS30Qa8wLGI47qDHfVVguZc0XFOh
 SYDHz4AMvJekVmdslqEtvZGTdKS2nTZY1yPhBmWOJd8PGRFtVjTGB7T+sDfnkLyjTmDkWdvmcSh
 Hnyb3wZIniB4XzeQ6cT
X-Proofpoint-ORIG-GUID: 6Bf7Xyx1pulDC2XkJwp69ycknoNhZnXE
X-Proofpoint-GUID: 6Bf7Xyx1pulDC2XkJwp69ycknoNhZnXE
X-Apple-Category-Label: MjcyNzI1Njc5OiRjYXRlZ29yeSRfUGVyc29uYWws

Without this fix, running any probe hangs with no output,
like `dtrace -n 'BEGIN { trace("hi"); exit(0); }'`.

The issues is that the `BEGIN/END` probes are implemented as uprobes
on DTrace's own `BEGIN_probe()/END_probe()` functions in `dt_work.c`.
`bpf_get_current_pid_tgid()` reports the TGID in the initial PID
namespace, which does not match `getpid()` when DTrace runs inside a
PID namespace. Using the `--pid=host` flag when running OrbStack does
not help, because it shares the daemon's namespace, not the kernel
init namespace. OrbStack's own supervisor runs in a nested PID
namespace. On bare metal `--pid=host` does reach the init namespaces
and the bug wouldn't appear.

This fix is when DTrace is in a non-initial PID namespace and the
kernel is at least 5.7, use `bpf_get_ns_current_pid_tgid` instead of
`bpf_get_current_pid_tgid`. `bpf_get_ns_current_pid_tgid` is
namespace aware.

Signed-off-by: Jacob Carlborg <doob@me.com>
---
 libdtrace/dt_prov_dtrace.c | 58 ++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 4b788507..179ee4d6 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -9,6 +9,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <string.h>
+#include <sys/stat.h>
 
 #include <bpf_asm.h>
 
@@ -129,12 +130,59 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * the trampoline to minimize the cost of pointless firings in other
 	 * tracers, even though this means preserving the context in %r1 around
 	 * the call.
+	 *
+	 * bpf_get_current_pid_tgid() reports the TGID in the initial PID
+	 * namespace, which does not match getpid() when DTrace runs inside a
+	 * PID namespace (e.g. in a container) -- so the BEGIN/END probes would
+	 * never recognise their own firing and tracing would never activate.
+	 * When we are in a non-initial PID namespace on a kernel that provides
+	 * it (5.7+), use bpf_get_ns_current_pid_tgid() with DTrace's own PID
+	 * namespace so the value is reported in the same namespace as getpid().
+	 * Otherwise fall back to bpf_get_current_pid_tgid(), leaving the
+	 * initial-namespace case (and kernels < 5.7) exactly as before.
 	 */
-	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
-	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, getpid(), pcb->pcb_fastlbl));
-	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+	{
+		struct stat	st;
+		int		use_ns = 0;
+		uint64_t	dev = 0, ino = 0;
+
+		/*
+		 * The initial PID namespace has a fixed inode number
+		 * (PROC_PID_INIT_INO, 0xEFFFFFFC).  If we are in it, getpid()
+		 * already agrees with bpf_get_current_pid_tgid() and no
+		 * namespace lookup is needed.
+		 */
+		if (stat("/proc/self/ns/pid", &st) == 0 &&
+		    st.st_ino != 0xEFFFFFFCULL &&
+		    pcb->pcb_hdl->dt_kernver >= DT_VERSION_NUMBER(5, 7, 0)) {
+			use_ns = 1;
+			dev = st.st_dev;
+			ino = st.st_ino;
+		}
+
+		emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
+		if (use_ns) {
+			/*
+			 * bpf_get_ns_current_pid_tgid(dev, ino, &nsinfo, sz)
+			 * fills a struct bpf_pidns_info { u32 pid; u32 tgid; };
+			 * the tgid is at offset 4.
+			 */
+			dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_1, dev);
+			dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_2, ino);
+			emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_FP));
+			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp, BPF_MOV_IMM(BPF_REG_4, 8));
+			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_ns_current_pid_tgid));
+			emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP,
+					   DT_TRAMP_SP_SLOT(0) + 4));
+		} else {
+			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+			emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+		}
+		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, getpid(),
+					 pcb->pcb_fastlbl));
+		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+	}
 
 	dt_cg_tramp_prologue_act(pcb, act);
 
-- 
2.50.1 (Apple Git-155)

