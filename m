Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840D189BB5
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731340752; cv=fail; b=mGp6td6iqzUHqod+j/1OCnJDWLIanGAtyulKmO6TP6wISIpt44OvRp/6J/QIPPGUB5dtKDD+kCZSkUr5gUIvMYbgkMCX9BavOM7WCuAX/xKnFj5w9QiOHpNWH+Aq2CZG+aX5F2cH1MSiBvvOuRO5u9yWigp/brRRp0I/kzVE3pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731340752; c=relaxed/simple;
	bh=QBq2aLwT/KY1is1fx92qd9QbKcm5r0RfT3b4U7yfg44=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QWyAhl0LhKrmDafVTMaH56WMcZkEMXc0e8JL9eXHIN3cUSkYjp/IZ+4RTJA0XI96Wr+dEuhUKbT3tsCLQxttunp/HFTS14D9Ffsvp3fCQQSD7eBO7kz0Cg7ChRJxamLwYFTzNZ0oMaH7tTYyBWq2VDfd2jdCCNdpkzhTYhv6VeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lxe+T/5U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HQ7SkkAn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lxe+T/5U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HQ7SkkAn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9sqxk030158
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=BPPL6yFQ7Yscv4SSJ6
	fyM464uZ54BSnBYxlF8SkfN3I=; b=Lxe+T/5Uy2WtF3jj4+uZhyxNIdzzEC6T5s
	nSsvTR44dbbjizpS95+1QJjSePYCzTnRn6fhCJQsx+Vl4uxkN20TauyMH3DajpJd
	AsfeUsyKEEDHHSg6TG4eBQUEj33ej4hcTrX0RiLfQBqoYfA6AyTV05jCl6JEd6WO
	2WwqWEQkzNCek4iVZZTQXBUjSjryjDNxsKHi8AwCugLNCZlQi/5pe1391fvtjyP7
	4Gpsxg23+VbFxzZ5ywT5uN7MQeiHhJdkX7dwnLD9GVJhCQZ4hRw58XMCtHM8Ud1S
	m+pSclFMwEEmPnqnph5yGaews8CWpwVFWkvEtvY6stHvz0c8S20A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kbtt9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABFF19f034308
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx676r51-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2Bg3LdLSP+kTpzX2kUWhxg6AM6K4yLMcQjxNjWzawdd6duYnziR7gcwJ3xsorraZTnRsgbvbTXg9Zebi3eePFTArY0Sx3lt/pEd2FijU5b5xrxs6kmPzZpTkFE+H4pnDceWt4VBDh2sDG6p3B93uIG/9DfuzX5fRGDoUrTqf+yAtinL2ufU9bWPSStSb5+dkGnrvI6ddrXyMQdiOF42rl3XWPotvhGbjVTc3QWW1exDeRHdGdNPXaOzE8AhA3iEoahoLdPRdBo+NVJtWI1Q1LQ3GnorAquUImVFXfOgDRE3ltqyUa7ltNYjQuKrpEzNFpIRxHHct4CPABbHpev0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPPL6yFQ7Yscv4SSJ6fyM464uZ54BSnBYxlF8SkfN3I=;
 b=C0jd62toxUr2YW0FGzGS/+nYAap+JFAqgxVnAerIMLRZSI0V4BdP8t3LJn74IEhKl+P2QQZT/N4jcqlqEpJZ6UPY1w9Lj3t0Nmg3jtTvQArjJGrbAwwTDGIOsu12DhCcQB40J4PVuKuu8/J2G0R8IyOn6Zjxae7oR2W+ll9RauIRQBuktAHybKozuKU7yJmXpQwX8gxR1T+yWfo/WmHWvUBDOphFCvuxM1riMEOW7g14BaO2tWdqBdATJekgjAP6t/TJ0C0bKVR4XQ+BY5+9cLFXsxsF9OU/lCkH3bbcxGTON6nH4XgXxQyOz91911wxoENCvSmbba15nkY63YIAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPPL6yFQ7Yscv4SSJ6fyM464uZ54BSnBYxlF8SkfN3I=;
 b=HQ7SkkAnqdHV0jcb4RB/mWOFTpuByfUCtGhPq6ria4aAvukZEDITS2WarNugKISUyRuI3n1prX4fc/R8TUq3k160KTuJzlnD2l4u16FtHmtWs3rFyRc2mKQAqMiH3n4lKi5xlZsKicZDIvgj6seszSMca/SfCfWAh+n7A+qVbUA=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CO1PR10MB4483.namprd10.prod.outlook.com (2603:10b6:303:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 15:58:46 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:58:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/3] dtprobed: fix install of dtprobed.service
