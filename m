Received: from outbound.mr.icloud.com (mr-2002a-snip4-1.eps.apple.com [57.103.68.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17034324B32
	for <dtrace@lists.linux.dev>; Sat, 25 Jul 2026 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002698; cv=none; b=fmPjJ2VuyX+rvppcyABJvMdxkrSantu4xFmT3WryFkLDtET6ExgMnpSrQtLwvjW2xMB8XW7i5twnFyrvMgKnptU0I/8+jSd2qmtnFoRlsQ2R+x7N7sT8gQ2dUOdSmF336JmzqhQ0e8qgBbYjlU++qYgPkdJWXPVVAIWwKZRks0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002698; c=relaxed/simple;
	bh=CS3U4oNNg/vmn580U4SVh1thqTTnlvw+hc+bRG41OIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mz1oOItMgDKQPuEwfCwTvNViIo4EyXTxR1Xx4ul0oMzji64mT+UZb+gIedhrjar9kXOpkreCvKpmurQNeFCySWah8V6oEtvZD4UWRoaMDts+gwHBdlXcYF6AZvQ+JN25aSLHssAqj0/XNe9it4jiCBYbuuSEAvnLlN4Av2kt2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=YdB5ez4+; arc=none smtp.client-ip=57.103.68.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="YdB5ez4+"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPS id D881F18002E9;
	Sat, 25 Jul 2026 18:04:53 +0000 (UTC)
X-ICL-RepId: 019f9a73-9494-7d8b-af06-75dd663817a5
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBMHV8EXxxHAVYATVIPDxRWF1EtWg4cE1YVEwtTVl8VFxtcABcZUU0LWFsIWwQPH0wMUQJCBVZeVAodBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEFVZDVARfUFQRV1ALWQJCD0gEXwJaCkANSApDDl4CQQtVB0BTBF0SeRVWQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1785002696; x=1787594696; bh=JSXnfvQZiJVKe7a58oahju+g3VpUinmf9G8lUAUjJPg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YdB5ez4+wJc1alCyXi9R+6mareHQJGuXbzlAmeJH8hyEc2wwN0ssZ5yEOKZ5gr1g2AAJi0NPz61MQPEJlF/FD4N+Vl+YmA5ykiERhAOKZqun+2mp7XhhgfS5dGJpiFgX5AP+Gp0V0rWxwV8roclGVi4thaHsy+ICWT3W+qpEfi03/JNFN8mdsWbb8atV8R6BRftQ7V2xinW9wCXoefxh83d1iSLkxhVYZMru8k0HPW6pzg6tGTFgUg3SzJ6G4H953Ino87ZTx9uy+Ip538vCP9sZTNTzmoclgWnjoMag90ZVIEt+ndNJ7OcanieLp33KoQJpQXKHLgW4Ja1D85/cEg==
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPSA id 567A3180050F;
	Sat, 25 Jul 2026 18:04:52 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH v2 3/3] libdtrace: match BEGIN/END PID in the tracer's own PID namespace
Date: Sat, 25 Jul 2026 20:04:09 +0200
Message-ID: <20260725180409.95012-4-doob@me.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX+dMBrIsAJwSe
 a8AQNBn1vm7w4CzE0yMlvwTalCse3oi5cImHMUNjOPi4tYE6Zpg1LgAVs8jJw8AQN6GrFenqF8l
 hv/NOaMWqLhj5XJkVFpF9ywUi2xgeDr+SpFEoLKorKr6eMKCp83Ola9lVXioCCHTVOq/MC+oC2Q
 2BuRRg1znj7Crr1M2K9gFaZ++zbnUdBV4AZoSZLnG4tC6zMg8jEApTlpffsJQAwl0qOa8tdz6nu
 B7Apb7n5v4kABrMVxtkmENnljCZhl60bbVJNYUdnKfC6YALSPxf7bS7gjmW41tbi4jm7AxDYjWa
 rKJIreTc7zMq3AbL/UW/nbBfHbUa0tV0KzdWplQb8s/XPn/7vC1H4EFCP31J+k=
X-Proofpoint-GUID: W2MyzFhmOJiHNDGN3wDGV-EIX0_NyWDe
X-Authority-Info-Out: v=2.4 cv=dfWNHHXe c=1 sm=1 tr=0 ts=6a64fac6
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=RAioF0-LDSMA:10 a=x7bEGLp0ZPQA:10
 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=i82P4dcYOTqUXzP-WAIA:9
X-Proofpoint-ORIG-GUID: W2MyzFhmOJiHNDGN3wDGV-EIX0_NyWDe
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

