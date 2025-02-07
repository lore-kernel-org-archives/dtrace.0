Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DF1A5BAD
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959763; cv=fail; b=NACif4NcYjEHkHiV0JLuVxfdCIfthxBcprqXIy2yMLXgDd+mH0u4lx2BR8pjLbeeaMmpTO4nRivNGRSEB2HOuPGoJLpgNboBL5Q8PniFURQDDSx90mfeL+oo3PiM/J/0e+e6Hx56kqmqFKYZm7ZtMRO3JMLHAqk2lCekXwR4xEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959763; c=relaxed/simple;
	bh=HPvLklJKayzUg5HThMZO998dZ9dcDj/6Ibj10mmbFBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aA5w2eDaWn4to9mo61j4LuRLxf3WnnaptZivbfPbiqowTT80cS0AkPpVlVqgm2eoYsi6+SW84sWnkDuddpwd1MBlMLVqArUeAcdsIVk0ZfTMZyU6T98w61+ofDwQSW/LbMAdDVLVXlXqEx2TFKFjEfM5SIwGTEasAuzCMU2d9eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oLdd2H3a; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TZW4hDA7 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oLdd2H3a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TZW4hDA7"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517KIBbf023734
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 20:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5lMnqkTADKhaGopkIUzVfZavxyFMIGJTSQBeWUce3UU=; b=
	oLdd2H3arupA2lCk/ui77BPpoQC6UDkADwSDZaYZrox7G77jfvOw/MJ9+UplQmIw
	KZ20WUJ03U2vzcSYkbD6qq0+zycaY9fudw2Go+0sQnRFbGZQLcLIDr3m8UDOADN0
	tKu66nd78CnsGnPmsvBfckK/O4KnltfuBXULTXHRZSb9KZdsUkBDZiGV4bsdPB8y
	gdTU+VZNsz0X0ApWrqE7NBxeXcjdbolbfAclWW/aWKYCfzE1hvPNCfug4Jfiixs3
	QAeY1kSPyO+azl+ByY5iwt3bUGggqqzTAk8FECADm6GE90y0m6p6UMHviuIGdSyV
	maE77IZEwQrdQv5I8tR7fQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cnhrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 20:22:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517JOw1D023499
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 20:22:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gnjjqt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 20:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljx5sQNvK0U1KkcYYe9aMJW05kytxtpaow0/PjWt+pYG2MolOiLr08iq88N45RN2i1JZKmraxb+eSFjhwVwcGkZZ8htNL96leSpMFGKGQtXcmLbUjAxH1FpPDtHRkbG9qqzBU/3utc14L6LzeErEBmDmb3VPjLW8TgAB9bHmXU+OY3OkfLYDgexGcgj8w5OBI0emgZaRybLRmoX1ieLxfuh6LiPL5C80h8Lu1ftjTXjmtW6qBu7SHSAv0ps5K6rmmpoCLp2+GR4+Sw3o0LswvY0x9hjSct6ckwtP3mNr17/JdRtnWr/WtRSm3D8Uv3eF5zwJf5Bdz4C9Emyf3O2sbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25yFJcASEBcSqFAKVfDOkbqGI6ocwJSI1GRd2kyHPYA=;
 b=NVTzGGaSB/VjUxQaq+RJx6pHTDG3vCtYdm+iO73T/IorJ381EW8MGVIRTnO5GFZgohpCt59Cxm4sKM9IquVVZm4koWPQg3cpcHguCaOh+kMmTYQhoy0NqTfkYMnz46FnA7EXzj+AN+MIawXS90ePSmmsf+sJVp9gc5vXRbONstk1dpwXv3qVxu2/OM34D+sqoitNK0IJFeAcHmB/LlfPd2IvPaUuRT85ubaHVWtX9E1EPPNqiHguqady9qWNykT3qNswW/IjUfdWWSd1yW8FZYNh50t7c5uF3jzo3r9apMIcciORtPKvJGBtMM7sjpVIxL8//L2Nc1gluG00NizKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25yFJcASEBcSqFAKVfDOkbqGI6ocwJSI1GRd2kyHPYA=;
 b=TZW4hDA71EhT4z1t4v2KPGS9UOCaKjZHCF0tP9m9dlO9r5He9VL4bqKVtzOcGhAqMj0ynP8/PSyERCIVShODrtXWoGmRV5S7Yf8j4zHMe7DSCqO256jqCJCVCgvM1Gi7XZCZe5AbuLCHwSsvwgRhpKCVbYCJOcQh4TiTtwJK3r0=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 20:22:35 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%7]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 20:22:35 +0000
