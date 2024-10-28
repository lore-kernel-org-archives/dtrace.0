Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D81DE3B4
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135678; cv=fail; b=qbla2hO8qmJxOL/AtWFWgKuZA9aVVIRdz2zd3/do6m2Cd/XSnmr8txIiPnvBBgchlD5ZfxxfyXr7bFz+s4ST6/fB0H4QeXGf7ueQBwi/gve234s7e5LNa7K74jKtULvT884oFs7a8oHdMChYusoXpjQgiLPqESk8k2v31+N+Aug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135678; c=relaxed/simple;
	bh=4TcaQXlX0fVT2KfBrxgAL5Cnkz5jV/sldrc5fP34xk4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Kd1hdLVibb0PKLwoWym9m8pWYtUhGjvWlExUcVZ90kGEjNBuse45fpmOxYuU+f3MaerbeE9nduredcC0S/fop88hJdMfyPX/FI/6nt8iaL84DbAKSElia6CnxLnhsb84n1nK76pOFQTb0JTEt7acKEDO3Ybxhe4Dd2mRfsXVyVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XY31Twhl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CIUR/lPr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XY31Twhl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CIUR/lPr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtfeI031633;
	Mon, 28 Oct 2024 17:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ynqeYHuu/ynVp8BLAI
	mTkXsyp5EEqqSKIr2znbdAlXA=; b=XY31Twhl6AtxokKVvRNB4Jy4K9mDcM1tWA
	Av5lYlbLR16T17VQQv3glLExPwxnQW3n8xqj8pzX3UrA/lFyR9AxAocuTXaWHb22
	I750SaQmCmrTwzR9Zx/rvSSv8rlp8U79ZK+3iwMfT38n48VFZQNgKHAtj3GygtkX
	Eu3HClF2Zg5Bze9KHJHMEpIR+zNURbGlOa4g+IYb2RIRkMIPzUzrRwafVW0tSjWi
	ReNquvxwNd1614TBpLOfw30K2abkqYkFzlnmTZmHC3SZ6oJdyXMPYXu1gcQWTX0C
	NTTdljpkIP9HTMkXu/Uoxb94tCMbWPy5n0skS+y+Pw2FoNmNHbYQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxkf5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 17:14:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SGNEu5034961;
	Mon, 28 Oct 2024 17:14:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd67sx0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 17:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAPmEe53NUjDOz+aClapKnb7EinYCnffFSmX0Xh/nncoIKd9tXLC3dg9EybIGzrIHW+fcJvhx07LApZIZcli1wPuYhgbQmWdtzYBg8+lEPXTgi29lfej1IRa2POozTJl0fCmnZ31+aXL3ordaTED2tUhu4VXOwkNbMBauQ7Z32oqZ9SCWjJScH7ADpjNCEv5L+iAMh/ivsIEjipkwoGWE19lAihunUmte2Sx8AVVV7tDM5Tp+VchDl5LduLrBecla/plm+sOgGFVoXIBzokdDXqL4kxfgnPm/XJGRwXi3J56wntOlsCig+c5EnC/vD8Pzj7Y98FFXeYKkAML0VuFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynqeYHuu/ynVp8BLAImTkXsyp5EEqqSKIr2znbdAlXA=;
 b=FspSRCHgx3wid3rAQvRmNwaMORfm/u3zT5PBd+fBwuqoX20+QEPFRRxjN3oSLx54KAW6MVcBf2Pnghna8WLKO9WVb9fw8jKTYAZujgCJlNL0opOY5ik5YhRvBZenYt8zu93chbVReUnKIXHF7wPh/zXTkD6wXqoE8361a5j5DbVNoG4PKjtFFj5hhm381UKbIsk4dGNpuIITiyGmIhx0l5GBIanGZsONe8AWW4GnCKmxHECUBrMT+JmYUGSrxbpmmYkZ5NFjmQOr2um641MJVSz5ikon/ExTtFTlE8cWIFmM/ih7j/CgNm66yRmUgGTOUvH+Jwfnvr7WSP6plB6/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynqeYHuu/ynVp8BLAImTkXsyp5EEqqSKIr2znbdAlXA=;
 b=CIUR/lPrWKz3z47MGRqGk0mS1rutx50XKpNwdJdtJkFpqC+qZlmDjhTQCM/h+R3B+9VNZ0ntEVcwawPECtMIns04DEwEtsAYdNDV18e/Ny5LujdSvbv5FYP41GMhGg/B3bCNUVYHFXec1nLr9B5OuVaRqQokBUpI+t25dkuCfK8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5883.namprd10.prod.outlook.com (2603:10b6:303:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 17:14:28 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 17:14:27 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 05/14] probe: get the size of the hash-lookup key right
