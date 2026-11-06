Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970410;
	b=4bwvHtFkFleekNlH5/ngztZP7ntypYSQ0Yp50Sd7+viG3WXaUO7jEi3wbaXchRPrgDG/
	 BhT6o8XzKVGebcyGKGwQ2M2qo/qNPvVrQJ1ZcKHHGS7+iDWzk+GnGVzjoW2589i2ZVtdw
	 JJf+mV7aKE7lQ22850WBQwUYfi9azRsSivlBVPg3EdnS8c7qVMPGdb7G33lrmIEkSaZaI
	 O+hozoCRahDQyaP8Hwz7sX/70pk7x8cR3JpV2YvKlfURAlhVn9KZssxohSLiTkgwWGBHY
	 vbssxzwTkVrUdR2mlOMj73wsUpl6muVv8k10bDa8/I2Tb1jRGcY7cglZ6wv6LjZAhiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970410;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=p8P/EDVh8Uf0mIiRMlB2Yu8X3FTfat6wbEBbwGO1gxY=;
	b=i/uiyP/HOEB/WZhEoAFpqktBzZCzEYKGUPfqcukpzTvNK2fLNGcoh579TK8TVvL6BzFR
	 Fal1QMM0T4YM/nfYonjt9bBUppgOLuo5TStjTAYWmgQLMAWhy9xtAIfLb54+ifM3EvMGX
	 Go5ao3iocrFJCPYdUhBBcDaUPXD+xWIY0xeILdqGrul7pX9FTqz/L5eKc/C5l47s+dA4S
	 q9mwv9x/Md7xSqb2fzxV2Qued3308Co8ZXXKw7+Uvz70GZq6ADIM9aWJi5KGTtWh6syKh
	 4TjpiTv4Pq2iX1I0LZr5QplijPJI55/sW8lJvA2K0nXfrvvlSYVaUHWM51x784CMS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA04606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA04606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6D6kg1015005
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:06:46 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 12/20] libdtrace: index module address ranges across the
 handle
In-Reply-To: <c0532405682a4907cacc1737efd195a5@oracle.com>
References: <c0532405682a4907cacc1737efd195a5@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Fri, 06 Nov 2026 13:06:46 +0000
Message-ID: <871p8yt8gp.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-DCC--Metrics: loom 1102; Body=3 Fuz1=3 Fuz2=3

On 30 Oct 2026, Kris Van Hees outgrape:

> Build a sorted address-range index lazily and use prefix maxima to bound
> searches across overlapping ranges. Retain module-list order when more
> than one module covers an address. Fall back to the existing search if
> index allocation fails.
>
> Invalidate the index when symbols are added, a module is removed, or the
> module list is reordered. Updates that discover nothing retain the index.
>
> Expand discovery coverage for indexed text/data lookup, range boundaries,
> gaps, overlaps, additive discovery, geometric range growth, and malformed
> symbol input.

Nice!

A few niggles below.

> ---
>  libdtrace/dt_impl.h              |  10 +++
>  libdtrace/dt_module.c            | 143 +++++++++++++++++++++++++++----
>  libdtrace/dt_open.c              |   1 +
>  test/triggers/module-discovery.c |  78 +++++++++++++++++
>  4 files changed, 216 insertions(+), 16 deletions(-)
>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 5487bfcf..c83fedb2 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -188,6 +188,13 @@ typedef struct dt_module {
>  	uint_t dm_aslen;	/* number of entries in dm_asmap */
>  } dt_module_t;
>  
> +/* Handle-wide address index.  order preserves module-list precedence. */

Maybe you should describe what max_last does here, since it's the tricky
bit.

