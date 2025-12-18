Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A83A1E66
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089241; cv=fail; b=FSQSWDINCD1TBOvur9vHWXbLkkaT2BuhgZkbyQX39zMKOC37k4EBppyJpat5Fx1oS8li50ahiKhGq1JJ+ArrV4EVCyUkDNfJHOzxxxmbljXjU145x2YTkylR9NlZjvz4YQIGoaERBfi2GpJDLnKfCr5X9ebpPjWtHLwLt0iQHss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089241; c=relaxed/simple;
	bh=k+GuutKuRA8AWp7qsr4NjD689FoCqL7Hg9FWqIqqZoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fJaRCdXn/wHDsXu/Tnl6zp9uirVxf9oHW7tROcY+brbloVsveWn3yLz60825q5Rn0eIm/3Yk6PPEI9ig+K0GY7c9SABv9qeZiSAWHmhiHE5gB/eFiCU5pGcEz/Se7KAVV0f1bBIpg7zV8vvVRiZ4NzlfItQ8nWvtsHdACyGziFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g3k2HdPm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z4kjG8FI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g3k2HdPm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z4kjG8FI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkReK1605301
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IYnDejcu95EGE3a2vg
	Ep0fbhvHq0rsUGCiId24jk1A4=; b=g3k2HdPmARJAdvfxNXYAPSG2Y4VhjMajgB
	77CKPLDpRbl0rrdzIapvidUjHcdO9/KjBaTkBkgLxiE2/dG2olKbnqKOZh86TP25
	GgcaFvEQWvAGP5np7U6kt+X6TGuJ5ktajGNmLLKH9TztiRJcTx6i1nadn4cw3KPG
	C9++3/cfBYtuSsorb8+Es4r1IxoxN4jGRku69K6qzzkkEX46VtEOJFrrgYH55GQz
	Tv4Dj943t586VBOY4c+XVbDwHhVjfx3vRELz/oHe4elKEs4vpwSvKzFYMFpd9xK2
	CUzjGv7IdRA/w+NUEdz2+hw20KTH0VTLlSCwVkb1XWHtnIhZIBiA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2cg1vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJT2Nt035195
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:37 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtchwgd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECKCoGcixVLESlf48TQw8BZcvnIz63Tn8tYgeoSGnESeb+h2CIxtSlcU/gANw/5UOBqCoaHjvuNYJGR63cPHObdevFcY2SCcb97AlnmQOgLs1PqD+6VgnIWIS80UAW0n7YctThsrdO8+1ZGmIKQIyKpQoj+xJ+JebJdxtV+zpUG64BM7fiViPScv+22OD6BxX0VZngOXm5JkFCA5P9mxihOse0MoBYwxlqhVrdkgvI2uSIXWce1XXRxGQ2i4D+mVIO2WeiBFH7eVwGjdwa6qiOm1QXNJShYZ4GZTHF4gNAKpIjlGJ+X3NvS6i88gCxfhusXhrNE38E5Sq+FcG/5fOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYnDejcu95EGE3a2vgEp0fbhvHq0rsUGCiId24jk1A4=;
 b=BrfEevcMULDSsSpOA04Je8bO0jIKtVsvdDYGH3x+CHfs9T9+8+7oDyfBDC3/dT39q4EG1iItMDFr20SDOd1e7JerYmj1J/npT9a8Wrs249BnYTId0l1EtUWx/qPfqhZiWg/2eyr3i1XqVtxdle5MRm6tVKQVzo8y81fYqdZ7Lu/lXeifPIjp9Bg3STmbs8SZ/ZvTeNjCoES023qfMvIxAcLI0cFc0c5ZSZSMp41BM9sspCvB6aSIGASO96bDw29FiPUh3Sx6LeNPishhNcTIocfzSS1W6IC6OXueBcKF4XU22z0dSMhT44Xg9TBa0MPCXDA/7XEFk704bkBPtB8fuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYnDejcu95EGE3a2vgEp0fbhvHq0rsUGCiId24jk1A4=;
 b=z4kjG8FIp1gE9ieZ9dgeZ26EnXZizCjT0eC5udfFAjy4gUnkSOrOPj/twLJdcjufsUW4jK6M9T1/aYiMoEOg4fhQ7DaBZ/D5jUVKc+7X8/Hcjl0Mt16wruZ62urCmxuUMwxxoCbm+F07rJy9BncDdvWXYQ3KZOliHt74beQyK9w=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:20:34 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:20:34 +0000