References: <20241024113758.182050-1-nick.alcock@oracle.com>
	<20241024113758.182050-6-nick.alcock@oracle.com>
	<ZxsFFkZt2Gzgrspz@kvh-deb-bpf.us.oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Mon, 28 Oct 2024 17:14:24 +0000
In-Reply-To: <ZxsFFkZt2Gzgrspz@kvh-deb-bpf.us.oracle.com> (Kris Van Hees's
	message of "Thu, 24 Oct 2024 22:40:22 -0400")
Message-ID: <87plnkqhe7.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: ec17d9d5-1455-46ad-5794-08dcf773fa7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rQHnFqhV2AUZlDiJWOM8OFlORoxdWHcbOpnbAzuZ/KFBufLhJdzN5izHgeo8?=
 =?us-ascii?Q?BRU4en0zpC0N24xLQMveHnEIV+aT9B7mk3Z/TpnUKEh87rNdxSRsUAZnzr90?=
 =?us-ascii?Q?YCFhHAFezAqq0lcKw4RJ8AaMJAYpf8N9whaVAb+8u9L2xCwh2MW7JrW4WdSj?=
 =?us-ascii?Q?VsP4UcUFp2KgSMY8bgLKoO7M4+yU/l3lOk1L+9qKtpRMBgjk4H8dDTWsuUHI?=
 =?us-ascii?Q?WbLQ90Wtnh5pMTTAtU6jtlBXzUvCV7mxrEnF5ABEUO5qAD7IEbAmI32lATSr?=
 =?us-ascii?Q?1fojfH7K8IlD1I05N5atYsB0w4nULLviRzpzVwD6wx7QgBjuLMtnEdaS0OG+?=
 =?us-ascii?Q?p/O6rCizmeRUCe3+/iuWdjmxJ1XRE7ZzAKbPizVJ2xJvZQdM469KPAiAUE3d?=
 =?us-ascii?Q?a2nuCdUm6et8X+rpMU3x21ueFzE7nplqkUntRvaPezCRP8qrj4kDQWVbmNZP?=
 =?us-ascii?Q?/SW+TyHmYMHp+ECp929mV7ZO1d6XGtdxLsvRSHKN9Bj43f/705nqaR/jiF/v?=
 =?us-ascii?Q?zba0oGVP1RuOSa4VMtl+5lUMqfx75SjmZnjwVlSKnwRnGEnCyUCQ9JJJXpKP?=
 =?us-ascii?Q?flT95jHPVrML7hAOmDghdKbnAyilym2iLgFCcKqwvA5pAb5GUrE00jxsIiG8?=
 =?us-ascii?Q?d7+ydTD4mbcSa8cucT/grtZPEttuhJQdoIE8LljkvLi8+qeIUX1yWXF3m6rF?=
 =?us-ascii?Q?oiKIrrOSb0SAGidJYijjVqNd/HeMVat9FiEox08bCT6Ne4tppSnHjevTTAYY?=
 =?us-ascii?Q?jb5Nj6ugK+B0iDgNCuhIkqdijn2E/ADQ5toIAYF+ZIRWBxif+iPG0Dve9NAZ?=
 =?us-ascii?Q?jdRDPyursRt5YV85YDFMINjr4/rjLYfwP0ooTs5mrcsHIuKpEpmI5MdPHnLA?=
 =?us-ascii?Q?90WBgW2nO3gqM7Ukqy0Y4wiR7+pXgxyyLPoru8szvEOf1Ue1S9U3eS7zvIYw?=
 =?us-ascii?Q?e6Jq1Zes4BwfViaDSPjaK43G8hsNZGhI/gdBWn2+dd13QBpz4/5fgzRBBO5e?=
 =?us-ascii?Q?VPEYsCbBt4sXD9OJhdOoVaj94CEh+MCuK+ECPn0Bx1JwEzg/rwRcX8gvyuxQ?=
 =?us-ascii?Q?i8e2QS1Iq7RD0MG3ndNjpygianrR7NwHtAIJBcgGZGlCRQcDU9OFC6O1khSm?=
 =?us-ascii?Q?6amqlPLEhTUsE2iA/6IY2Z0YXbILnkoXWbZXQeh8q+md/0OQnCBEAEuQ4HKx?=
 =?us-ascii?Q?8nImqpNsEiBoU4oyLnKNPW+92zQyuNsCKIuXNNDpQjY9+rII9GZO7XJnfB+1?=
 =?us-ascii?Q?f2Z0b38rChNphaEvqEuE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E5gH4Cdzvb5JY/pTXK+ZQnL66DMitRSFqanX5z+IhONlmlTUkNiyqjFNlk7x?=
 =?us-ascii?Q?kzuH7tWsaZuZI0N9ZNnXqAULLwz0tj3T0oOTRt589+g5i+1OreNOCAL0cNgH?=
 =?us-ascii?Q?O7dlqdUb5Qu5B8rVLrm5TARSbVsFTJQuDZbluLC3ERsyFhasytTF7Hiz2rBh?=
 =?us-ascii?Q?Ucess7N8P9Q/CXUedn7orvgkhtXKRk1imR/wx/LWsRuQDOLgj4iZadcVF2X9?=
 =?us-ascii?Q?zt7nc0W4MQ2dcoURKRrxfxAMugVvMuBDNaEanQ8RDECzgCA+aGEeWrm2Hftx?=
 =?us-ascii?Q?P0TafzcvrHSeaFjzGIMro7+GNpVEYMD1NgS2IILkpiuR/B4ivfYKqcg0la0p?=
 =?us-ascii?Q?aIwUdz5IFe4q1eT4Q+X7RJWWnNycO0tdOPowdXaJZVMvXwV+1lOPRGCGugYe?=
 =?us-ascii?Q?Bx86lUX6dXsGq0IbXDaXic0Io6FPrko1sTOl4dBySWWOYV3tRyYYuimC10BL?=
 =?us-ascii?Q?qqPiKNnLX0hvjPTeW7KdEXCCcg8pRS9W3kpASUAi1nrvY20T06xSLpWVKond?=
 =?us-ascii?Q?umsSpKB0YXe98KVVrhCTyITyZjR0Q9K8xmnnyiWwh2ma5qpT5i3RQWNe7c1i?=
 =?us-ascii?Q?oOerWLiAvixlf4jpPuPwxfVJ4mPAW9C04EU8bEo8gF7KX72TVmWt4RgDDMA7?=
 =?us-ascii?Q?u5C9QdOt0EBt1vSnGInoT1EYBNyYWdXolmQWkcP3SjS7Drj1jVztzeJ4MvDB?=
 =?us-ascii?Q?MVomHUkygSRjcpNLtINgWedMMHZD7RQRUua5/Gr6Zf2IMjiroy4YTbmJavgH?=
 =?us-ascii?Q?0KP7EB5Z2K/uddgTXSOq7Ipz3jgwNIVSqskDsZTj5XY01aiL4lthrVXXLsE4?=
 =?us-ascii?Q?4SnCWg/sVzXeoHEP7Bjwi19HQYG6DtNHfCn3y+YyuHwRYTwPOtgNMlF05ZpC?=
 =?us-ascii?Q?XwRaUrxJPkxfyd0gLcnrppo/zHcodbdSq3CAdD22aY+7Y53p2Q3hzKFBWvPT?=
 =?us-ascii?Q?x+csp0aDCRbGdVovNqIKgCoYupj3VgNToMMCGnKCRc8Onhte41cUO8WkNsbR?=
 =?us-ascii?Q?zYdFXXMVNBBs2zMNr+TnHRr9UZz3r1NDtSMA4sK/CwjmbD6SRKaejMBjipT0?=
 =?us-ascii?Q?vczZUe8w9Zs/AgwgQUaoZoX6KCI+143y9zCIo7qc/XmAZQsekaLKilEug8wu?=
 =?us-ascii?Q?oevqhdTKbUR3uA6Kb97H2l7Vr5WE4Cu2QVnCUk3lH4PYSZ9qiSdWvd/ZckpN?=
 =?us-ascii?Q?/wd/TY1uFwCQC8ljC4FwBeCL51giMn5YlSqpIja/6h/BG23jnf+MVMjPVhfl?=
 =?us-ascii?Q?74hikhUDwSjwOi2Rg3Z60o9NkkFZl5Ei0e+4yYdcgqYiTah7+s4F/qDxuA2p?=
 =?us-ascii?Q?tioQhOY6mjjlWP6TjzKs175KfRVztFqYqPKpQzRMmlJYhMLYnrTzM7nVxAW/?=
 =?us-ascii?Q?cY2lwwC54N6qYhlUWLkKP99FsefP9jqKNbSGLHDj1DcogoSe9rBhGE4W7PsF?=
 =?us-ascii?Q?JOCfC3FRK5K11FOn97/ZUfN2weU62UPANMFUpiZxuRZltJ9FIq3N4HXzmbxe?=
 =?us-ascii?Q?vUysoqJK2Xwqc/MOA+tyY7SGauZPqxHtR/Qzvxs3p/O5iaXyrJKrWxuERrOb?=
 =?us-ascii?Q?4AbTCFbVHM66hJyDI4UWXsFacv2J69dL67zyfFWk11meSr1lKldIWi30Q/Q9?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oK1fkOOnxwzR9QT82E3jYajXgpqH3eeKWyZ6vZQIvk8eHeL3aJQD61sFMqfK2/8/b7qWWeCIsg3LGJx6C1KF4cEHQOGgRgG4KXZsBfxMx+od9XIvrh9H/qkEWF7HTjuS5Ij0goQnkFnYhoLaA8q+OgQ1ugxeudYgAk2Lp8/EQb64gljqBkrejyeRuHiLWi1yppMdI98nBuyYV6bVM0CmrgjHedxGwmQc2lxrRkiZijAllHkKskXMVynwFf54LUlsHGACMytMCIJNbiSvs6vWTrHRrz3gh5BQFQBZbEUWkdlby3yMMQx2Gkupm+kQcHSCCaPJBoBI/UaTEoUnt07QP5zoshd5lGSN8nLqQhHUd0z21ZaTvxpNq3UGE6LBPNLgyxtLqNXXW2F2sTfMOmKJB/zK36rOCZLOeY7VPTErZj4ktpPiRMb5qhvdd6RaDIChxhfv/SLCPczYLWxH9rxIr+otRu44zxdfhuO5BJjWPOzfLfGfib25VzB57bvLxQA0wzZSXh7wvqmWAl22XcCeNK1L72+vBmWMAQCBxxnbiKRFmKqcDXkOGlcC0aRt2/Zah3j7UUVmth+YhW+0D4Jk34Cpv2lmOLnpmRBZWB6q4Bo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec17d9d5-1455-46ad-5794-08dcf773fa7d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:14:27.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGZd5WeStEm9VjB7PZc/EsEITYdgl7bo0Y3nNj7/yfHnq/elYYWYRMpjUaJaut6xmcjCM6TYvkLzS5BXmojw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5883
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280137
X-Proofpoint-GUID: 7lkgbo8_2ftCVK4EZsy9i18yZaAV27um
X-Proofpoint-ORIG-GUID: 7lkgbo8_2ftCVK4EZsy9i18yZaAV27um

