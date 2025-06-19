Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1762229B29
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337572; cv=fail; b=gFxFxcQ7574eTnnuGlVDOo+xVyNIKwvBEb5WLrAzzcaUlAExA+PqK5tnOqBTvBxYQGO4g+9lDfGps0LcwUAgt0gvvvrPfpplHHFzyJjPONRafi4x3uODoYWQ3GWCNjI5/UfUWwajBzW2TEDRNOOTGslYR4egrNTX8cFyil4f5VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337572; c=relaxed/simple;
	bh=KV0uwe5myKyeOwsmp91TTmcx9azuOh4AcMSfqmwaBtM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CBtTof2VvEeovgn6jNEeKiuPI2dEjuJqsH91aexGFaADp5DrJ6q9aaoTrvll9/4UdxiKOmSvWwrCYcgvod1mmDTO4XlA6/ncaCFdTbZo9Y6gMpJvn4X9CFUvE781RUjL+tudy3XcgOolbZMEGit3wl59ZSEMuXJx2vYgmONnD80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o4F+fflG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oJQkIeqE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o4F+fflG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oJQkIeqE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fnE1027951
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KV0uwe5myKyeOwsmp9
	1TTmcx9azuOh4AcMSfqmwaBtM=; b=o4F+fflGO2jsDV3aHh9qL5Tr1G457cSPBL
	KuCaCiMzV8XWHgX+0V+RXqG6BORAXktTLhfRftvq/R1P+tfhU5/vdWIX7eiuuzx1
	a2WtiOlHyHKOW8UR3E544ZtVMj9vECYYwieG/1iSBNG4AnTfssjzwzVzXfr4/K3s
	JYNhGW7w+kOMcsio3kbwa02BTZDofBS0u3G1TnAncKvha4s2X3N+M6LRdNIbY7MY
	7qhM1SjYhIWWti3ij3Dp2LNuFSRq79uSo+bUwSFrT9OWEMMZ14P+p3CkAnAAuG7j
	k2Xi0Kt0J2e+j86hvYJ64rdEM+wjbsO6UiNcz9ZLIeUFRXHTXwdg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd9trr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:52:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1GkS022847
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:52:48 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj4uc7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7UpdPNaaxyW5PwWDSVP9+m/lrkWREr5+qfBHnC+ID6yzblv2WubrDJYZil4/c67uNR//4olpv39jts46HN+aqtUegDoecbsqdmqb/GcJvCW4MNIQVz9wqYle6jeCGrLrxoFuDYEFgeCYq13J6aXUl1m6XsfHSqsJiPjqtopXbdYcWTwvs1MnsA7llBUPftgmetqVPRu03dr3yqA5yXz/3C2xs5EtJtvIp54/9tmc0Zt3LRn8a0mQ8lo9y2UlzyxCpTC4OTmxFjR8cfUi4cJEmD1vqMYtrD/R433yOLEkidt1kwYfvemDY6uGImQdAWq1lYweQH5OgjPRcACIqphGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV0uwe5myKyeOwsmp91TTmcx9azuOh4AcMSfqmwaBtM=;
 b=IrHnRF1aeB4e2A6yfBujq3BvkLU6MTla3X3Ac6MTTyN7dMJGHa4GAt4mQSnwMHuUXkJ5zOyz/FOkr04WpBNi+VXKWT5e8goK59u0I+c8AMjrT7ZAnZxg7R3B5+xZyzBNXMbtu8Tz+ONFof9bkg6WVMezUsc5sW/KzzuB5acA/mNOokISfMCgRtDXSFRmven99RE82a8JHBkCD0A9DAvfe0sUd8cUXn1jFrUds37XwstCYt0Hbwi+p5c4VRhRjVKPH94Rn1KiwRG2/QIOwswW0MvMO8cktb/q3BCsazctRDrigDZcwOV7lCPIVVWhZqz1WHAi95ZOuVc2S8sRYTiukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV0uwe5myKyeOwsmp91TTmcx9azuOh4AcMSfqmwaBtM=;
 b=oJQkIeqEV7SaZAJzO+HBr51U5HEs0YgDgzb0sEqZDI/x0jBM9H20orkrnq/X9wauNnL0p67JX1jOVbTBhtdz3kduh/kImPmtUw3fLqSnlpFSNMvn0ypPIQD5f1vvBMuRTDMtHvIer3cPe2KwLYx6AQwP8cV2AMj7LEod4mXG0PE=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by CH0PR10MB5065.namprd10.prod.outlook.com (2603:10b6:610:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 19 Jun
 2025 12:52:44 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 12:52:44 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 11/14] Test: caller and stackdepth tests for proc provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-11-eugene.loh@oracle.com>
	<87ikkzbsmb.fsf@esperi.org.uk>
	<4e0a07a6-04a0-3d60-af59-ba32a41a03f6@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Thu, 19 Jun 2025 13:52:40 +0100