Date: Fri, 7 Feb 2025 15:22:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] cg: ensure string results in a ternary are padded to
 strsize
Message-ID: <Z6ZriBgNqjXqOm9Y@oracle.com>
References: <6c5f5a2593039303a8f1f46fccb7a198.kris.van.hees@oracle.com>
 <495b1606-caba-9b59-68a0-0587d0ddf094@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <495b1606-caba-9b59-68a0-0587d0ddf094@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b697a30-fb1a-4c6f-d50f-08dd47b5286b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fbj2lTr8OMfntq6vNXQBDI22Sxs25YDPTvvlcaDIAHl1gbb85QYNsi1uw1?=
 =?iso-8859-1?Q?bRPLDKIcjxxtqFDPmb4VBFfCMbz/K31AwSCqjqHvdso+aXHzc8Ltgw8e5r?=
 =?iso-8859-1?Q?T38rOY1Kcz8XjslGJsGDmidoYeleLEtqMB4DwtOR04iVVGeKmF91eBj5i3?=
 =?iso-8859-1?Q?q64DrhaemhZbsovykELH0jm0j9yrewkojGKy6dN38vrlZRg2EAdi8Zt59/?=
 =?iso-8859-1?Q?zvIKcA4QaB5zVGAXX8bbQk96e+Y+9szKl4UlW0gSQAt7siIfSs7Q01v4+A?=
 =?iso-8859-1?Q?eSiz//e4to5ubpXhxHr0LEGBb5QeoAaWB7YxaBmVFeTHVemqWyFA4dRoKS?=
 =?iso-8859-1?Q?Q/3vgYVlX5+aeKG/iLTWwCYHIDhquSaOhaQRNuUddjk91pcChoKf3FqY0Q?=
 =?iso-8859-1?Q?Z4/dAgYuE2NeuIJcGNis5SY/0Zyez4LSet+TdKiET7jKFmMHnZh2tEjTlB?=
 =?iso-8859-1?Q?IKsG/fdGOiDVUOX+v1GOFuP/PCG2jWD3DLugO4FuQE2XfCR4QWb5bu66w7?=
 =?iso-8859-1?Q?q/a3XugLnSr6zwD+shNXv2c+E/7QiEg3MQLDjjJLGTVE9JVMboP59BXE8c?=
 =?iso-8859-1?Q?Ny3dl9fjp3PhfPEBwzs5eH/De7n2iExFlsveI2HP5A7+D8wSpHelHrjSKE?=
 =?iso-8859-1?Q?5Yv8F4QN99CtJhHIb+dfa7JlJVxzxc5R7ucZGDGqhBIJGC9Z9B/zIUt8dO?=
 =?iso-8859-1?Q?EVX4CKPEY16+lAPWH/4wF9XEiwabhoxW5hTUX111djlOG2WpRUBPz5fcS/?=
 =?iso-8859-1?Q?1DvMTWX5pxtvsOnLzodGVYb7zzlUWudU3eGAHJ9M+vUt5/vdCw/Jm7BBad?=
 =?iso-8859-1?Q?N72fyPWa8n5A70tSzmN73Xsof2nzqgTWxmKrT5RGkIQPdG6EMNB75/m+yO?=
 =?iso-8859-1?Q?hzsEqqmBOyyJreK5TfZ9Iylg/q8ZNyd1dWXUhoI0bT2o/0N7Hp4U30VbIE?=
 =?iso-8859-1?Q?mhXqFiyDHi/w1jEqRBtVoZ9PHR+6zV1D20/1tgNHWHNWqX8JhYYWafu0Gh?=
 =?iso-8859-1?Q?Lh3DF+9LQeDPrQq52BCygCizmbnd+ciPyn1gs3JlrTZJ/ys4Si3UEXEoZe?=
 =?iso-8859-1?Q?Fz4MSRZDZ4PRCIIXO9g2CgYm2nCog6MLGF+QJP/yp0XBE21XaUV8GQvb9P?=
 =?iso-8859-1?Q?49n0dPoRbVEaYhnwBduRf2A0FiZwowzGF8CP8You5ZYzFnvFwRPV2/G07T?=
 =?iso-8859-1?Q?gXcgPedv1wJOC8Y1vP+1FZjmdrBOnAevOnHONh3jvWDgf9r7P0LT7z3PZj?=
 =?iso-8859-1?Q?bTV4oSbE2PJlCGHjzjMRw0zraea5LmKy+qc1iqx8DOQ3LbvBehLVoIy3uv?=
 =?iso-8859-1?Q?aYCWm9PZSoAmQfPwy9TlLDHATiBH7RE/cIVGMZpc80Mvb6MFNO4yOXh1eq?=
 =?iso-8859-1?Q?uvWn4FvrQMKf+eS0mA02SxNJeOQxO+74Pq1o2dPBSXNMqeAdu8nJlIUjjL?=
 =?iso-8859-1?Q?TDs5P04sdtIhQr2x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?89nJ0acgSvfHPFJ6Dpg0XaXIktu6iMd12mayjZzJX4JWEW5wQNs4vINKLJ?=
 =?iso-8859-1?Q?gCxJGS/BsIi9WIxNH8RAwOXQZ0ShAQ6QTUv61llntIBi067K36850DX42n?=
 =?iso-8859-1?Q?Pe65HftVeA+yh4Bd24bUAoKH9K9rXfWHjJC99zlnitGOzLMdirWVsanQV7?=
 =?iso-8859-1?Q?aPAeOAhYh1S9NMfk3Yj5lwTP1WIwP5Hjc40tFwlBm91REzsMOvdfZ+0H5x?=
 =?iso-8859-1?Q?rvcytwnmXZesm1yuAa2ar6SGLIwyJOhKfwJDHG9vTjA7OTOq1M0nRgNTfK?=
 =?iso-8859-1?Q?z/ATybZf+WdnNMVm0ftWyiy4ulIn2R7aYkCvGX2pRorriNokX1jQ/fVnfZ?=
 =?iso-8859-1?Q?BGwJNI4BhDt0Aj2XdTumUuJBDfcYXZWWXK/hPNhTIb3K6AbQAtBCvO3qbD?=
 =?iso-8859-1?Q?2j83OagLn2vZH76hn9wG045quD9do1bpJW3QtQznnebqQcQ5bXnmLuDaJ8?=
 =?iso-8859-1?Q?M6jywiazdPdkZ164xEZr4P5Z3QjJf7QhgA5T+X5DB5TPQv+eRXk7annsYX?=
 =?iso-8859-1?Q?5EU3FC3f073jT/P2odrR4+Csmmi8JKnP1LVQY6gYwwOZoiDrruERj3qG8H?=
 =?iso-8859-1?Q?j8euKruX/YyuVw/o/5sKLJAzmm+rRRdNiZ144G4JXsXr4i51N42IbrMuiC?=
 =?iso-8859-1?Q?eOv2SZRKLVfe8XtioYfpUDmSiMY6nz2sA3xuanztoq3UToxOKlPOUun4ot?=
 =?iso-8859-1?Q?+AH04xfCI+DSNsVQZc4JGInspmPH4TvgU1P41bEJtmGE3/C9nNyTreeSjU?=
 =?iso-8859-1?Q?V7VczVJiU3LbrpCRbXWB/TDzdhGAxyiOXeQi5usGxJMWTAAQ2OcTloUDwR?=
 =?iso-8859-1?Q?j0pB5AM466GBhae6h4mNDik4oJALlWDY+bALrm3rDvdQEhOX/b/Tderhc7?=
 =?iso-8859-1?Q?jUn3CggnA8QHQLFXmOkVHMMFotOJI6ikCrtI/vep956DAuuTQx1psKJzsD?=
 =?iso-8859-1?Q?hREuvpBe/l96uNX0zLUIxxWt4wy9uBH/Mv5wzNK6KTZ6o5xIOjYs/kLQU2?=
 =?iso-8859-1?Q?q+RCKj/8YjE1g0u3MzTDd1QomtkR3st9lVXGvuL76GL6w1k4PM1tPLY74A?=
 =?iso-8859-1?Q?sxYGmZguGFL1vvoisJnO0XDD5KWc02tID6JVwOnR6cJY0q5oODom6T4SP/?=
 =?iso-8859-1?Q?C30bXAOwn/B2e7J/E8ZO9PsKG3cQ0iTAhnnwjHyBvcNC7hfpxj9RaLY94R?=
 =?iso-8859-1?Q?XQv//0IrFw8mAMnSPZQT562koxFHiEFsOEKcqhycYcTxJIaJ5WHhVRj6vw?=
 =?iso-8859-1?Q?zVobpBp1//n7LjJsOb5F3rh3qEh5VYE82JiXZpRVv8HMS/r6eshgV6TWMm?=
 =?iso-8859-1?Q?HRJsG2pkzw7Q3luCqqYpG8hHda9oZK0TVYoKCjkOGtuvoILTcO+djMboFA?=
 =?iso-8859-1?Q?+sTpMt9bHY+TStPtU2SEnBRLWqgjo4woe3+TwI3IkhoRf3sil0hRjUiaDG?=
 =?iso-8859-1?Q?qlrmbnXO+ZA3U4sCXA01pXkALjRpWVfq33MTWBygE3uV7L0YNlS6rdSy+M?=
 =?iso-8859-1?Q?E3Drq6pVsieYsL/SodaOMon+irpR4YaoVVC/nSzFQuAVYSoZVuBZJEA1x2?=
 =?iso-8859-1?Q?/4x8Lk6GQ51DRRN3KcXKgJe2zOH7Vp0eNpV7RymATETDTGfxsfQQB6+8LL?=
 =?iso-8859-1?Q?WsEUFmmDJeFHukQXDtvukzLhNfeLwm3gRb+fKev1b7c936mgN91jetkw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7qK2yQ0l6bqAchX67ZhKaK9O4FmQ0rYL707ZBSgm+A/BV+W2uSgjR7u3EdJnWgSc9c9g+fyZAXust8yA2VXaJdDzUfx3IT4wW7YvdwcEdjbWhMj5Hfjavxn3QLHQM9OotIj0IxT9S28jd95p5NQnCqikV4w2/Vbujk3bJoBf7aDb5CXUjtSA/qUcI3gn8Qqd3JlNllPgHD+JvUekyAy4RP0cs2ie/pcHjgXw3FB9L5FzGoe80COvgO/ZnZ+ERsrzvgGqq5TbPNelTzkohyJImoZ1s+EEMl0Fyrc71rHsNw/m7zMuNSay/TU3TwB89ouCto1Pg8he1mI/pKmQj22y6+hQwZpCNorEcjryrvGU/FFjBPHOag/FQ828o8+jhWE1S/FrjV+oLoI9JnMsGm/uJYQ4ZJ3kF1IHpSHDJ77/7giG0MmwZ8Eqa94o5IO5J40C6EtclABXd55g7C1DRqpodyWsHxyVrHrDlMpe+VXkK9mv7sxv8RL2MMrP4sibA4dz7F6EozemTITHwFsZqrOw8NtdIONkDIGYdOlvGPCFi7ahjqWyQjvgIN8Lv5SvKkq5DJIobsfrKWsMECPAbgh9+CHcXFqt4JfgjZmLTEwifM4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b697a30-fb1a-4c6f-d50f-08dd47b5286b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:22:35.1028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G24iG8vjKWpExxBKuLd5h+pjRpl0bnFQtcpqf7+VARt3T7AN1JC/k2ue6HrSGDWha/SPyJuBY32RC5fMVtz8ty8wCzvvBlKgZZl4YNJY5LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070152
