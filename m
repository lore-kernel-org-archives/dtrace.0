Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205CA921
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 04:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753935174; cv=none; b=j7c9Vq/KWv0TaTax7ORRSAaRba8+afMfjkB+cQDqOxSCtpfBhMKbZT8F9pNA/dI8wDg7WaYCpWSnlZstghazim0HYmlX9XSmjv+7+hh50x2U1zvfKnFeYIsW4aiuhKPXMAfilPFMiryQEM6ttNN4Nk45jNXg4t4GAx7vWL9AGOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753935174; c=relaxed/simple;
	bh=FksURXHKVIKd7nZZfreHfCDc5ejoHVkeR97dXDFNEEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=obVPsKnjaqnNLRZcCScDAlXP96J9EEIKNV46CJR5FXuk1OMWTWb7P45g8HA4kpmnOmFyvCdr//uQMbe3796K1DP7InlBx1aR3ti5ttUK5pJP+NBEbgZPvP9ABwtcAozT6HutGq/g5FIl+lC7dE75PduQIZMNvN9zjb7+xYXm8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 784A2340E39;
	Thu, 31 Jul 2025 04:12:51 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] bpf: compile BPF library functions with
 -ffreestanding
In-Reply-To: <SJ0PR10MB567217E9DF1F38898F33711BC227A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Organization: Gentoo
References: <SJ0PR10MB567217E9DF1F38898F33711BC227A@SJ0PR10MB5672.namprd10.prod.outlook.com>
User-Agent: mu4e 1.12.11; emacs 31.0.50
Date: Thu, 31 Jul 2025 05:12:48 +0100
Message-ID: <875xf93sn3.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> Per Jose, we should be compiling our BPF code with -ffreestanding to
> ensure that BPF-specific standard header files are used instead of
> host-specific ones.

Consider adding a link to https://gcc.gnu.org/PR121259 and
https://bugs.gentoo.org/959876.

Thanks -- it fixes the problem and it looks right.

Tested-by: Sam James <sam@gentoo.org>
Reviewed-by: Sam James <sam@gentoo.org>

>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  GNUmakefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/GNUmakefile b/GNUmakefile
> index b8e09f574..7ad857f88 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -127,7 +127,7 @@ PREPROCESS = $(CC) -E
>  export BPFC ?= bpf-unknown-none-gcc
>  
>  BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
> -BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal)
> +BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
>  export BPFLD ?= bpf-unknown-none-ld
>  
>  all::