In-Reply-To: <4e0a07a6-04a0-3d60-af59-ba32a41a03f6@oracle.com> (Eugene Loh's
	message of "Sun, 15 Jun 2025 13:50:02 -0400")
Message-ID: <87plezzyef.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0558.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|CH0PR10MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 401b343c-8788-4180-c606-08ddaf302f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bz1ehrb5CbbGC2h1GN4x3kcOKyFo5VGi6peX6gIYTmhQfXwpKb2ELsv6VZdV?=
 =?us-ascii?Q?Q6dNBVb4xMMlWXBvlWa9+gWm44Yebhr4d2jgebVvg8gdhga7StshBq4UD7d7?=
 =?us-ascii?Q?KY0j36B4XBo8YGipMeRpQljgC/pIGzmt1H4vFVk2Y5WCNxFz0lQCe5o4f1gW?=
 =?us-ascii?Q?sqV3mkdlop88OTmjzbC2uv/s/hdYBSzYnlFGgCTgWL6j8+Vci6pDX8x0kRpc?=
 =?us-ascii?Q?dQqjVQGbZubcCpNgYBT/nqnBurXpBE9WDw0LZzXeeHVxaDE0YYmmslivsFmx?=
 =?us-ascii?Q?wM1klhbb8BWOFb+k7SC+61P1FXrvj7vDttW5fDc+mXxQ+wCmWYZC13Hhr99K?=
 =?us-ascii?Q?lBCyM5ww3MyEeHwf7Qn+6YVASotzTBu4nX8lX0bRc4qfy3Y/zE0+gLfHJVbj?=
 =?us-ascii?Q?KH5kacRgWeLlWA+m8KkS1N6VXo/RyTlt3/P/8gZ5D9RgyxgCPrgIluo7V7oS?=
 =?us-ascii?Q?Sq+QoutFJxsS8n87TC/NwR37XCsQ0qlwq5IMYqICCzoMmvbAM99crQs46lzS?=
 =?us-ascii?Q?qZsQDdpSateO80mW6LYIN6/WmYmRNRHvqQDY/H6cb9kADv18E3PfAt3YXlZe?=
 =?us-ascii?Q?cEKjCtv/AW30akq8z2SkE24ETVKWQP162qH+TjZ3fUpeLQScxs3fN3tB2ZRS?=
 =?us-ascii?Q?LIJDubKqAMexYgvpkguayyqo96pWma7H2zLx0Elv2aKPAdw3kCoXDzDraUhz?=
 =?us-ascii?Q?Mr1CeKoLs6zHHPo5eZghG+PIsS+1GJEOk+YjYDqyeM0Y7R8GnF9EP4m/rxaD?=
 =?us-ascii?Q?IXDMYjxhVKV3JOkrcp3OspgnWc4pRuvyJSH91weQWxOiMrxjQkukGB/xp05S?=
 =?us-ascii?Q?8JA4BHtuUbUVGSAsqWdJEqDUorQayTh3ogHfvWa2ugl9URe9EYBVHnDMlmOy?=
 =?us-ascii?Q?rYR55r/YPwYKtSk4511V9CGWz1GOB5KtueB3NEykMEt1KeTxWjv6gbrSXQ3e?=
 =?us-ascii?Q?Z0T3/sr+iiJKRTQaAheaC3Ff7472FUszIgMrf/vxQ6QL7OK23QZk1hfwyRLW?=
 =?us-ascii?Q?4j6c+KJYsQucSQ5qYHPpOyyXSczCLVAyfDoilsQEENupmIHQ6UyM7DrOwLSH?=
 =?us-ascii?Q?az8nviGtpALOyoXKp0IVZmu/6C+jmmSE8DCweIA7ww9iizMWY7dWWuBdl7C3?=
 =?us-ascii?Q?KixqO7GiMxXTnuBEi928h8iIGm7obKryrIcpTAipRCxX8it+bsvHnElcGHN0?=
 =?us-ascii?Q?M68mpf7egMML1J7DkHEBtWfQwBpNZT9vLWVHyiBNisQ80JzCbxkLe4vH4UQX?=
 =?us-ascii?Q?7enIqtWWzjMKcqNdUbBIuY+16FHB5lblAsajTuQYGX9ysRPEVfW7enJkCZbe?=
 =?us-ascii?Q?pjx1ZVo0iptWnb2GscWJnv+5SRPQknF764GhoIy6z/RJV9TDHjYrwnXdOvgQ?=
 =?us-ascii?Q?bt5mH2BDrZphZ/TLBLhuphB6V8Fz3Kj00ch9m8JHIDts0Cuhm6vnPLkJmoI0?=
 =?us-ascii?Q?XpJKd5H/mbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvoOhREb0ghUQ2KVBBCA19Bim1ByiA7hBGoWyrONxJnpoCSysZTSr4uQu+Si?=
 =?us-ascii?Q?PGxvcwWqjIa2JFtyCuqu3tYLtKsMd/KYyRqqwojEfEFCAsuOGMck7NgGAOUQ?=
 =?us-ascii?Q?xfuz6/yBKWhziC4J6wym2dal/EvFcNqVI2Kif3U0XHMogX6aeRvbeLpKp2IP?=
 =?us-ascii?Q?Y/Y5g/uFQaWrEvgO5dXJ9ZdEAoW5o4cAM3fV0h/vaYS+9RdxzUVyl310P/37?=
 =?us-ascii?Q?j/+wiQurLci8G0tzXMm5vsE+pO7OmlJTk3mE5/6Wiem4EbggQ2pcUuS8y21V?=
 =?us-ascii?Q?donpIDZP4mj21hN98WZm97wbOjqyBnjy7qWS1qGYmB4jLXUUhSWFprOpL0o9?=
 =?us-ascii?Q?ojajm4JTWmqsP8YZXirMEnj4dG0dwGUsiHueFmdpdjD4/6eIeni0m1n593ed?=
 =?us-ascii?Q?ggLCDv23YugPwbgZsTFF7vLRLRe41GJWbRnVioDTX5YDUuyz5r4zBmVtqrxm?=
 =?us-ascii?Q?VXkZkV5/fl+ck7DW4i+DlOJHTw5PIgQHr45fSyAFN3e/VdZDJ4Qj/zyBS+/o?=
 =?us-ascii?Q?rFlpLMPYJb8fDf81I1+o2mFDAJkQSFpWUW6LRl5WuEOL+hjQ3Un7IMUBge1c?=
 =?us-ascii?Q?o4BtyoL5SCwmJ0fHsKjWWqwnaV9oPM2ejl2C/vzQJI5tlbMT8MFKe8rPxy+O?=
 =?us-ascii?Q?mqtoBKfPcyhMRZURbsWhZ+zrBi9OL8QXEeR4G0WhkESHGtCfe88+bM5pJqMZ?=
 =?us-ascii?Q?kMStAW7I8jH3XlHJ01QVPzEqIhlH2A5AYCfhfREcVfpbsZNLGSsb6VMMn8e6?=
 =?us-ascii?Q?o7dOzw+kwyU57VhPMNN/LyLDgzFjKRSZKgBy1E1S5Mu2hMH9jHutHPEj8vSx?=
 =?us-ascii?Q?C5cCV5UMkL855bFKZgK8a15AGSUT32sUxPPsA2BABj7UCeroh9Yry3X1K455?=
 =?us-ascii?Q?pCrdlIZpPWQ2Xv3YhlhrVB9JnrGlbC97qugMxXecZSpJBzFMKn7poSa2RQF/?=
 =?us-ascii?Q?zsNO9OPENcrM0CR7LogDRmdHRn3aj14WYv+Ttq/+PHXrO3hZ7VjxEdA3TK6C?=
 =?us-ascii?Q?VFgz6X9J7ZZk93Owmt2PMkGObdCFWKpBjFmaFj8OPil9wKhj5ENi/JN0At+g?=
 =?us-ascii?Q?6jtt+iA3VU0RG6ePtDN7rhbaKQAi5gfK/lbGKog3QdC/LVdmu4c0BiOvU1wH?=
 =?us-ascii?Q?/8/bLYGP6LG9JQSHzTeK3j+B7HwHMDtOH46sgy/lnLJnwscGSDEf/04wjAmV?=
 =?us-ascii?Q?uEffd6qFtCvatmpKOtyexuSDHHMUmsR0RGYQiG5G4cErA0FoceLyko7/jkdn?=
 =?us-ascii?Q?zl3L6FE9a4j0WWeKob9aJ7rWeTq8IFdSK88r55W40x+yMZzfjdB4GZ3LU7wf?=
 =?us-ascii?Q?Rq6EDtMLkiR10F3RPHk6at/viZ1fnOMdiJ8M27Qe4Gby2Mnp1UbZ6DbHEqlf?=
 =?us-ascii?Q?MJ5IsXTj4nIUZ5UwmgI85zxtRA2R89Ztyg5GnATbF/1iKheR8A6VyVAppi3z?=
 =?us-ascii?Q?yg/NoKtkeC5aBy3z4GuMTZ2/T7mdUZ83WSg9Gg26vTx3SYdM+eDR/YThya9T?=
 =?us-ascii?Q?MclS+3pZPv6NsrxbN4it0rSU1RU3I9qYCMH1GKkIgO40ZhmISGeKXThZhYNX?=
 =?us-ascii?Q?3FuRGpxSc+xqhjFyCLzgBjJflW421Ha/FKZ33m14AbhRFleoYcnAniZblZi3?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	arFWRZU8Rq+vMFBWk7za9mXOlVj+hiwCRjvDE+KrisB1nnWDvVo3HBdZZ7vCxEVcrNfn/9xCWAVImuZlp9vVmExqrWJ+jJ8t0b6qhwivwvHd5jvjnsKNDw5lj5vuVWLskyUs7SkJs+myJWsbVBXmwJbE7pXKKCkJVA21teCc63ggQID+Z0CmBNPaBV/uLpOilJJckoyvLIsnVM/b8DNCaCMgH7QkT14FvWfv1Qrhofwn/WMkpUAbrkI0PeKxNzioNVFQ5ly2fepfVMKTudiSTmhncSgRTksf8giA/fcQFVEDQ1fjrwhXZ/lXt8JqPeAaP8RDJ3fBGsxDjNPdo+IzlMecgyXTRN/KvR9opujRqw1jkRh7Ui0Al2g054gGHLZJ0nNgKZ47TQpUszsILJJtMouqd//2lsabAv/lCn9mjOos+KF7dlQ4GPMSpzv5CRGz9KtZU4g1p+eVBUk7mWVXSVIXgEOuonyeKk9LquMGaPP0KwBbvBU5zcl23/e0TJ/EW6t1k+VoBRLn0wlWw0/Opa+olboURjGa09/zNZQTRZUunwO62+WBLLncLD+oC0TqpCmQRj3loetxrL0Cb9q7P368jvGcRUqox4AcU+RW8mU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401b343c-8788-4180-c606-08ddaf302f0c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:52:44.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61IVDagtLtlRo2EX1/rGjP4yfLXONyY9rbbA3Kyj3Z8QckNBFrHEEpgroeW2F/fyQtnrzi/DNU6s0QFY2cqmPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5065
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190107
X-Proofpoint-GUID: rA8dJiQ7ODh-22YXSvcRcFqWLCpjzkcD
X-Proofpoint-ORIG-GUID: rA8dJiQ7ODh-22YXSvcRcFqWLCpjzkcD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNyBTYWx0ZWRfX/R8u6BraXIuN T1pzOj8pV82q2IyMqnvtX+B3jNY6GtWnaUh4sVn+nm8DYjNVF/KklyxMJ6K+DvWLkpPvmJ0LLlE Pem7EW9+FcMSH0rC4ZKHQNASNYjnSbIbryagf8FHPHxz4Jt+T+hbhX8TRdfsxg9UU/KoS8wJlkU
 BtmDLOMVzvCfOjs2FB+HPcoSKM9NC4+Jk7WaMIIgT5xsdy/z5tVRt2M96P4otR5X3/kKrTx9M0b 9tupbrc+gqP4vo+nS7l1DwXO9cEjyVb7YLTxI4lOwXpX0BOyPLZvIh0TWjkWYnz6HfCBnwqp6Vc 51LSzMEbpLwx1DMCYbbq5207P+TjDLNXIHz5uchrbpj8ndGSOn43tfkWZ+TH2I6mwLpwr6mfwCQ
 9fmSRw9VWivTlUQwbo2HeYboXQqSFKrXg5sPvFrDwlahRm6b46SqEdhSdKtKWK3n03rFpt8N
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68540821 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=_ffvVaB7IdcJOUZvbi4A:9 cc=ntf awl=host:13207

On 15 Jun 2025, Eugene Loh stated:

> Thanks.
>
> I'm getting to these out of order, but I figured I'd mention that I'm going to turn the capitalized "Test:" into "test:" for this
> series of patches to conform to the style in related patches.

Makes sense! I totally failed to notice that.
