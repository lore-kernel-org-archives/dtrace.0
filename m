Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2E199E94
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476835; cv=fail; b=NXLWDqaVqNr9yYUhUhDcv1+/xAP61motlt50fiayRON5AnKp/Ch4rOzkV58gKtUR2oao0RYGRVKveAqUKwWHHoDxHXBH/xpf9T+AsDRXMIpvsXhK8kVWmpFsZhzqWEWHshMZ0ptDnTiLlNsLPB7Sk+gkg7GNdkkIcOsnWzzniSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476835; c=relaxed/simple;
	bh=iW1n6fSYSFxEQE2XR6uc2d3RaeZuHP5jbViEyh+PLs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SjycgRVXznXa0UhJN3c1cY5CuFZzDIi3FSDyWUtt4DBSq1hv+pndxvlG9g0JSFcj03K+EsfrDCO2ZWYf2Cyvno0krA1uExyLSI5GAD0NsiTk09jx9m0JZ4B/VTK0wz5j+qijz30NI1WzPkx4WIItnh0izZeBQZ7PYNSGa+sx8iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gvN7wL+J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bh5qavIE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gvN7wL+J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bh5qavIE"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R0vgmS491228
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ttP+LEHyOKrzzibtxm
	Nw1oT5NzQogFXADJpuVkqdddg=; b=gvN7wL+J5k+gJEXWnjEnDOcTgwigepKIiP
	ORagxKI8RDWtwMT2Z4h1Y//8xA0l8amomRzvXKyI2ewWghCVXEIPdw6L5Wsqyl65
	1eLS1s+eSV+87aHsseBbw/FM7GYXKeRUQeMmMfG2bbCri/6w8HKqvM3WEGxApB9L
	Gv4Msier38Pi3r4EljXcuJ3rrh+grXWniTBmihWCFPnhxTXG9JyaDy9eJJwocJkB
	JkIS2eWkqqjVGaoeJMcVMo/8a48RdSi3alzLkaj1Pi8J5Lx+6G2zUaLc2VPfXuFe
	INAtrp3AQhhhfKrEBYw1U3eLqytd9j10ev5JMxrp6nH9nHIbnCwA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvn09k92n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:20:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60R0SejA012770
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:20:31 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8r5dn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGIfGUJEhdWQxKqt/LTG734MI9iHyHuXWnxS1gVpSD7Gf3k/ZxkewVHZW/7kuny+P7n0tUU9Wr2YDW4S0DHdLox/U/QoMl+8m5PmZGTCAV5Xyg5h2r4bwNt3i5pMPt3cx1sVGVS0EllZ1iyUs4dwbMZMhiVDuCmZkvDUga2POVdsDQbC+p9lopjjGCLF1oEn/RdPQjW/MZZ6PW2RMd0V2jzeJWdHxO8HKEO2STK3jxID16+BbkvLPJYToYnp/rMbEmXh/Re2skli3+7q97w0GvlOvuQLlYr1hxj1So6AfRlfxR7jk/i+w42XeG0p0tnKWHUVOmJGzr/F36FO1DNpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttP+LEHyOKrzzibtxmNw1oT5NzQogFXADJpuVkqdddg=;
 b=npqD7wZEcAv40QgHwbpWPv4EdXYisZ4ZD08btQD/+YMz3bD5pLpk1xmvkGxdu/G8OgjaAgx/xne6SiyJXkL+u5SvC08mzfTy/B0BsG2SEXvZo8D/QbWXMce82yQyPv7hqPHpdkC2e3ketmSsUUvx31RE4WNUm8z1WesCQvXTOCcG9Kafp5wVOaYnirEFb11EsvSsa+4+ftqPkx6gD6jbzM3yS/jllPaHmZpPDIw1IRUeXwrZFoVLhOi1Bt0oRPHMw17ZUd10h2lQcPvYU/Pc5i7Ef7IRYgGwW2HzTpXJYdiemNGR27u0Ii4WVXIx7qS23E97z21umzdIw541k3bV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttP+LEHyOKrzzibtxmNw1oT5NzQogFXADJpuVkqdddg=;
 b=Bh5qavIEalLLLn3l2hPJjqrnlRM4c66GupP7hNiYExscRJWWNZZRrbtHaFmh+fYricov2VUBwoGmbgYfNkIkWlwqVVMSMiO11EyfadoBaLkZWz9iKThzXKbsID3BnRpPgrdv+sxuuEok6LaMAV2UW1No1zfHGpzKuwHXd/1aObI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 01:20:28 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 01:20:28 +0000
