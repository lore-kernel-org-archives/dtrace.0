Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE688199EAD
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753468816; cv=fail; b=nirPtnGfKkoiHh+cgpWu+u6+BbZBb2bRrgIbYqUx2Lyp/P2TkIGBjAIRZkrMlCwdm22aHbGjFaEVQjXjIZmdcXIQnhszPrAyxUdm3KiwaZyBM4DqWuGxl0aIfLlzcd3dW2dK6FFyc743+jroDzMxVsEo1R1b1MvFUQBf5+Ek2cM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753468816; c=relaxed/simple;
	bh=VWMFIPrWuIsbhN6+4EmL+DkSNA0zzf7kmUe5mwiSIaY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KX+NL9Ozh7gD/epp8jBxWI1Vpyxh9qoL4ZhY8qZsAmxH1v7+nIEPA+j/cj34VABvBLrqthd2+81HOf20r2v5s/dFSshRUNUUkH4qlZfcqasUDKnHnvUAqQlz4+RAki/DNX8cGkBnPGO5bOjQuV1K1vjNZ91gXfs3piIDmd/1hUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ztz30iCH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oj5s7IZ1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ztz30iCH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oj5s7IZ1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCDaB026471
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=M/QExSjsJLgDiReb0L
	OKviNsQRVDJfOYvjxjLfS6zZc=; b=Ztz30iCHj4hmeEuNnm32uj5juIX0Etnky0
	J/lzHCch48AT5kg4WW9nshacVKLc1JLKovJcjCuKyB6NjIZxzJ4pnASmTfCqas5O
	MwV/k3XlVtEt4Co4AiTAUMtDyyRQM+G1jyBGky/qirvjimGuBjxFt8GcPpmTNC6t
	roMSliARMbr548Z1OcAgny0UQqEAsnBS66BQXj/ZZK6PTJFeALdE82DKmVX4hIJP
	hd1a/DvbnfaTdw198YBusblfQZTIHwNFycLnM2KxiIxzmcizz5r1qlb+sdbGreO9
	0cRPfKL2faCjU48Ali95MO+WZGMS1hQogWmGr7lOynmwlEGWHOTg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1jhmjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:40:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PI7HoX011419
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:39:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tdc10k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:39:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afNtew0gd+HFKU09+Hyl9vR+tHqBnQ7QyLTIJOw0vmtkJlc7eU1+AmmsuxNsclcEfdWzi3dtHwkP7kTvZoFI20xClZZO4qSRSJZrV0H5H87TtcHyhLjvfUjja67uvm2r5qzEdXPVhESh4v8PWPh/gMhLrJ1yO04MUu+/pOUqBx2WAMgvyfBp8Q5339c+Z7ZPnKILfsIZfl3RXiEvN7yF6qn0P8g8uDjpyw4PcE3iUwAf/9XgcNNm4VvKQzax1LO5kiprH18VU7G0x+MuOuIMaSbuX47lesq0aoOtFH/m/uF0nDDEUXi6OaauAwFPqGM2dkGcMxZpISAFcKWnPeO+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/QExSjsJLgDiReb0LOKviNsQRVDJfOYvjxjLfS6zZc=;
 b=KMhqkqP7g+GA+/FGf0vFEmumnUQk/ahGFi9fl0SmY+MtwbxJSQBMpb+Z+cG4SxYZWJn0SutAvy7clFp2ZcXD4cUr6SUa6M2FjsOufv7FEIrDAdQMyzUjMklGW41gHM+YlQQcLWdNzB+WXyNXScWBxvJrl/hReeHBbYWTtOZTWPduLbb4oDX3xpNHysw2EcepC1v8jgYMPCEYfwBB56JDEak6Ho6RhABc/iJ2E1YqKID7pr0SexXWCAnU1DeQUpXW+dZRbhiS2cFzU2NBZA7gmI1xj+N8PLP8IKyxPsvRBi5nLIe7SGYqeMsbQWqGpiWMJ4EE1tNYyBJidR/Qn/cLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/QExSjsJLgDiReb0LOKviNsQRVDJfOYvjxjLfS6zZc=;
 b=oj5s7IZ1y9ENva2RSSvhalxi1wErmv0H6LFvW/YI9dh5y5UeHE+Udfcg3XLWNzRiJ3Wf7YGHsXpYzgKfGkWimrMVvHpIvqQoA/kExey0SW7XsfCE6RWAoMuSPKSe66esSnX7FMXexijkTPDugif3G4YC9im9I207QU8HNVjHF1I=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CO1PR10MB4593.namprd10.prod.outlook.com
 (2603:10b6:303:91::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 18:39:55 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 18:39:55 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Free the DIFO for a probe once it is loaded
References: <SJ0PR10MB5672176142BF978BF54B249AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: if it payed rent for disk space, you'd be rich.
Date: Fri, 25 Jul 2025 19:39:51 +0100
In-Reply-To: <SJ0PR10MB5672176142BF978BF54B249AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Fri, 25 Jul 2025 00:01:56 -0400")
Message-ID: <87o6t83yiw.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0420.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::11) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CO1PR10MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ddacc0-39a5-40cd-f672-08ddcbaaa649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lu1MfDargOdC0FGchPeNWVSCm5HGHrdh9rGxBv7gqEdmp3VZheXX3m7FKlCQ?=
 =?us-ascii?Q?nur9NRgEfPxMGqnoys2qMddEkOqOKXC3+lyJb6Qih0yp3zspBTJtucdxEIAq?=
 =?us-ascii?Q?eNkEugZfv9AsYJ4ojxVNhzJtDqTD03vyP8vzqsCWxg8MQweNyIX5RQtWjgAU?=
 =?us-ascii?Q?HY7lezbG7waGK5Ant2kvUKgzEzm1h0BQ5nITFddoHbsdMKuu5yQEcpnYzJsj?=
 =?us-ascii?Q?+weWocRa1zgXa0vkA/CKntVikgnBFHWMmrJXZlaoKOTYh7X8xoEqiMhNYEkW?=
 =?us-ascii?Q?hsmQ/GStfmjIwStG0aD4MoFQ6Hu/ple5ZjNNiAaPKyTvrieG+eWYP5Eex6bG?=
 =?us-ascii?Q?lY2NyJFI566YL4c6Er24ZUTfGl82yowXTT4dcCP83wyICNg+qxA4x5C+irqw?=
 =?us-ascii?Q?Lnxa4F9ZZHWb6uEIQTGr6fLMaepVQYoUA0Rg21WTcGWJjsVhPGuq99zTxBxX?=
 =?us-ascii?Q?BHKbX1Hz55WotwKbVWCzeEK7njhccNiXeNgwRjF0hCXh8hPJz95MMzg24Sj0?=
 =?us-ascii?Q?yXGj2O9Z6++8wXq7JqS3hA60K06FakG9FsiWAc9ZJ9zLyEMzb4PgVLmI4cqt?=
 =?us-ascii?Q?cBSbNe7DK9x23sdU7iQcKqJd10qH/ckyWCGXjMBhonobsSYjsUIsjdQi9V8h?=
 =?us-ascii?Q?KILNjyXqizD0ECf8P9D6gug51B1rM7g18oD/qGvjwNZ6Cq7IzxfjFiKOdwgX?=
 =?us-ascii?Q?POf9026OpFFiRbrOq99wWEpb0jOD72MXzVh0GvGjSgnfx5GUlgr2X3r0N4D8?=
 =?us-ascii?Q?otPFS8LzXfdXLmoIDKSXcC6+qZNVfsE/lw8D0N47rusTYhlNHhQpTvawDedp?=
 =?us-ascii?Q?aNDdtELylxd7Bs0FHUHNFgDXEB+gHxTDL4DpuXoKuiPwrPG9sMCKIrAms31V?=
 =?us-ascii?Q?a31Bp4++WmjwgNeDBp1clcatRmMnZ8p76hL491wXxLIFQ5VhVFPrkiNqD5R1?=
 =?us-ascii?Q?O6X/Fz2RJ5NBxSZ4HaZk35LevNxrNdVzEZrMHaxUhvq08lD1OgtBrfLLfSqs?=
 =?us-ascii?Q?fTNMJUdwQo7H0lwODoBSjgz7d7AlFPsQ3Jw85tTwBcHCoL7xQ7LwReKQeV+j?=
 =?us-ascii?Q?7Ai860/954D4JgCoiB58nfjjGk7phDPQL5x0I2X7r6PdWLoNfUSbR6NAWxAL?=
 =?us-ascii?Q?574GQGS0rhxapGYBk2UI8Y6kgzrYWZrn1M9uBQPMeGywo3jZQEqVpRwZ35Ax?=
 =?us-ascii?Q?FaP6Zzr6jGalo/KsrSARUrAA3MXTmxCt6yvTRxsZqpi8qlIl6MwR+ieqQfYq?=
 =?us-ascii?Q?Z5aP50bbaUmfD1f5sXGh2/sMcFns2zc+MrdyiYAFK/bqQoSLKQL2qPZ4UINn?=
 =?us-ascii?Q?n8D3xs/o8Io8uEYR6hDrRokoWdG8tza5C9BSGHFi/mrrjEbisiSPjx8qHIY9?=
 =?us-ascii?Q?ghMNf2kXbUumkptFBlcWdqCZWCweUP2GIfuil7wiFXKaCxgSTN/dSkid2EoI?=
 =?us-ascii?Q?8OS725a0hk0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+UeJhimeVT+ge7yg/mOdFy1bQ+SV5jCVolUO0nPvUUWuDFD7FcLTsv944Xq?=
 =?us-ascii?Q?XlWVhrpETEMlaDkgCap+rGan/1e59zfEGnWGNCz8LuipBFqHPy9VaTroBqn+?=
 =?us-ascii?Q?oHVJnRbXtIfL5BLeFCFcv7irjQIvT0Boe7TBiX5FQs1vh47OMr41Hnzh6hXj?=
 =?us-ascii?Q?zYitvoy1Re+oRVk996LRiZnEUOz/MwjShYC5MM2AnlGO8cccpb4eUTloYJM6?=
 =?us-ascii?Q?3UstPcQgQ012EwZzPvbtLHYwkim2qboT/zUagTr3up5BEQhCiQvMJYDNTHEl?=
 =?us-ascii?Q?Up5MsDuZYlPPMPrAD9KnDPo7p7bK6I6VEhvcheRjbnZdWtm2AREzUjOGk8cS?=
 =?us-ascii?Q?GoZM0pxiEz0S7HDW60nH1KD0K6dNxRFaqpqpKDoe9IJAkIf/vogG9Wl/XRRz?=
 =?us-ascii?Q?pdjrsedWCG3uIAp1+vcIbUlk8dpg9kaLTnCysMj7vIjHrcxccxJhEqjrYYIc?=
 =?us-ascii?Q?xakJ1yLhPVNTwApgVTwXEOtYer2vFSqSVW2CUcfqz7MAghiGaNmEdlpnHKW3?=
 =?us-ascii?Q?lnPZQCHCEQQC6hUB8B3XaoFYQnmgfulBIbT6mBRwx3ynm4r0UQlr4V3c6sOU?=
 =?us-ascii?Q?bighPHtZ38kaVI1J8QeGWx9YWhqqAWH+SJgoJ3AUu7JIQbTbr2GMRqEVQ3TC?=
 =?us-ascii?Q?hoFKYVOmxRsO+A/o4z/peg2zl3plBKeopeSRgLIuZfL/uaU/vuUfiQpnbWfT?=
 =?us-ascii?Q?TveZ5fHB3hsLVgjsBIRSZfaNlx2NxiDXEVlRh7ztYBY93hH+2fIWB/4AalvN?=
 =?us-ascii?Q?cLj1F0L+aXaABFuzLNbko49+Ep71nGZVTTIrieQZV+wxKvCVR/fV+ErtQvMg?=
 =?us-ascii?Q?6lxFAFucDbWuK++5dRpdZxeIgvXtZJ7PPPe2cyO4VVccNa24SpptEAO0s70F?=
 =?us-ascii?Q?A+wV6pZuw/EdZ8eArsxraKrRCn6FsJmBlsu/gFZ04a7vyOdkVhMnDFA3ZVh1?=
 =?us-ascii?Q?KVAlvBn8n/fR6XBErKpJZLnXVy61+7IeNYkVSuYM5+zw+/BdG/Adn8kHY6n8?=
 =?us-ascii?Q?eZRxkyNaFRukXmEx3H4tb4PbISbH/ExvMZKzcS7VTReZZv3FB1UsYIoamGG9?=
 =?us-ascii?Q?wRcQ3vhIm+3ak7mUjm5/ZWPpjGMGy91VmQebU5qwpFdIXAnco4lZRW3/ZENC?=
 =?us-ascii?Q?/269pvo6nJGBPpONwkIenjgUkT/zaLx2sib0ZKYwH3q+2OsdaixSm+U8YXxt?=
 =?us-ascii?Q?re/g5IaaPejp5i52RCJXI9L7s7MHvgUK3kd/5o31DgGPi7kgDu4TVpL5yT17?=
 =?us-ascii?Q?GlvUVuUm46rC1R+A98a8JOh04GPWhrq6apb8CJBT3yqiyQm5rIlduVM/v+oH?=
 =?us-ascii?Q?NExqL9dutj/7VHLd0VXUnXYYRoAPFIJQimPU6v8ynvxx65CS1jmKUCsbDkF+?=
 =?us-ascii?Q?zJ1krLRtuZkY5WjLQeI9R/mnPIz0c2nnEMWLUZwytlVfbqExY5Zhn5tAq+tL?=
 =?us-ascii?Q?K4/4FXCxKOJg510sJdaYKace8SQYma0hEa37UL9nLMxKvK+X61UfgPgIS0P6?=
 =?us-ascii?Q?AYY8L6s6e0CS93Dtx2/RaQrb4p2IGYMqZMiMXQztRVwgCyLg8cVfP+Snqu6Q?=
 =?us-ascii?Q?NgXk8LknW5gfM4k6lkIOywnzjpsgz3YCbobZkXLxa2elTeNLVrOywaz4amt1?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IKKSsyMnHWBRWyb/WUzihe9DHSHGeBFjrrEWuc1sbd4JMeaekbz4vVWS/aJxLwmxb5TsHYPwqOzgX+xbwlxPm9KhXhQXcvcv+1s5ZsqmIIgUMxxh1ofYmereCuod8M3tdCQf8Fm1Lsn6PRy0jV6eUtT0GtUoaxyrxWEcs0K68aL3GWjrNLzfWtiVNUjIfgRux5prsWSDSBEjpwZlWOIXVPuAcBcteW0mf9s1dJD7eSf3Sc2IROBte6q0+HaeIKdgsYs9FbKQcv/sA/ZiS/5maZWXExgeQGN1EXWgnslkboCOAr3bMnpIx2txeveV9ENWvkjQ+ojrsmQyGjLQidqJtQhn6ifVttKlHIL0VS6JroC4FwRm2c8HyqeTkdmB9qSKlmcRJOzRDEeuCmp+PQ+Fk4d1dX61qinAk1kwyLMAM7yfw4Zj6dQjQ76pOtUnf7B9M5/KR06/1bQg3zJtzD+qE5+aDP1N/NB0jnjpTNgNfJVft5hhKKxHyD3Y4FK1vsAc8UBxVHMM404gzLPpPa4yTpdRyYSIm0edocLhUy2xGto6uPE6zPaJ3W/rcaRg4CxDkpOGSLghyoirqw+g3jBSmfP3dc1mi7EsEu/Fcwa3w5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ddacc0-39a5-40cd-f672-08ddcbaaa649
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 18:39:55.2702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cY1mVU1nqtaBKFs01ypjMppph2eZgYi9xv+CJRqrWaNbfC+XQbtfPqGLpTjMgVTg1Rsj5qtfRH/Wkp/A8rtXQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4593
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=967 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE2MCBTYWx0ZWRfX+kmsJFd2fCuf
 vIIWHVccR8pIuFYgSSuWghM7SdJnIx+OCovikqt021JcPDXSYyFzxO5MDFRaVfhKSUraFqMG/+X
 DWGCV5INxZoMjkrQANhDQZAMY2h+MCieL1hpDOX4r7yXgOpmyrolHcg0rPFyPyUAWBaEHYJB6T9
 47dmVzOeqYO6WeX6wGrIPBQYnlRFPHTAkoUng7O0MPUw0JmhxbdCbBgyLGcrOucYKL85t8lJ9uF
 52pDc6XKkiSXnIFQ6eRaD5evJelVYNTFlo+2/pQCZBzXrGojAnA6SeUoULmTRG1yzcmCe60owBR
 z28kN8ukO4sOSABI5dD9nBeg8cJXt+we3cP4v05budb1L46nrJh58twnq/9gGO2fXEPfanlIzMl
 5xLaCTsGa6/sgX1YdSSBefd2zmW9fUTBk25R8d4yCMxhCm5G7GivZuE3rtHguvBPMp1RRM8o
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=6883cf8d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=CuelDG_OGeiJGSSr:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=dDoSw-WPTFuNCd6e4W8A:9
X-Proofpoint-ORIG-GUID: Uo3tnU2MPg78xfIPU8GEvolcvjNxC8RD
X-Proofpoint-GUID: Uo3tnU2MPg78xfIPU8GEvolcvjNxC8RD

On 25 Jul 2025, Kris Van Hees verbalised:

> When a lot of probes are being probed, keeping all DIFO around consumes
> a lot of memory.  Once the BPF program is loaded, the DIFO can be freed.

DIFO? BPFO, surely :)

... the attached patch only seems to free anything new on failure, not
on after-loading.

> +fail:
> +	dt_difo_free(dtp, prp->difo);
> +	prp->difo = NULL;
> +	return -1;
[...]
> +fail:
> +	dt_difo_free(dtp, prp->difo);
> +	prp->difo = NULL;
> +	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