References: <CO1PR10MB4769FA3D0ACFD6EFAE35F37EC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
Emacs: the prosecution rests its case.
Date: Mon, 11 Nov 2024 15:58:43 +0000
In-Reply-To: <CO1PR10MB4769FA3D0ACFD6EFAE35F37EC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Sun, 10 Nov 2024 23:10:46 -0500")
Message-ID: <87pln14v9o.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CO1PR10MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c13b472-85a7-421b-e65d-08dd0269b929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?71W6Rpd32MM4hCS6BkDgCvWEn9ALjHea8eVPR8e+S6J2pnvZI9yNvDLD+HyX?=
 =?us-ascii?Q?D+0m0S4ztsJfc35djbM0yYEGQfCQS2tJdtE4TOzV4z7v3JnGpBV54u4bWf6l?=
 =?us-ascii?Q?KjpeDe5YfbvSO3BWpK/Zb+hIasiRhSh6aZvL2caBstxpq72d8JRAeECoLfRP?=
 =?us-ascii?Q?I9SCmQL7hpQdtGBwJ/L8Zga8Fs85gKg5NyiX5QAaDKJ/POi6wd5rJcOIKiW7?=
 =?us-ascii?Q?JfH84IdJlp32c7u6bJMpai4k1K5/HLUmEQdNkUnSNJBPRhcv+2PVmw6kAh2K?=
 =?us-ascii?Q?i/WJqPOvXs0HjOEPKmADSf8ucRD39JLTkYvfXRTKQ7Gd+QFyMsOKrCJzFZpv?=
 =?us-ascii?Q?0bq85t+Op8ZxXdpsjuNKZ3O5WeHz2YbEZRrwtBMAN27RTuEq1yFBGxW5LSNG?=
 =?us-ascii?Q?eV5CD/vZQ6UR4XguvAMGVeiaSQN/7iuPIHIjZp1+m4MuKfidLLxxeDn58cjx?=
 =?us-ascii?Q?zdsSOwpF/bfsS4R2uoNELNae9LNiNH7vXf/933afAsL4MGNwX7HkxB/eplzo?=
 =?us-ascii?Q?Pm3u1gHuveSGAuD2F5BI3viISwF46p1GoPPUIWEu7eAJOaOSkf+NqhNMUmfg?=
 =?us-ascii?Q?o+tOWwvC28/6Ytj/v8q36lfADH3Kh57kVzFqPeo1JFgsTgqGC2cyDdGljv6l?=
 =?us-ascii?Q?edu3qE88b2IDWzq4xa9Ta/cZO3wMtS5LiJpavUCUzLe7e7Umef8aAgGjmyWR?=
 =?us-ascii?Q?SRiCKTogdgdMgvNHM4/MdtJJXvRkUg6F5jd9ipqgPmC+/uZiolarwqlZ1d1b?=
 =?us-ascii?Q?WEmUsqB7mTo+2Epz3StVIdlYFrIL/i8Wsv5DzDhVMMlY4/yER8xXxMFGvqJi?=
 =?us-ascii?Q?+9hX2wPi0xVMNYwLHPTp1btMfLQq8e2VK79BTUkWy2IfgT738mrv8nKiZEmW?=
 =?us-ascii?Q?HmdKs2ps1PTOVl3J2KY8kyYtTWuX5PLZRd5wafV12mE6owqTwaRMeJHsPzu5?=
 =?us-ascii?Q?vDn0sXjOn+j6C/6AdjXMHHDttl5TJ8xQQK4q1pzfMJqqSNSiwAbtzs3oWnFc?=
 =?us-ascii?Q?Q2+sFr868Id/JzkOveeiiVbiLgU8nR9O9FTapc6draC43umz0yjMZoBl4ti3?=
 =?us-ascii?Q?GCqgG8qpZyo8EXQBeV7s1r0qSjftjtASHu6aOpVBPaa2vhzH+BIQSqBKGZfC?=
 =?us-ascii?Q?XVrFtUbxVhjHv0TIms1PF0dI30Ufj7l2iu2qIGz8w7aafztr6rFRFWFdFmok?=
 =?us-ascii?Q?l/945BNDLBEg3exl6D/SS+jI+u79roPjYBYDUxNXP6UtRs/bnb++jdAIXE3W?=
 =?us-ascii?Q?oPzaC+7dE4Vr6YV2UPFPrbhK7fenbMNU+FZzvkEEZKRpYtLNXxH0hObthHGs?=
 =?us-ascii?Q?tgl5z7gtGGtSgWu1fC/yNpNE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zIiRFbDFkiVkMy3rZHa1Y/S7305pJuq6KiWNxcVTp8y8RcWj5igqZglzDf3+?=
 =?us-ascii?Q?Oqundfyq57XTgmohmEUqRXAxajGaeb4+CTU/z/nP/W0p1uPUTuI+vgvHFA0d?=
 =?us-ascii?Q?KV0sEnpwG54dWzoziGzGA1e1yUWdfBiL8C5h93oCUaJZS5hznEap7COgpzCB?=
 =?us-ascii?Q?h26/yx7ImES+HtJyhbQXBCS1LRciLaQjcI0fFzTsaDPFybeynvwkRIWtTPdP?=
 =?us-ascii?Q?whPgTJF0auqC5xb25vJiJzYGFkerDSG++CEziQdMELaWlG9Qb+M/in9OF3va?=
 =?us-ascii?Q?SMni6/HMLe62tZKm8KxpP5M6bQf93VFVfEGG361Ib0CR8T8TbEENlRfmbSOH?=
 =?us-ascii?Q?/bpAkcNTumEfqa8Opn3r9YWyw9A/hMTLF6Rgamwtqnd5XX1mkOOc3fj7BRh9?=
 =?us-ascii?Q?lhtYcX7q6vimyKxLG3hatLBX5rAM9IY11DzfryByAg65joQT3vcJ9pLMZIoR?=
 =?us-ascii?Q?sHfLQ8axk/sSGcoR+v+ETEB7Xf+wIb4qlZpAhA80hFa33APHS5LEX2KfKc2v?=
 =?us-ascii?Q?Pl+ZIvSPOLPcjonVuiQHK0z80uFeHpoPDj2eFgvED9BPX5VsBexVcHE+eZMe?=
 =?us-ascii?Q?ysz1qMKcfe1KDOAJwB9pJzSCy/e+CXmRXGPbbppKrAByLaX1l91UOZPltHr3?=
 =?us-ascii?Q?7gPsR+tgdDrmlSwR6EiwDivmKMKY/AzOByylEQl5PkKWiEg7AjTYGYYpVL0M?=
 =?us-ascii?Q?U8IeaR+lyRyLhAg6Oo6jnl9+dGylwRDEJ1DMtH+pzxAgUg4iJNoJo0Sf+Kcw?=
 =?us-ascii?Q?nz/33A7JOxc24LuoxvT0qoOCMCyFCzz3CwZoc0GZZNRip/YZCIZn0RCYz+Ob?=
 =?us-ascii?Q?wdYhvhKLWhdrsSWAjVAARZ5nB2L23g6oxibS1S3bJlxrf9G/yC7AqVjQotna?=
 =?us-ascii?Q?i5gyNE8DO7zBBGDpqlInhutbXoWI2oyh1/t4nOrkXzotBTQo+Xdy63l8xQQY?=
 =?us-ascii?Q?hfFiL28s7GzW97VBF0yI/QalJcN54u31lcDWs64Xl+6/t5B6UQNcOzASUEry?=
 =?us-ascii?Q?p46vZwT4RrfYszcaYblrUghjxM8hpBpJpgh1CSjPKRmg2xOMJYf6CJPr2Zp6?=
 =?us-ascii?Q?FIZ+U+q45NVifNje6YwnjDWVg89Ur29FDMhKYtlezXqfm8PBGO0AjjaHpk8N?=
 =?us-ascii?Q?/ts3Uv88efWidDu+z+3MRUUtvsgiwFVyY4dPQ0duaXvxmyBLyRjw+zNDm/YI?=
 =?us-ascii?Q?zDhejWgcDX5pKW4SyhFLBn4cEGNJ/3IBURU6veGUwo4jDwbYvaCsHdg3nXG2?=
 =?us-ascii?Q?DkO1LIz/CjsiW8BYB4yncBQFyQKVjVc1ZG4aSjr6t3VQEgwY+d/GbR9NAe/o?=
 =?us-ascii?Q?rZeblZUaf4gCJlQf9WYUCmb9l4yY6w0zqZQqkxAquVPrYTwivEcChqIigIq9?=
 =?us-ascii?Q?0wRFJpx9+oXyhLcF5zhecXyoO/zk2UbFhbzuNHvJ68hGmhDZNQ/HgI+NC0/0?=
 =?us-ascii?Q?REqwKYKAojMZcKjkdyUXKBdC5U2FoI+f6bBH+SauZWl3MXoJqiwedKed+BF8?=
 =?us-ascii?Q?e93Hkv8eDvDiqFAgcLP1Q5BYjYwd0ISg/T3Vwrg4k5xdeKBghYOPsnicfeTS?=
 =?us-ascii?Q?GFnE0ZObA4Ebad6ECVINtiDY5S2XX7U1hskXXargaQwXQ/ium1MuKLeThuTg?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tcp6ebmSzkQS6miwTOg2yJAk4/xbbD8xS7lQI7ArJB5ji6g3i70yUM1DhJz9taxKnbqiMOYYTM+nmD7ZmDqIfATCLOzvbmwb8Zb0XOd0r42GeNc/Nbi+/kgzATFfypjG3bvbjePoEpEHFwVBjZCXy4bKsVBdCUYEa/Y/iSOiK/OretliFN5+VAzHN85BF4S6na1V18exN2xaOl09O3z//0JfWD0Vb59T3aB/kbOT/MrycFyDjqjeJ3bVNEimC+rOTjUfl3OMoWTFX/wFIZPkcrwBT3hEd95blvXj9UQGfPnwYn2eNFOrjJl9Zdj43DRtwg8hXFWqEcHqCXJoUK2I+X0JUO+U+c6cWtk8b4cWgFn/J+9TFiezAheFuOM4dS+RhhKNne9VPuDhHzE9CC5fBb9DufBDRehP2wK3d8Ys6V1qfXOTgRM64UugifQAxNP6Zc/aocePawzAGki5G470/qLctaeepg3yHeEiFOWiZ/4E6WB93SGtnEBI3vfKga9IQyk4J3WBjMbfeHj/hdYqQYZ9CaAQz4NjNk97XEmvMdiuJbMA94GpEIPvHdmcomz2ZJ+sGKHQbmkyoDPXGKQrjijY4tKs7o6glphOYq1XrWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c13b472-85a7-421b-e65d-08dd0269b929
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:58:45.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjaiB3n+dzXR2PWd1Z0BdlYHWUCVhTMe6wrnAYtxFhtaEtU7DfI+4Y0KVS7dTx/GJMBa/5iNag8LkPvzlBYz3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110131
X-Proofpoint-GUID: LkZxXnVWZLpjHpAxIgFgz4X9hFIgJW9w
X-Proofpoint-ORIG-GUID: LkZxXnVWZLpjHpAxIgFgz4X9hFIgJW9w

On 11 Nov 2024, Kris Van Hees said:

> Commit 4d4ba4997 "build: make dtrace and dtprobed relocatable" added
> makefile instructions to install dtprobed.service that could fail due
> to permission problems.  Instead of using sed to write to the install
> location, and then applying chown/chmod, use the install command.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(better than what I did.)

-- 
NULL && (void)