Date: Mon, 26 Jan 2026 20:20:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] Update NEWS and dtrace.spec for release 2.0.4.1
Message-ID: <aXgS2mGgUmRJ2t4I@oracle.com>
References: <20260126234150.20939-1-eugene.loh@oracle.com>
 <20260126234150.20939-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126234150.20939-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO1PR10MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bdf796-c1c0-404b-c506-08de5d4241b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xMLUqgEkiqk2n5F7PUCKJEhbRCQAgeBHhgaowNK0gdmXnGSGBZkDkTlN6Iv9?=
 =?us-ascii?Q?8/iCtm86/4wNKIcVH63qL3N7xpk9OmPaH0GYh/mKF0QibSTW30wGEu1JevVA?=
 =?us-ascii?Q?sM0Zvtmmpxs5BSXrEoikuvaPiNC4PqVD/ghsThTC3uiQ9UCuoiNH6uMb++uZ?=
 =?us-ascii?Q?V1oHRGbxXQe/s662p7IeCk8baB/G/yeRhY3dCUhJklnH9dzxCRliL542bUuD?=
 =?us-ascii?Q?VqvVZ7CqlD7ImHfPE5qiujAI4kHVMRKUDYSyRKkvbLwzH12UOEsx3YuYhmci?=
 =?us-ascii?Q?k5ArfDA8gLRiREt770I3K+pw5ZrU75UvFn0ewbJuj5G/uRYc6PWHrMGVnNT5?=
 =?us-ascii?Q?xtXvtVqsznNoUEIOSPwZmb2rxPJ2Qwl92xw79EQTDyLfW+WV6QypVP3vlZW/?=
 =?us-ascii?Q?gh85DNseD+6hBgUV1ONB+7gA/g+63pDAxMnQKnybMkAWAL43ibH+tnikZV9k?=
 =?us-ascii?Q?MA0cX5+gFZRHFUGMgqHQt1S1qt6DtcWTvbJinrGapwYhLzfBCj/Ks1Z5C9eS?=
 =?us-ascii?Q?ZEOk9bilxAchokRQ8TtXkXYHONCnCJxHE60H+V6iBpf8qVuUDlWcN1DDOo6l?=
 =?us-ascii?Q?LKKJuSwhUI+7xRj32h9jA6pmVPnuEbRn3Yk1BoBiRURVomflXJHkLa1nnrfk?=
 =?us-ascii?Q?oM0oE2k1+GRXIgCQ2zdcGvvKFxdzPN3uChD7DGxYw3s/lIQpDlDj74nSzSMh?=
 =?us-ascii?Q?uT9algSzvmiOw4K10rjtRUDwYt8VDzURsMNEl7EbNDezft+gshriv1E0ujgI?=
 =?us-ascii?Q?r7Jf6Al5KgZzyR09On2mBcYt7M+2roWo46+rL3fDeFRGvEVn8lRVwUaCEL0z?=
 =?us-ascii?Q?Sv80ncAzZOMxQPJ7T0hzWd/eUg0MuLR7I3U0VxfWQeAsseV/qmBYcw7/jjgn?=
 =?us-ascii?Q?+ZJxjNfAJhaK9nE5culr1cOZUTniT0N551KZ0DHz8HmzKR9vVwnqfKeHjY0N?=
 =?us-ascii?Q?cG4oRRj24Qz0Y4w5fExzEQFnNDpuiuEvGL09wkfLHHNOpQEBTffisaPMTT6w?=
 =?us-ascii?Q?zlYskSUMzL2cW9qaQCw8EhdXdI5JlML/BkhlwqY1HMG8Gs+VaQRxUtT/a1rY?=
 =?us-ascii?Q?Boc+737UYv50JIJuzD9onCldLRIrjU+ZsxesnZjqmHvhw1hE97fAHSzE8BgQ?=
 =?us-ascii?Q?9nUGSD14/T0GXmxAuqM0PemG5FrGYqYqj45+cKIARei+s1E5K9+rqpustV1i?=
 =?us-ascii?Q?4tBAD6oNXotucsT7x/b/03N8QX0HRElyMGtprXPTo/mL5D/M1hUeh86ks24s?=
 =?us-ascii?Q?H/3Ff5MOy+Uu7XKyOfvShyV49GCGpiz9k6tB3hpjX/rTRV6/gyPb9F9AfeSH?=
 =?us-ascii?Q?stWR735gkRJ+QLvG4rmXVHQAykhvPm/EUN0RKuHfRRuHrhl3LXyZOXSuJ14m?=
 =?us-ascii?Q?rcprQXjd/wVlUkDiDDhUvbRPre+UbSduxWeljnZXJn/moZcn0V7hk8ypfPdO?=
 =?us-ascii?Q?4i4FcLDxDIB3OGAy33PzN+cwH/MX+bM/kV4YaRGkolzwlh8r2IzemQXl2T5M?=
 =?us-ascii?Q?h9TVI5x7O12AtkuH7t7mbUcWaJWg/NPVvb29ppJVKz8LAq5AuUZdH6tbjpjM?=
 =?us-ascii?Q?TJjzgVK9JMKkIt0rRU4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PM6Wt+dWNPpqrZs4NqlCufCepFoWwV+0JpqLPQqoN2OieIRJwuOpPrt7ej76?=
 =?us-ascii?Q?JN6uP8uVI/MpkdpuqfgkymXOIoSsU9agz3nrcndOiw8HOTyZFghmFqI/DW6j?=
 =?us-ascii?Q?OfM4UE3SBg7z75+rnvBbnUwaOZ22rgh/2McvPwVbnZjJrhXNsTSxUlCnqjEY?=
 =?us-ascii?Q?KIVv9VXVQEd/HrZdyw+9ldKUCHEFoFd2bvrugWRPa3CBK0RCdTnMAslEoD+F?=
 =?us-ascii?Q?10DCHPUpeDaUhk8ztDwth6zpjnYs7vWGFnjXEW3+rvlV/7WIEtlTwQ55MGOl?=
 =?us-ascii?Q?HEtS7oqc7GAJya8tyDMvSq+0oMUFJ0dtRmnyJEVyV4WaB0Anudkbjq1d5scv?=
 =?us-ascii?Q?+fnDPDmbGfCMgBss+4D/P6KdvV5ca2abW2YKCsDRDECBAw+lWj/kvEoN8bqM?=
 =?us-ascii?Q?9fSZr2pG7f3+tWq3dlCg2VYWgc+a7ydv9BYSEP8O6xOZZ2pLX7svY3yytzYC?=
 =?us-ascii?Q?8hnqFqMKQ433PJmiX+lJRguTsE20o1bY5AGhljqTPl+q3UeHYXKRHvDAeeGN?=
 =?us-ascii?Q?uN0bdgKBc2L0nJMWrtF50FIlpa/4kHrzH5d3v60N7giISv0yD/Yn41VWdoPI?=
 =?us-ascii?Q?7q2w5Xs7b5V0Q3N36MBwAOkhcjHfe2TiNEGXGWNc49r+b3QucEvrNNum/oD0?=
 =?us-ascii?Q?KdRptHQEr4O1Pu/8mZtQ2FouTfn4KF5JhZjaCg+mURD15344CNMK1HuHXE/q?=
 =?us-ascii?Q?648S3LUoUPSNjj42th0XRm/DMaJXvKXrSIDiCMHSqcY2Q13ydLoIXN/OrlyJ?=
 =?us-ascii?Q?PGnkntRt1tCy/9lBSegl4F5QF01is1krc5rdACxTF8vveXp/mrWf2Kv8x8pX?=
 =?us-ascii?Q?Z1Nx1XT2DjsymI2kMNNDI4cYYBxY5Cy8SxX9Y1aPN2hPCKQJNkTW9CXw63gN?=
 =?us-ascii?Q?IJY7J401r+x/5Ru2LSIjNGNNDFG+gDWPnL++NwbF4W1GiRvw3rRojvMLQudm?=
 =?us-ascii?Q?kZJBBQEuYw+MMD8eAv6LmNbs3pVpS8QC2Z3QcRcSKuryRrcF6dLKmurmoAkH?=
 =?us-ascii?Q?BR/+9GtM0kOoCpR4E/9SHSdEFbbIq6zTy0yIXXBVMUD8Cc3Suqimr9XXP28+?=
 =?us-ascii?Q?tvzxcnsUA1qxE2w24Dp28ET1QbF44lNSEwzV8PVp5l2Xp9uWthzQveMILToN?=
 =?us-ascii?Q?61oZr0t5xeXqiAfzrezbNSRgluNJjH14+4tfUreDIIi1C/7makG49IKJaZlH?=
 =?us-ascii?Q?uLne1ZsZeHJt0IA+ChTXcn0xDvqb7zcn87XpDcMbd/W+GZCWof2BObc5JMBM?=
 =?us-ascii?Q?BNRT6+bG9psS+XCFbM3AwP6OEOD0bQXSGC2/4/wlxPyq8cLw8ZI1xlA1mcxi?=
 =?us-ascii?Q?gScLA1jGExqZblBU6JUYk3PCKcctriR5jZBfI/yWCDf1vf/OyBGkgJLbG644?=
 =?us-ascii?Q?9fXtATCy4qDWJsV5XFzl3QhsWDB+r06xlq7hMhtWVrZ/yzkbIwFvdM/6o/X9?=
 =?us-ascii?Q?ur9p9PpYuD7soUwridpckmFLTXI1LvincjhJH6VUyu4ADL4qkynpV+SXAxhw?=
 =?us-ascii?Q?/IyGUJWoEkRx3ZHhkcbdrFhw/4qCgMhWcZ35Oh5cPi/AzjFIZfpSL7e+GfmC?=
 =?us-ascii?Q?tPTsit6VukVQA4chUO5u75UwH5DGaNUEf12LNJjyPKNDTLzeeHdaZ1c26Gpf?=
 =?us-ascii?Q?IdloHEOAT1Xw0RHNY4LqWfSJuyIZ1S5xA3KU526EvSjYJAt/vE+SX4PjggSi?=
 =?us-ascii?Q?Hfw4rYE2HsxMzSnd56hIG3CTWfCyxDVAeWFBcwKFSCs5Paf9wdzZw3Izlijf?=
 =?us-ascii?Q?2x7kl5M+ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w2ZnkZ1GJjILTHIH8jZd0mlgl2IT3XypUezV6UM5Go9f9p1xeUMb9LuNRzedm3mRpUmM1zkGK9qp+xdlAtkwkq13DdrGi3S8O2Pik8cy7vqDVNBX0hibWGR5qbCi4HdQiPdNE0NuIyf/wU3wQC1hBMmo9h6YEp0lYWoavzQmFkpPJSpFvxLqqcV6AWM9fCE3GXjQYdjGqBOhSGPBLT/GxH6l8xvspkRAhITGeiLMM3wucYGd5ejSrzvGfi4lRtPUsGuIUn8wELio5vEc5P8i8FNPRowWhw62fTWVZv7wGvT9TNfJIHIHoLj/wNOANNJickFgdq1mGxUWzVZWKvu73Vw4q5tgnPN1yMHMDFTS5ed4toIdnlS9vBO6TIg1Dx0W8XCbsMZFmR6qdDwkFxPV5Eg+SipXek5mge5uym5aLQh6wbi2hBopsi+1tL5vvruy2ZMv5vSmvhyZPaAHiY7t88mCuy+d4K4/dEBcvgkNct2M09J5xwtnIi+pehK5nUQBu+bHVDu0SK12hlNmPKW0emxGmgKjBoOCuMtdJI7G0ffrGwnaJxcuWcUWwe5JT1JhnfDG9Kl86jV2WZ2bCmPXDO7qZy/2s4mtl9rnZedc1lQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bdf796-c1c0-404b-c506-08de5d4241b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 01:20:28.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MedOsjcGk6RYWg0vTPlOVjyFRoAAQ/Nz7a4Y0dgsLwsWuG0mnzmgt/W7w6IveAY0u5kQj9wUQhftoM8npP8+Mhczb4ls0yn5x+ome4ssKWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=2 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270009
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwOSBTYWx0ZWRfX976RpUcZIk3T
 RyltFdRc1xE5u8zw/Y59XGvSZ3B4GrqpkwpTLdBkZFMcWLiHt3Mp+yxc0siHnz1Rg1cehxuNy1L
 gGXjwWqock/pqI8w6gaXIijLhaEDmwyDVKZXhMv85xtpcjDOaAF6KmMGMsl2o0d01hN0kyycoma
 QWfgrnd1caAQGoQ321jxghcdHNz6exU/Aza9/RUid8P0vnrC4o5FNv5eUWV5WQ195LoA0jb/xvJ
 e1X//FQC45LCjbuYFcchXCytXXj9swJSBt3Z36tkSnepiB3MKZcCLUVFuOwjhoPwyVvFfjm2scr
 rGzHgpyKjNz/ve+lVmnBTVj+4PjZa2onh6qcFls+V5kMksL3AulWIPvgTAm4thrBAdcfVgHRxIu
 iKbHPiRTs2EnIDGjr1GkQi3hbVn9TL35xMPoMb1HMw422zdz9eUZ3cEgAiAHafMBZTCmOiZmCYJ
 /ABnT8FMHa7p61H4NRg==