> +typedef struct dt_module_range {
> +	GElf_Addr start, last, max_last;
> +	dt_module_t *module;
> +	size_t order;
> +} dt_module_range_t;
> +
>  /*
>   * The path to an actual kernel module residing on the disk.  Used only for
>   * initialization of the corresponding dt_module, since modprobe -l is
> @@ -308,6 +315,9 @@ struct dtrace_hdl {
>  	uint64_t dt_maxframes;	/* system limit on stack traces */
>  	dt_tstring_t *dt_tstrings; /* temporary string slots */
>  	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
> +	dt_module_range_t *dt_modranges; /* sorted module address ranges */
> +	size_t dt_modranges_count;
> +	int dt_modranges_valid;
>  	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
>  	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
>  	int dt_ctfa_missing;	/* cached ENOENT/ENOTDIR for the archive */
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index f381bdcd..9d93b9d8 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -239,9 +239,19 @@ dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
>  
>  DEFINE_HE_STD_LINK_FUNCS(dt_module, dt_module_t, dm_he)
>  
> +static void
> +dt_module_ranges_invalidate(dtrace_hdl_t *dtp)
> +{
> +	free(dtp->dt_modranges);
> +	dtp->dt_modranges = NULL;
> +	dtp->dt_modranges_count = 0;
> +	dtp->dt_modranges_valid = 0;
> +}
> +
>  static void *
>  dt_module_del_mod(dt_module_t *head, dt_module_t *dmp)
>  {
> +	dt_module_ranges_invalidate(dmp->dm_dtp);
>  	head = dt_module_del(head, dmp);
>  	dt_list_delete(&dmp->dm_dtp->dt_modlist, dmp);
>  
> @@ -1724,6 +1734,9 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
>  	dtrace_addr_range_t	*range = NULL;
>  	int			skip = 0;
>  
> +	if (dtp->dt_modranges_valid)
> +		dt_module_ranges_invalidate(dtp);
> +
>  	/*
>  	 * Add the symbol to the module's kernel symbol table.
>  	 *
> @@ -2171,6 +2184,7 @@ dt_module_shuffle_to_start(dtrace_hdl_t *dtp, const char *name)
>  
>  	dt_list_delete(&dtp->dt_modlist, dmp);
>  	dt_list_prepend(&dtp->dt_modlist, dmp);
> +	dt_module_ranges_invalidate(dtp);
>  }
>  
>  static dt_module_t *
> @@ -2338,6 +2352,118 @@ dtrace_lookup_by_name(dtrace_hdl_t *dtp, const char *object, const char *name,
>  	return dt_set_errno(dtp, EDT_NOSYM);
>  }
>  
> +static int
> +dt_module_range_cmp(const void *a, const void *b)
> +{
> +	const dt_module_range_t *p = a, *q = b;
> +
> +	return p->start < q->start ? -1 : p->start > q->start;
> +}
> +
> +/* Build lazily: handles that never symbolize addresses need no index. */
> +static int
> +dt_module_ranges_build(dtrace_hdl_t *dtp)
> +{
> +	dt_module_t *dmp;
> +	dt_module_range_t *index;
> +	size_t total = 0, n = 0, order = 0, i;
> +	GElf_Addr max_last = 0;
> +
> +	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> +	     dmp = dt_list_next(dmp)) {
> +		if (dmp->dm_text_addrs_size > SIZE_MAX - total)
> +			return -1;
> +		total += dmp->dm_text_addrs_size;
> +		if (dmp->dm_data_addrs_size > SIZE_MAX - total)
> +			return -1;
> +		total += dmp->dm_data_addrs_size;
> +	}
> +	if (total > SIZE_MAX / sizeof(*index))
> +		return -1;
> +	index = total ? malloc(total * sizeof(*index)) : NULL;
> +	if (total && index == NULL)
> +		return -1;
> +
> +	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> +	     dmp = dt_list_next(dmp), order++) {
> +		int text;
> +
> +		for (text = 0; text < 2; text++) {
> +			dtrace_addr_range_t *ranges = text ? dmp->dm_text_addrs :
> +							   dmp->dm_data_addrs;
> +			size_t size = text ? dmp->dm_text_addrs_size :
> +					    dmp->dm_data_addrs_size;
> +
> +			for (i = 0; i < size; i++) {
> +				GElf_Addr start = ranges[i].dar_va;
> +				GElf_Addr len = ranges[i].dar_size;
> +
> +				if (len == 0)
> +					continue;
> +				index[n].start = start;
> +				index[n].last = len - 1 > UINT64_MAX - start ?
> +						UINT64_MAX : start + len - 1;
> +				index[n].module = dmp;
> +				index[n++].order = order;
> +			}
> +		}
> +	}
> +	if (n)
> +		qsort(index, n, sizeof(*index), dt_module_range_cmp);
> +	for (i = 0; i < n; i++) {
> +		if (index[i].last > max_last)
> +			max_last = index[i].last;
> +		index[i].max_last = max_last;
> +	}
> +	dtp->dt_modranges = index;
> +	dtp->dt_modranges_count = n;
> +	dtp->dt_modranges_valid = 1;
> +	return 0;
> +}
> +
> +static dt_module_t *
> +dt_module_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr)
> +{
> +	dt_module_range_t *index;
> +	dt_module_t *dmp = NULL;
> +	size_t lo = 0, hi, best = SIZE_MAX;
> +
> +	if (!dtp->dt_modranges_valid && dt_module_ranges_build(dtp) != 0) {
> +		/* An optional index must not make a lookup fail under memory pressure. */

(this is basically what we used to do, so the fact that it's almost
untestable is presumably OK... and you can test it locally by making
dt_module_ranges_build always fail, and presumably you did.)

> +		for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> +		     dmp = dt_list_next(dmp)) {
> +			if (bsearch(&addr, dmp->dm_text_addrs, dmp->dm_text_addrs_size,
> +				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp) ||
> +			    bsearch(&addr, dmp->dm_data_addrs, dmp->dm_data_addrs_size,
> +				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp))
> +				return dmp;
> +		}
> +		return NULL;
> +	}
> +	index = dtp->dt_modranges;
> +	hi = dtp->dt_modranges_count;
> +	while (lo < hi) {
> +		size_t mid = lo + (hi - lo) / 2;
> +
> +		if (index[mid].start <= addr)
> +			lo = mid + 1;
> +		else
> +			hi = mid;
> +	}
> +	/* Prefix maxima bound the backwards search, including overlapping ranges. */
> +	while (lo && index[lo - 1].max_last >= addr) {
> +		dt_module_range_t *r = &index[--lo];
> +
> +		if (r->last >= addr && r->order < best) {
> +			dmp = r->module;
> +			best = r->order;
> +			if (best == 0)
> +				break;
> +		}

So we prefer the first module loaded which contains the address in
question. Seems right.

I do wonder if you could do *this* with bsearch, though -- I mean this
is basically reimplementing bsearch, and we already have that. I guess
the problem is that 'best' crosses keys, and has to be consulted in
order within a given run of identical 'lo', and bsearch can't do that...

-- 
NULL && (void)
