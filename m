Received: from outbound.qs.icloud.com (qs-2007c-snip4-2.eps.apple.com [57.103.84.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD082EB5A6
	for <dtrace@lists.linux.dev>; Sat,  8 Aug 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.84.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786206820; cv=none; b=NGKdeOSTZgmh8K8/GhHnNAUENiCrjpYI0gWSfkb5inPJrGwZZL39n8XoCmCeMKrfA9YIy86Q4dsVLVoDEVSF6pw2zsTfyIRYBKWG4ndcIkoghlZlT8ZaorMaWcTZCfjnpC/dQlGdm/OHqKNngUAWPgAqW1xRRuUpZhTLrMzJlO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786206820; c=relaxed/simple;
	bh=v6r0h4UBxDTAb6ickE1nG0zZYEtKMw7PHiyARHvo1Fs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lAoYmKehuhlNUhzRlhaIq8Mr6n0o7AhnnZyj8dhbQn0p0dzfwjeA8EPasQolDGoLjtf3K5DljShcpUxBG+E+kxdoqFEeF2q9q9oYOooI2BQl+2/Q0iBp4h5HBZ4enE/bPq/f8YmtqgFaAA1je/QffOXToW/ckrFBli7zbpOSUKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=CydC1FC9; arc=none smtp.client-ip=57.103.84.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="CydC1FC9"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-6 (Postfix) with ESMTPS id 5DA9D1800115;
	Sat, 08 Aug 2026 16:33:35 +0000 (UTC)
X-ICL-RepId: 019fe239-0479-7bde-9931-e8b3dc4287a9
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFwlAQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKV3Y2ekECK3NSHzQAQQpAAyp0QxQ5BikERgIye0p1K3ReBUkNTnMAUkVRH1RGExlOG1dNUBtfAkIP
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1786206817; x=1788798817; bh=TfcW0UlOJC72jhMEr57TPiDbpdd9QbIUzrs1YCMu27o=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=CydC1FC9ep+78z5ytFESlmkH7x761tZWcC2oOhT32omzGGiQwmOg1PyYzX8zCkvvVOkS1FK0r9P61BePYw+rqQANVoRuERGIYHA+aWOigZOewLGodRB4xsiKxSaf95cQja9QI+BJyWSLPme8Eg93N9RDEe4W91nnau9sc75RWH5PUkAB78X5l2QmCc0dEWdjhPucevFxkg2TvkHlF1ZFBUvXaomqeYpg8EdlBWuiIJJlEtRhwOwHnuhO5ODFQiSLAp5zEGPxD8vV2djh2XRPP1hy1DOKAdZdjvljdHZq2wHFvP0/O9597q4RISslQMBzINqatLOIOGw+4BK4okmATw==
Received: from smtpclient.apple (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-6 (Postfix) with ESMTPSA id 6B58418002F8;
	Sat, 08 Aug 2026 16:33:32 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3897.100.8.1.1\))
Subject: Re: [PATCH v2 3/3] libdtrace: match BEGIN/END PID in the tracer's own
 PID namespace
From: Jacob Carlborg <doob@me.com>
In-Reply-To: <anNvC9SSZEv6CiyQ@oracle.com>
Date: Sat, 8 Aug 2026 18:33:20 +0200
Cc: dtrace@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <DFC91FD9-D999-4AF3-A5D3-0BB2FFC57946@me.com>
References: <20260720133100.77573-1-doob@me.com>
 <20260725180409.95012-1-doob@me.com> <20260725180409.95012-4-doob@me.com>
 <anNvC9SSZEv6CiyQ@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
X-Mailer: Apple Mail (2.3897.100.8.1.1)
X-Proofpoint-GUID: yEbkY4NTqR3rh_MXUOayn_D5ctqqfZfS
X-Authority-Info-Out: v=2.4 cv=JuL8bc4C c=1 sm=1 tr=0 ts=6a775a60
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=x7bEGLp0ZPQA:10 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=HHGDD-5mAAAA:8 a=YXIq5WJTTUf5TPSkxToA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yEbkY4NTqR3rh_MXUOayn_D5ctqqfZfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE0MyBTYWx0ZWRfX/14eS7bWmHmc
 PLh1kDzHSWYiA16ewqnq4WPOLFxNfgM1J8RC6sm1kIKAoqar2GkfDV3KqfNVia/wRlCF98Q+mfM
 dJzKGOOsisxbjd6tLtefvNYeBwyjXCgUw+UsPvwCr9gdLSaDoFNyijRlTozwz7YwRWbPjRl+jGk
 4EBn7yeD6TBBfqVC3bR8qrpflWOwQJdqqinLBKtocM7gMkcEkfdbaJn0SwUqLD+OosEmoyKtNYu
 6T/fcH5XXvwT6q3fzP4hMjJPJ5zW+HyJ5+EaIcdwgGv9o/25xzaawBJdmqGWDA/HTjPt2y2a40z
 wc/JtTi7hYHQ4n3OR57HCtWNPHjlfkt3Qbajc4zzGQgW2Ru+ULYsINIyFTL+9c=

Ok, sounds good. Thanks.

--
/Jacob Carlborg

> On 5 Aug 2026, at 19:12, Kris Van Hees <kris.van.hees@oracle.com> =
wrote:
>=20
> Thank you for this patch.  I actually implemented the code to get the =
dev/ino
> pair for the PID namespace in dt_vopen() so that we can store the =
values in
> dtrace_hdl_t.  That way it is available to all places that need to =
retrieve
> pidns-aware PID and TGID values.  I also added a function =
dt_cg_ns_pid_tgid()
> to encapsulate the code to use the correct BPF helper based on whether =
we are
> in the initial PID nameaspace or not, and I therefore modified your =
patch to
> simply call that function rather than doing the work here.
>=20
> I'm updating the other places in the code that need to be pidns-aware, =
and will
> post the entire series once I am done with that.
>=20
> I am also adding tests so that our testsuite going forward can ensure =
that
> DTrace works in a PID namespace.
>=20
> Kris
>=20
> On Sat, Jul 25, 2026 at 08:04:09PM +0200, Jacob Carlborg wrote:
>> Without this fix, running any probe hangs with no output,
>> like `dtrace -n 'BEGIN { trace("hi"); exit(0); }'`.
>>=20
>> The issues is that the `BEGIN/END` probes are implemented as uprobes
>> on DTrace's own `BEGIN_probe()/END_probe()` functions in `dt_work.c`.
>> `bpf_get_current_pid_tgid()` reports the TGID in the initial PID
>> namespace, which does not match `getpid()` when DTrace runs inside a
>> PID namespace. Using the `--pid=3Dhost` flag when running OrbStack =
does
>> not help, because it shares the daemon's namespace, not the kernel
>> init namespace. OrbStack's own supervisor runs in a nested PID
>> namespace. On bare metal `--pid=3Dhost` does reach the init =
namespaces
>> and the bug wouldn't appear.
>>=20
>> This fix is when DTrace is in a non-initial PID namespace and the
>> kernel is at least 5.7, use `bpf_get_ns_current_pid_tgid` instead of
>> `bpf_get_current_pid_tgid`. `bpf_get_ns_current_pid_tgid` is
>> namespace aware.
>>=20
>> Signed-off-by: Jacob Carlborg <doob@me.com>
>> ---
>> libdtrace/dt_prov_dtrace.c | 58 =
++++++++++++++++++++++++++++++++++----
>> 1 file changed, 53 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
>> index 4b788507..179ee4d6 100644
>> --- a/libdtrace/dt_prov_dtrace.c
>> +++ b/libdtrace/dt_prov_dtrace.c
>> @@ -9,6 +9,7 @@
>> #include <assert.h>
>> #include <errno.h>
>> #include <string.h>
>> +#include <sys/stat.h>
>>=20
>> #include <bpf_asm.h>
>>=20
>> @@ -129,12 +130,59 @@ static int trampoline(dt_pcb_t *pcb, uint_t =
exitlbl)
>>         * the trampoline to minimize the cost of pointless firings in =
other
>>         * tracers, even though this means preserving the context in =
%r1 around
>>         * the call.
>> +        *
>> +        * bpf_get_current_pid_tgid() reports the TGID in the initial =
PID
>> +        * namespace, which does not match getpid() when DTrace runs =
inside a
>> +        * PID namespace (e.g. in a container) -- so the BEGIN/END =
probes would
>> +        * never recognise their own firing and tracing would never =
activate.
>> +        * When we are in a non-initial PID namespace on a kernel =
that provides
>> +        * it (5.7+), use bpf_get_ns_current_pid_tgid() with DTrace's =
own PID
>> +        * namespace so the value is reported in the same namespace =
as getpid().
>> +        * Otherwise fall back to bpf_get_current_pid_tgid(), leaving =
the
>> +        * initial-namespace case (and kernels < 5.7) exactly as =
before.
>>         */
>> -       emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
>> -       emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>> -       emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>> -       emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, getpid(), =
pcb->pcb_fastlbl));
>> -       emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
>> +       {
>> +               struct stat     st;
>> +               int             use_ns =3D 0;
>> +               uint64_t        dev =3D 0, ino =3D 0;
>> +
>> +               /*
>> +                * The initial PID namespace has a fixed inode number
>> +                * (PROC_PID_INIT_INO, 0xEFFFFFFC).  If we are in it, =
getpid()
>> +                * already agrees with bpf_get_current_pid_tgid() and =
no
>> +                * namespace lookup is needed.
>> +                */
>> +               if (stat("/proc/self/ns/pid", &st) =3D=3D 0 &&
>> +                   st.st_ino !=3D 0xEFFFFFFCULL &&
>> +                   pcb->pcb_hdl->dt_kernver >=3D =
DT_VERSION_NUMBER(5, 7, 0)) {
>> +                       use_ns =3D 1;
>> +                       dev =3D st.st_dev;
>> +                       ino =3D st.st_ino;
>> +               }
>> +
>> +               emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
>> +               if (use_ns) {
>> +                       /*
>> +                        * bpf_get_ns_current_pid_tgid(dev, ino, =
&nsinfo, sz)
>> +                        * fills a struct bpf_pidns_info { u32 pid; =
u32 tgid; };
>> +                        * the tgid is at offset 4.
>> +                        */
>> +                       dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, =
BPF_REG_1, dev);
>> +                       dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, =
BPF_REG_2, ino);
>> +                       emit(dlp, BPF_MOV_REG(BPF_REG_3, =
BPF_REG_FP));
>> +                       emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, =
DT_TRAMP_SP_SLOT(0)));
>> +                       emit(dlp, BPF_MOV_IMM(BPF_REG_4, 8));
>> +                       emit(dlp, =
BPF_CALL_HELPER(BPF_FUNC_get_ns_current_pid_tgid));
>> +                       emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, =
BPF_REG_FP,
>> +                                          DT_TRAMP_SP_SLOT(0) + 4));
>> +               } else {
>> +                       emit(dlp, =
BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>> +                       emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, =
32));
>> +               }
>> +               emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, =
getpid(),
>> +                                        pcb->pcb_fastlbl));
>> +               emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
>> +       }
>>=20
>>        dt_cg_tramp_prologue_act(pcb, act);
>>=20
>> --
>> 2.50.1 (Apple Git-155)
>>=20
>>=20
>>=20