X-Proofpoint-ORIG-GUID: 52ohahlcIDtDq3LylrXNBFVjeKcAGLkI
X-Proofpoint-GUID: 52ohahlcIDtDq3LylrXNBFVjeKcAGLkI

On Fri, Feb 07, 2025 at 02:17:44PM -0500, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> That said:
> 
> *)  Is it possible to construct a test?

The execargs patch provides a test for this.  The situation here is quite
unusual because we end up assigning a DTrace string to a char array, which
is an operation that you generally cannot do in D.

> *)  Has there been an audit to ferret out other instances of this problem? 
> Also, I'm confused what position we're taking here. We're saying that it's
> possible for a string (which in D has strsize) to have garbage after the NUL
> byte, but we'll deal with this situation only in the case that it's an
> argument of a ternary operation?  Why do we not say instead that a strsize
> string will not have garbage after the NUL byte, so that a strsize copy of a
> string will be safe (regardless of whether it's a ternary op)?

I am not sure what you mean with 'taking a position'.  This is a fix for a
real problem, that is unusual (see above) yet occurs and results in trace()
output to be wrong.  It may be possible that there are other cases where a
similar problem may occur, but well, none have popped up as far as I know
(partly witnessed that this is the first time it is noticed AFAIK and that
is the reason I am fixing it).

> *)  What position are we taking here on BPF register pressure? E.g., what if
> dst were %r0 (okay, let's hope not) or even just %r1-%r5 (even just %r4 or
> %r5)?  One position is that we don't do a robust job of BPF reg management
> anyhow and someday we're going to have to clean that up and so being sloppy
> now is okay or even necessary.  Another position is that we can add a little
> code to improve things (even if other areas of dt_cg.c vary considerably in
> quality).  E.g., one can fill-spill regs between the two function calls,
> costing extra BPF instructions only if needed. (That's already a pretty
> common practice in dt_cg.c.)  For extra robustness (beyond what we currently
> do in dt_cg.c), one can move %r1=dst and %r3=src in whatever order makes
> sense (more complicated and less likely to be useful).  Anyhow, fill-spill
> regs between function calls is a pretty common practice in dt_cg.c and I
> would think would make to do here.

