Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023B148FF0
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963522; cv=none; b=DTKOBsbNHt7hzSNdgQDVOHQMp3U+TdHEe/3bqZk0lwu7B5jk/M8HWzrtRdSuS52sOrmZZMbtcJoLZfkU4U8NmXAY7Pkte6ZeLLzupj4APM07epbdcKWO10j06rs7cvAXl6OlFouWNFMU4oAx96M5PBZCqnWXRWF320jPIENQbsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963522; c=relaxed/simple;
	bh=mwpG8KGQL1FdDbpqehkQMq4J9MwPhphm6I00UasD218=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gkZJlFi+k1w9t4PXvGyvU2YT/cewNJWBUW4Qa9hUAlrUgPOTqxp3MN8vCgZ+E7mFkOaCAtDI0r2KQI7aJ1ZJPTazMMNcJPDWDdPX/Jym5rplHT6Zu9qwuO/i5Yd38044CywKvc4e+IMc1nYk7jabzVa7yW9KKXiy+Mg/Oa+BSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 15/19] Ignore clauses: some clauses are
 impossible regardless of uprp
In-Reply-To: <20240829052558.3525-15-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 29 Aug 2024 01:25:54 -0400")
Organization: Gentoo
References: <20240829052558.3525-1-eugene.loh@oracle.com>
	<20240829052558.3525-15-eugene.loh@oracle.com>
Date: Thu, 29 Aug 2024 21:31:57 +0100
Message-ID: <87ikvjf4ua.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> In ignore_clauses, for an underlying probe uprp, we try to
> decide if we can safely ignore clause n.
>
> Meanwhile, for some clauses, the probe description tells us the
> clause will not be called for any USDT probe, regardless of the
> underlying probe.  For example, "syscall::write:" can safely be
> ignored, for all uprp.
>
> Add a dtsd_usdt variable to each statement to track status:

Not that it really matters here, but I wonder why not an enum?

>
>     USDT_FLAG_UNINITIALIZED  not yet initialized
>
>     USDT_FLAG_POSSIBLE       clause could possibly be called
>                              for some USDT probe
>
>     USDT_FLAG_IGNORE         clause can safely be ignored for
>                              all USDT probes
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 56 ++++++++++++++++++++++++++++++++++++--
>  libdtrace/dtrace.h         |  1 +
>  2 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 883a3e9d..454c53dc 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -27,6 +27,7 @@
>   */
>  #include <sys/types.h>
>  #include <assert.h>
> +#include <ctype.h>
>  #include <errno.h>
>  #include <string.h>
>  
> @@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +#define USDT_FLAG_UNINITIALIZED	0
> +#define USDT_FLAG_POSSIBLE	1
> +#define USDT_FLAG_IGNORE	2
> +
>  /*
>   * Judge whether clause "n" could ever be called as a USDT probe
>   * for this underlying probe.
> @@ -239,7 +244,53 @@ grow_strtab(dtrace_hdl_t *dtp)
>  static int
>  ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  {
> -	/* To be safe, ignore nothing. */
> +	dtrace_probedesc_t	*pdp = &dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe;
> +	int			*usdt_stat = &dtp->dt_stmts[n]->dtsd_usdt;
> +
> +	/*
> +	 * Some clauses could never be called for a USDT probe,
> +	 * regardless of the underlying probe uprp.  Cache this
> +	 * status in dt_stmts[n]->dtsd_usdt (pointed to by usdt_stat).
> +	 */
> +	if (*usdt_stat == USDT_FLAG_UNINITIALIZED) {
> +		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
> +
> +		/*
> +		 * If the last char in the provider description is
> +		 * neither '*' nor a digit, it cannot be a USDT probe.
> +		 */
> +		if (lastchar != '*' && !isdigit(lastchar)) {
> +			*usdt_stat = USDT_FLAG_IGNORE;
> +			return 1;
> +		}
> +
> +		/*
> +		 * If the provider description is "pid[0-9]*", it
> +		 * is a pid probe, not USDT.
> +		 */
> +		if (strncmp(pdp->prv, "pid", 3) == 0) {
> +			int i, l = strlen(pdp->prv);
> +
> +			for (i = 3; i < l; i++)
> +				if (!isdigit((pdp->prv[i])))
> +					break;
> +
> +			if (i == l) {
> +				*usdt_stat = USDT_FLAG_IGNORE;
> +				return 1;
> +			}
> +		}
> +
> +		/* Otherwise, it is possibly a USDT probe. */
> +		*usdt_stat = USDT_FLAG_POSSIBLE;
> +	}
> +	if (*usdt_stat == USDT_FLAG_IGNORE)
> +		return 1;
> +
> +	/*
> +	 * If USDT_FLAG_POSSIBLE, try to use uprp.
> +	 */
> +
>  	return 0;
>  }
>  
> @@ -267,7 +318,8 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
>  	 */
>  	memset(&pcb, 0, sizeof(dt_pcb_t));
>  	for (i = 0; i < dtp->dt_clause_nextid; i++)
> -		dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
> +		if (dtp->dt_stmts[i]->dtsd_usdt != USDT_FLAG_IGNORE)
> +			dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
>  
>  	while (prid < dtp->dt_probe_id) {
>  		dt_bpf_probe_t pinfo;
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index a23052e4..2de7067f 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -151,6 +151,7 @@ typedef struct dtrace_stmtdesc {
>  	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
>  	int dtsd_clauseflags;			/* clause flags */
>  	int dtsd_index;				/* index in dtp->dt_stmts */
> +	int dtsd_usdt;				/* flags describing USDT use, see dt_prov_uprobe.c */
>  } dtrace_stmtdesc_t;
>  
>  /* dtsd clause flags */