On 25 Oct 2024, Kris Van Hees stated:

> On Thu, Oct 24, 2024 at 12:37:49PM +0100, Nick Alcock wrote:
>> This was allocated with alloca() but then snprintf()ed with a size of
>> INT_MAX.  This makes _FORTIFY_SOURCE rightly unhappy.
>> 
>> Passing in the size we actually allocated is trivial.
>
> Except for the fact that dt_probe_keylen() and dt_probe_key() are only
> ever used from dt_probe_lookup2().  So, getting rid of those two functions
> and rewriting the call as shown below seems to be a much better fix.

Yeah. I assumed you wanted to keep the alloca() for some reason, but if
you don't (and it seems to be not incredibly helpful), then I agree.

>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> Bug: https://github.com/oracle/dtrace-utils/issues/78
>> ---
>>  libdtrace/dt_probe.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
>> index 686e2a661253..bb1773ee60d4 100644
>> --- a/libdtrace/dt_probe.c
>> +++ b/libdtrace/dt_probe.c
>> @@ -180,9 +180,9 @@ dt_probe_keylen(const dtrace_probedesc_t *pdp)
>>  }
>>  
>>  static char *
>> -dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
>> +dt_probe_key(const dtrace_probedesc_t *pdp, char *s, size_t len)
>>  {
>> -	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
>> +	snprintf(s, len, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
>>  	return s;
>>  }
>>  
>> @@ -204,7 +204,7 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>>  		return NULL; /* dt_errno is set for us */
>>  
>>  	keylen = dt_probe_keylen(&pd);
>> -	key = dt_probe_key(&pd, alloca(keylen));
>> +	key = dt_probe_key(&pd, alloca(keylen), keylen);
>
> Better would be:
> 	if (asprintf(&key, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb) == -1) {
> 		dt_set_errno(dtp, errno);
> 		return NULL;
> 	}

Went from that into a minor can of worms: the entire function is rusted
kernel-dtrace-era stuff, from a header comment that talks about caching
and interrogation of the kernel that the function never does, through a
probedesc that is always leaked, errno checks that succeed only randomly
(checking errno but no longer doing so after a function that can set
errno on failure, so basically random) which leads to the wrong error
return almost all the time... ... I think my latest version fixes all
those problems (more description in its commit comment, forthcoming).

Any problems in this one will likely be uncovered by the pre-release
valgrind run! but I'll do a full make check before mailing the series
out again anyway.

-- 
NULL && (void)