X-Proofpoint-ORIG-GUID: Q3rYA-VeSoY667atkzGUEK9gQG0cdQ9w
X-Authority-Analysis: v=2.4 cv=Rp7I7SmK c=1 sm=1 tr=0 ts=697812e0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=8KCI00RgWGt6H0MNIwgA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Q3rYA-VeSoY667atkzGUEK9gQG0cdQ9w

On Mon, Jan 26, 2026 at 06:41:50PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  NEWS                    | 57 +++++++++++++++++++++++++++++++++++++++++
>  dtrace.spec             | 15 +++++++++++
>  libdtrace/versions.list |  1 +
>  3 files changed, 73 insertions(+)
> 
> diff --git a/NEWS b/NEWS
> index 48ae0bdf6..9348c01e1 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -1,3 +1,60 @@
> +2.0.4.1-1 (Jan 26th, 2026)
> +------------------------
> +
> +New features:
> +
> + - Implement PID-specific uprobes.
> +
> +Bugfixes:
> +
> + - Allocate the buffers BPF map to fit highest CPU id.
> +
> + - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
> +
> + - Fix prvname so that both rawfbt and fbt probes are seen.
> +
> + - Do not convert "__" to "-" for stapsdt provider names.
> +
> + - Fix printf formatting with non-monetary grouping chars.
> +
> +User-visible changes:
> +
> + - Discontinue -xversion=V as an option.
> +
> + - Support non-libctf environments for tcp.
> +
> +Internal changes:
> +
> + - Fix some memory leaks.
> +
> + - Refactor some code.
> +
> +Testsuite changes:
> +
> + - Correct file permissions.
> +
> + - Add ERROR clause to prevent hang from runtime error.
> +
> +Documentation changes:
> +
> +- Add the DTrace Tutorial to the git repo and install package.
> +
> +- Clean up formatting.
> +
> +- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
> +
> +- Update sections: unimplemented functions, sdt provider.
> +
> +- Update LLM context files to forbid "if" statements.
> +
> +- Update README.md for RPM info.
> +
> +Build-time:
> +
> + - Clean up .spec file.
> +
> + - Add testsuite dependency for perl-Net-Ping
> +
>  2.0.4-1 (Oct 24th, 2025)
>  ------------------------
>  
> diff --git a/dtrace.spec b/dtrace.spec
> index 58925aeef..33cd4eb6e 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -229,6 +229,21 @@ systemctl start dtprobed || :
>  %{_libdir}/dtrace/testsuite
>  
>  %changelog
> +* Mon Jan 26 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.4.1-1
> +- Implement PID-specific uprobes.
> +- Allocate the buffers BPF map to fit highest CPU id.
> +- Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
> +  [Orabug: 38776929]
> +- Fix prvname so that both rawfbt and fbt probes are seen.
> +  [Orabug: 38842114]
> +- Do not convert "__" to "-" for stapsdt provider names.
> +- Fix printf formatting with non-monetary grouping chars.
> +  [Orabug: 30430270]
> +- Discontinue -xversion=V as an option.  [Orabug: 38615307]
> +- Add the DTrace Tutorial to the git repo and install package.
> +- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
> +- Update LLM context files to forbid "if" statements.
> +
>  * Fri Oct 24 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1
>  - TCP, UDP, and stapsdt providers implemented.  (Alan Maguire)
>  - New learning materials:  the User's Guide in Markdown format,
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> index 8d858f0bd..29c95dd58 100644
> --- a/libdtrace/versions.list
> +++ b/libdtrace/versions.list
> @@ -66,3 +66,4 @@
>  2.0.2	D API 2.0.2 Linux (BPF)
>  2.0.3	D API 2.0.3 Linux (BPF)
>  2.0.4	D API 2.0.4 Linux (BPF)
> +2.0.4.1	D API 2.0.4.1 Linux (BPF)
> -- 
> 2.47.3
> 