I'll look closer at the register use here but I don't think there is a
problem actually.  dt_cg_strcpy() is not meant to be a general use function
at this point (perhaps some day it will be).  I can also move this into
the dt_op_ternary() funnction, but I felt that mighht make it at bit too
complex.

> On 2/7/25 01:11, Kris Van Hees wrote:
> > The result of a string ternary was copied from either left or right
> > value using a memcpy() of strsize, but that could result in garbage
> > being included in the result beyond the terminating 0-byte of the
> > string value.  If the result was e.g. assigned to a char-array
> > translator member, that garbage could affect consumer output.
> > 
> > The ternary will now copy the string using dt_cg_strcpy() which ensures
> > that any string < strsize will be padded with 0-bytes up to strsize.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_cg.c | 68 ++++++++++++++++++++++++++++++++++++-----------
> >   1 file changed, 52 insertions(+), 16 deletions(-)
> > 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index a5c9aa09..b48e27f0 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -1371,6 +1371,19 @@ dt_cg_fill_gap(dt_pcb_t *pcb, int gap)
> >   		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, off, 0));
> >   }
> > +/*
> > + * Store a pointer to the 'memory block of zeros' in reg.
> > + */
> > +static void
> > +dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> > +{
> > +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > +	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> > +
> > +	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> > +	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> > +}
> > +
> >   static void
> >   dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
> >   {
> > @@ -1394,6 +1407,43 @@ dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
> >   	dt_regset_free(drp, BPF_REG_0);
> >   }
> > +/*
> > + * Copy a string from the pointer stored in the src register to the pointer
> > + * stored in the dst register.  At most strsize characters will be copied, and
> > + * if the source string is less than strsize characters, the remainder will be
> > + * filled with 0s.
> > + */
> > +static void
> > +dt_cg_strcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src)
> > +{
> > +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > +	uint_t		lbl_ok = dt_irlist_label(dlp);
> > +	size_t		size = dtp->dt_options[DTRACEOPT_STRSIZE];
> > +
> > +	if (dt_regset_xalloc_args(drp) == -1)
> > +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> > +
> > +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> > +	emit(dlp,  BPF_MOV_REG(BPF_REG_3, src));
> > +	dt_regset_xalloc(drp, BPF_REG_0);
> > +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel_str]));
> > +
> > +	emit(dlp,  BPF_BRANCH_IMM(BPF_JSGE, BPF_REG_0, 0, lbl_ok));
> > +	dt_cg_probe_error(yypcb, DTRACEFLT_BADADDR, DT_ISREG, src);
> > +
> > +	emitl(dlp, lbl_ok,
> > +		   BPF_NOP());
> > +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> > +	emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> > +	emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
> > +	dt_cg_zerosptr(BPF_REG_3, dlp, drp);
> > +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> > +	dt_regset_free(drp, BPF_REG_0);
> > +	dt_regset_free_args(drp);
> > +}
> > +
> >   static void
> >   dt_cg_spill_store(int reg)
> >   {
> > @@ -3040,19 +3090,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	dt_regset_free(drp, treg);
> >   }
> > -/*
> > - * Store a pointer to the 'memory block of zeros' in reg.
> > - */
> > -static void
> > -dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> > -{
> > -	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > -	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> > -
> > -	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> > -	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> > -}
> > -
> >   /*
> >    * Generate code to promote signed scalars (size < 64 bits) to native register
> >    * size (64 bits).
> > @@ -4603,7 +4640,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	 * dn_right).
> >   	 */
> >   	if (dt_node_is_string(dnp)) {
> > -		uint_t lbl_null = dt_irlist_label(dlp);
> > +		uint_t	lbl_null = dt_irlist_label(dlp);
> >   		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_null));
> > @@ -4619,8 +4656,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   		dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
> >   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, dnp->dn_tstring->dn_value));
> > -		dt_cg_memcpy(dlp, drp, dnp->dn_reg, BPF_REG_0,
> > -			     yypcb->pcb_hdl->dt_options[DTRACEOPT_STRSIZE]);
> > +		dt_cg_strcpy(dlp, drp, dnp->dn_reg, BPF_REG_0);
> >   		emitl(dlp, lbl_null,
> >   			   BPF_NOP());