Date: Thu, 18 Dec 2025 15:20:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 1/4] cg, providers: refactor clearing
 probe arguments
Message-ID: <aURiEFMIDadxcjJ/@oracle.com>
References: <DS0PR10MB7522DE134C06525A82CA4DAEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <126eae26-5a12-f977-cf3d-7efe87f9b26b@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <126eae26-5a12-f977-cf3d-7efe87f9b26b@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH8PR10MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: afbe310c-7eb0-42ea-d8a8-08de3e72e674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?blh9j48iDG3bVTxtpLRENbeWT9TEt0XfXEYppvBGfFtYuDgpQAZkLm+jnfFP?=
 =?us-ascii?Q?gI3+uenPprICPiDLqDcMuAbbcmpGv9BIuFQN4tcPlZAd4WXzOrviJ7k88Zbe?=
 =?us-ascii?Q?CCSvyHgzIGgqULrEKdSdbbqvn+BjlL2vVJNRjj8eTQ32gmV91m04w/LPvRTq?=
 =?us-ascii?Q?Z/LIGW35mC944xFGE7zMOf/y9f83zydiALZFP8sEggB3+IVVx7UC/jmvcIri?=
 =?us-ascii?Q?yaLo/J/xRbA8niDqlLwJAgNndIVmoHhSfhYnShwscuugI9R2pZ8cq5TWdeYk?=
 =?us-ascii?Q?9+K4rIIbOn7AIOqB/KTu1YkWjUrsfMZ7YIsI4LHH/sBvdaFbmha284IY7g8v?=
 =?us-ascii?Q?SlbncyOFjpUh+4VEKVC7WaiZ0fcULh+E+1qrDJuAMRQh/5i3GhpFxX0MWv2U?=
 =?us-ascii?Q?59pKAxCRqb70qmR2nUVBF6OpOdPjA5ihUSv0R+WXh/RNm9KRlitiZV1mW/Km?=
 =?us-ascii?Q?1/bYI13E1jasjfzPB3XhniDKDOmbaQlZKzpm0bNJ847UFMGcSdD/kgpXWQ6Q?=
 =?us-ascii?Q?qu3hEPD2LD8Hu0wdEAaqyn9mIQDgeOi98D83bC2xGpt4MOsWn9+tTdltUKd5?=
 =?us-ascii?Q?NFGbOpufVq5M4hz6oWBtuHh8hhbE0FhAPOcSy9R/DyJbflKhTfS88nltdDny?=
 =?us-ascii?Q?rNt1JB5kF7lPoCPZ2Nb9BnRqvcuV2f9B/MVKG1VMvT7rr+6VsZ9uMS98FY+B?=
 =?us-ascii?Q?YYiDSPgMhQckq2OWHwSEtvoTztCeS6/kOvAcCIKuO4azZjL4HFuPEtq1Umic?=
 =?us-ascii?Q?lcmzIUxt7ntaBtt40OSltzmNCTCpBA6vs81GUGmHXyarblmX9PGwNRL4bgPb?=
 =?us-ascii?Q?7nH9AZxOvR1GoOBsj9s53v1DSUEJuz+mq6MhqxR9Qitd0vshvYl1dM80Z+d3?=
 =?us-ascii?Q?laljXthKlzAwBj6DBgyUx8cEQWGmQpP1oFeqWc+DV0tM+jRP4pMvzP4Yrz8B?=
 =?us-ascii?Q?HjeUyMSQrMDc5PjaGmkZneEWXFKj+xzNod8VmjUv93IycPDs+jMqVmfitymH?=
 =?us-ascii?Q?p3AjAyetMcWm1j6IrmhoweF0TwGUDf/y8JbrzK+PL/NeoA7UXWSGjjf/1iWy?=
 =?us-ascii?Q?uE6Cmuwju9LLSWi+cWgRh/6zykoGGaIZgEevndidOLc5E6lBxfoCIu7PZNro?=
 =?us-ascii?Q?Q1NQpSF74g0T8zH5GapeU3fhsikKo1rGsqCNtEtrlisXGgvPLEIZ1zFZ3P2n?=
 =?us-ascii?Q?14NOXWFNw4xlSHrmKi1QVFv/gx1GSw6RVzxf0PoH11D7RwgFV/gP4uADbbhy?=
 =?us-ascii?Q?KbRL3vSGf49TY8KcDBIG+ntzqWccGRRomzInYgMP+7M8u89DkhqYQr4Y+Nqp?=
 =?us-ascii?Q?n0DichRUCX6XHK84M2XE4Ci6zBu3ho5myRIv6biSs8r4Dl5aUh8pdj4R9oeV?=
 =?us-ascii?Q?zcT/qLYhUNEj4NS2eOieYFEpXEIWuG4D576NlDClXpOU3uHsUsl8wTkZp/CI?=
 =?us-ascii?Q?IKSW/JKy8YzxCmRFIfe7/06ucnjYUfIS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLZo6hDKG8swtnS1iWDTOMSYHxNQNI9VvoQ4vBPmGndDJh2a7J1DPpbqQGYb?=
 =?us-ascii?Q?u7FUVX6QVPJ5YAn0vhdevFJDNFvTnVJnhd9Zv9uVYBXPDoHG3fpjgNCAuEAQ?=
 =?us-ascii?Q?hhCQzpHyQjl5LTo4DeabJe+j+wBPYiVsy3AVvt+OO/NeIcykbGOmdmDbbP5A?=
 =?us-ascii?Q?YJsecr7VebsFjgpsu7ZuTJOTyyPFXEb58ZqdVR2+11PiY7Jl1EFG3H/7EX4Z?=
 =?us-ascii?Q?bTxIx0feIGSux2yf5bYLQp/CmP1h6nMNgZqbWvjD/EY8yMwNsNaXfuSgwmYg?=
 =?us-ascii?Q?9hD+5n/DfKcgGfoypBGEXIYXnyiKC9KrYFskO2t1CYxQggdlDpNP0R8pZvRU?=
 =?us-ascii?Q?haCIX2UYIC3WfEcT8n6r3CvST5C90prRimpFDr2H5ZxvGxrjRDJ68dzF3/EB?=
 =?us-ascii?Q?TgwtbaSCKJPFCReezgBdTiFWjtC5bZ5bE/D8YP6qfmycGxnvt5J2sIFDegN2?=
 =?us-ascii?Q?KHBxp2iKNh4Ml+nmjaJ7HkQYe2RYo5dTSZ8wkL06om8GpF6F4ZkRv4TLjkD5?=
 =?us-ascii?Q?rCwbqgCFVtr+eQ1jeKl9G5tOt+pRcP3o7ZatqI5StbXnt3oj5Ln3F9FRqKmb?=
 =?us-ascii?Q?C8K4JGoya5vkI7y+SxD5QG+JONl7AVVWzeTyIuQkDxdNc9X3B9qU/u4Sk8WH?=
 =?us-ascii?Q?Wz+YZU/+3URSjpewf5/iFPOvgMAbCPbsd+tCIm/r+s8tOpSiyI8uqAvKj94u?=
 =?us-ascii?Q?KQQDwK5TxQN+jsgoMHixEk4WRR/hmjdDQ9gHkLzTXtxY93X/Rfiauk0Jq7Ys?=
 =?us-ascii?Q?7+Lt8J6UdSRtorIPZcx+/qNyz5nn3MvsMyTXCL0xqjU/wDsKtUn0ptbizLKB?=
 =?us-ascii?Q?LGrG+3k81vr46Vzf9/H2dpiMdlhAJ1Y7U3vzPKaz00BSIOuZ6DHKBN2v01dG?=
 =?us-ascii?Q?+QsChPrQHyDZrXbRgZYMC09F+Oq+7uwq7dDjcUEXsdLaqFlEha2a4aKYEcBD?=
 =?us-ascii?Q?fcOHvjkM6um2FmB+Pqcso1PQmvDiDdMhkRwunH9q/PzTwp6GRW7WbotTjh0E?=
 =?us-ascii?Q?7AiapRM1tevTEwB+e0amh7SOkCsoiXgWaPnKsaIoi8MEvwY3GBCaL+UHe+hb?=
 =?us-ascii?Q?0mYmT++i31QMGEX4TiKuMEhCEQ7UXF1j0UJbAKX9DhjDZsZX/akzCvJ159kk?=
 =?us-ascii?Q?AZjxVfSW+0545IHQdcU0FpXDiEZPL/SeP3mkZP+4o/ZCNkuGzm+AndcDATeH?=
 =?us-ascii?Q?uy7TlPArEpkhG4VlJTsf7j7VpRb/XyKBGG0EP8Gw8F5GHodGTksEMqqVpVt1?=
 =?us-ascii?Q?RMPYwXgqqp99WS8hOj98xpRpaLBvERYrtM3vKxwu4BSJ4q9TQFUqoHKU+bD/?=
 =?us-ascii?Q?ZcLiAUd9AdcBr1e/vKkMzDVDfeQePKqnA4H7yhe3uMCeUxZiWyqZOlViistv?=
 =?us-ascii?Q?5M9p9gWHcAXvl+nEKv6a4TmRWqRKsq6CeZ+8zidUnXRU2RgrcVcVJWJuSOFF?=
 =?us-ascii?Q?Z3TYUJmL/AYNymxkLDSPXmErbGEMPFLng4eL2fvigpQvMT1yhPjJDGWL75ad?=
 =?us-ascii?Q?1go5QotmQ7HiRq4LM3PCgwHi+XDxk25nub226BYMB6pq7GjOvC58elOJshdm?=
 =?us-ascii?Q?uSIzRZEmIVhmUuu2LPtODDMJ/mkljX8cS3at6EYQKT8wDNfa/ULA+bsM8ols?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gVug4LVI+c6ISZonlNgSXhTBqVFQRUuGyV8bv8F+KPh3vdboil+GRO4wlXYnMthfKE/3Zn3y/mcf4r3QWYBqM7pBiSu6JbOb3LkjQnjUHOjc2bwpG9wpGvvry2oJdcxcqcQMI9SX9SZ3Vn4WQ81mK9jw+6IBOgxAXNjCQNpRCLbEPNmtLcicvDOfAMceKiPvVBdOjRpZL0p4alygfxnjVDPPL94KcDAQ90yhoLfbtALU5wntifl5D/HAQwapLoO3ZN1HE46vpk/9WRAD4ggDu6xL9PJNfaTNBap+nkwhAC11U/JHtJvZzmt0ckfu+bo4jBEUmNRW37qdWoK5XvXVeBzPpMEKJ9rXqC04nT7yN+vtIbmDPiBAUALARE5kKUeVH3cN+XuQHSiZmqAZR+toFM4lKtMs7mX2oehXvQur9a2/uCCDCQA+7JYD/nkc0qSEANqIagRFMZMYk27vg3k7usag6GQPjRNz5BQfmMdl7u1rdUInoWc6rvOlp1+Zez/Fvqr1KPOnv0M15Q1mkZoPfviLIrKCOK4ai9BMsG6phvBRcoQlodLOgF1tDI43Y5glp3OzCx+26jYX8hMRbOFuYOanf9/RktrpjmE7auum7iQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbe310c-7eb0-42ea-d8a8-08de3e72e674
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:20:34.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUXcf84CNLEJ8lUeJDszI7b9mYNN29TwoNaI0Q+twisNYvlej0kiD9npN8DTlcDSfPW/RDZotioXHkbFWpmyiEjA0KOOyQ1uvQkkO8oIiDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6290
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180168
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=69446216 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=49omGYBOhwhD9tzv3xYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OSBTYWx0ZWRfX47QkJKHbBWp7
 /48YGAG3hVjFNf2pgBxKn5sT12VC5ZtsZSHLKmuBWfODA90OI+bIYBJv+uuI/0YsK95HVdUmNqF
 tIO9GtIOUqER3jwpwdz6kNbroxjdy7fSCpNyS6iqsl2KGuMpgxQqqpHB8OZwZfTGfd3TnL2naW5
 z+IsYi+YFA+pJeUyJoCfOe1NbNfM9ZIOkAT7xkrt/Wyx5PvbwUFETGVt0r5G9oxF+6NGwvyGVvQ
 FjhUKglFpaOCcQwFrW/h8NJP/H5h0FQry4qB3SncNX1hDztTKo+G+Rq+J+qrzlYOshWOopJnhKT
 4zdWw5KQss9AfPgqvxyKtH1ZOyKA2+Dk8Z8oQDM/5lAm90L22plq/HWKTOBH850BCt4kOH+nvem
 ZmYYmpQBhse35A9wGnM14yGlTcnNoLKPflX8Fp0SHLmm2zStScNudlhLbaTd+7DsTuxdoTTFFhe
 YqoB6rMmdJeu6f4D4IQ==
X-Proofpoint-ORIG-GUID: qau89ZjQHpwTscwtxYC4-KKQpoUXylW9
X-Proofpoint-GUID: qau89ZjQHpwTscwtxYC4-KKQpoUXylW9

On Thu, Dec 18, 2025 at 02:43:23PM -0500, Eugene Loh wrote:
> This looks like v1...

Woops, sent from wrong system.  real-v2 posted
> 
> On 12/18/25 14:31, Kris Van Hees via DTrace-devel wrote:
