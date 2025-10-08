Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F91D95A3
	for <dtrace@lists.linux.dev>; Wed,  8 Oct 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922211; cv=fail; b=GLWUXW2G2WHxGkVG7CR5scWFavaPCDEpwjhtpXBJYLUg4uFGJRsrWTXH65cTnvInPr8/+drIe+LW2vks+rjQqiYc3rsjy6Sc3BDEjRf8sWw4KPJPpS9qvEM3M8pyP6BiVQyzJRB27okZev2Sg8pSUyEi6Zw9lm3NwZ5HvsSfLMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922211; c=relaxed/simple;
	bh=3NJX9Rg5Db0HKVak27Je9fWwjmkbkPM9J5t2pF+syTU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aotNJ7i+oASzgSQHd3+FfXISayprJ3XXLiVDIxmv4dN4LwME0P1u9P8MRyhMYjsKJla1rydeZkUGgqAZ34OgvCHbGhuT5RymYLeC9MnI7KCfNm47S7kb7qwWUFOd20d3HcJAqca8EXAxcH1vNOuHEUAruLASfnDLJdtE/eaF3Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UFiT69rE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YwKBoQdZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UFiT69rE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YwKBoQdZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59898Ilc010462
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 11:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UY8LburV1KK3S0pCec8d/W7q/LzFdhCH2cri7qYbAMs=; b=
	UFiT69rE/Wb4Hq7fh1PShRr41xELs2SJA3rIvsiZaW7LhM2bYQfwSbS0eNDbhJuU
	Rr9i1YrO3FWHPT8R6X+iKczzBZZPnwtWVvJ81a8B8VHg4bztfVOTuGZPOpCqPamz
	ueLB+k1v/yEljhUbvoP+7O6hIUkCrjLnDyst3i8oaoJfHsMeAkWThAPKpLTkYI03
	sNsMroqtgOWQPCud8T3kiZuJl391WPntGKHlou1k7naPqLwA3qzpoyKjKPRFR7G8
	TH3aqfbGWsBv6WHIuykK4ZjdYSKB3FQj+WBoqqiIsODAftjd8t4/mffCDWZWmLhx
	QAszyjpRD7v1J71xujXJmw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nmdu08j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 11:16:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 598A97Ab001774
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 11:16:48 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt19qj49-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 11:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xr96dIixclD0PxGZD+LJx3iEioqo8tUgu+ZYaf7p4cjZ79zoMv3Ottue39MgMy9LYb3AwxdDe/DqKymlxgpKNVe06HotssEuG+TY3SzY5zd59Mz8xNOToJNsIM2m2Fl7V04EbsY8sm7BV6aMUPHPQ5GINwGa5VW3ws6nBnLc3O6A479d8xvolcjhgaq3t20C44qpUjKH3n5XvLJt+KRZUwwzK/bylkabMSmdMa8GylYocY1NsNTMIzrs74NlSvA8pmVEwchTIrFR6t6ZVsgfmfCmU0wxNPtFNhxc1C44A1bjt1mkMYb7xpWNGyp0oY63MAlfaycdnXRYt89uIKlm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY8LburV1KK3S0pCec8d/W7q/LzFdhCH2cri7qYbAMs=;
 b=KyJfRwKb0bw+HL5DBG/MBJx/yxVxHZ9zTQY/z9iQPoo4BujpdSSF7yZHgI4zW6SuvG+UzDnLK6HxxNhgg05/f19/dPKm7Nq+hU9uBVFAvZu77sW84s0aDA6mUs8qM2a60xtakhXgeTEqqUsReXMNfq5DB2+ii3hv5ynHvL5NkLmwUs1KMTbm7Sk8IgmZPcwkGQ2yCa0guegTzoE4sWvs3eTxR/q7X3abLyhLqiT/fugpYh28o0cGEJzU7DcBMxWiWxnDFkFKedg+gOdWlPFOS7ot9cT63RVswa+uPwHZZN7UKbn7adR0p+lk5tNvypeN+AkY+7oflN/ZIS+xdDDtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY8LburV1KK3S0pCec8d/W7q/LzFdhCH2cri7qYbAMs=;
 b=YwKBoQdZdT8X59kJPX6CzWV/ftTnH0qKHFXtlMcpohzlAeW+RjPuQNQ3keJe2F5iaxycaBpmEwepxEGCCjHVmu6Dg4himCP8U7QnlVAIbE/pCRpwYqp56hn/d7O9Nf7zwMTPdc2pGg9jZJDb0OXBpRaKvhacXFE6Tu+F9zOjFHU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DS0PR10MB6823.namprd10.prod.outlook.com
 (2603:10b6:8:11e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 11:16:45 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Wed, 8 Oct 2025
 11:16:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/5] test: fbt return0: work on quiet systems
Date: Wed,  8 Oct 2025 12:16:42 +0100
Message-ID: <20251008111642.422592-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <aOPpuSFUk1GWVokj@oracle.com>
References: <aOPpuSFUk1GWVokj@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::25) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DS0PR10MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 44777a33-6784-4307-0a53-08de065c2a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aVbzvzhkx+1OrlNghTVxfD3k85/uZtb+Qx7ABdTUkeLkciWP4RYEcKbjQNPa?=
 =?us-ascii?Q?JE4sMnkr8io3oolIp6EagV576cGmXV23PE/GxGAF/bQ+ftrHrsUNx6K9VKRC?=
 =?us-ascii?Q?n4OcaDiW+u4qpbZ/9Mzs3Di3LWMQPvvaERPlsNhnTpcssjg8Xd887nRZTgWs?=
 =?us-ascii?Q?DYny2jkAJs5fGAJFFRbk51+4/+7Iyg6BNT3jEvV1kICCDomvx/gUxtBdo+6g?=
 =?us-ascii?Q?S4sLmrmiGm3ofPXMl0CX/1Ozc2mCfrPyYSkYAoEtHjlt99AAOqKNgi17zwsv?=
 =?us-ascii?Q?yXoZbI5j3EAXaEa5hj1Kki5767bNilyX0f2yEK9oI3jsupm+5PE4IZdIiVB2?=
 =?us-ascii?Q?K7KGisrehs4DSPgpdNIPKPuoXNAEpt+eiAiNWpDqkDZHszZOvTDN+ETicwTq?=
 =?us-ascii?Q?XhvXHjT5h5Hd7hxh+8S1bxoFxWeNgMHOt1J6QJdjsr0H4owLx4aps9UBU3LN?=
 =?us-ascii?Q?DhYR77vyRXsUzh1Xtk67p3sjDQFtG222Dv3PfHPGr632gLowo1SLLqusWWi8?=
 =?us-ascii?Q?A8eFXH5ge8T/n6RStvN1l+yvoBa+hXorR0vMvQbCx9XeOlaBpSuGujssua8x?=
 =?us-ascii?Q?/hLuYhO5GTYEF2qBhn+Qaw7bzDiXUwBGDlh2cspFSr2PBETyCJoarIcEZzEp?=
 =?us-ascii?Q?75G/8xB8XfMkdUjnVE8by3zoOTYHs9jJe5LbbtYiVkQd7kO9kC+Yagd6W1Qe?=
 =?us-ascii?Q?2dmXDgzLVp34xb35u8XQJHTOUoOjTHrPp9v9+mIKGurt4IvEx4HDZRuE3NAX?=
 =?us-ascii?Q?XBsi/ajgT8nFd9Vq/OA5OZJuuuTVgLjjKAbe1ZEdBij9RawJCjDLVA7q+srL?=
 =?us-ascii?Q?Fv+tvRbbbaAdMWw0WTjwY/lFVxF5LxS5v+xP12UI/+7sBK5+A033loVn0bDd?=
 =?us-ascii?Q?CoDMI09OZBL9vtITtou7NvCQlegjYnVsj/Im3PqIm+QpGP8rIte3zljukVmE?=
 =?us-ascii?Q?AkKC1bY09UNoSPzgiGFEoL3J+/MglhpoXIzof+J3GMMOR2qVMmY9PkxSorZL?=
 =?us-ascii?Q?DSaqbjBjbQyGuPHr7ZY51B4f4Mzqm41spicNChrd/9KbB+fHZriTDZaPCxoG?=
 =?us-ascii?Q?gaGs9c6SyWDosKXpxZfwEaKj/aD2E+i3mecTC0X2Le3cimWzcl/tbUhwGxgQ?=
 =?us-ascii?Q?XdKyLtGE20M1hmBxpwC4HpEn/hhTCW9mdsmmZDSSQgfu2kLH9vbveu2ZcBxp?=
 =?us-ascii?Q?xGOeg0CfxMkcQ3wtvYIJP9HlD61soOf4eVhhGWobyBgXuuDi3FLsETxILw0s?=
 =?us-ascii?Q?I8a+tngoMuskebPOy2h8gQlik6Siwda15CNICVJ2xCitDc9J0c41WHn8OKCw?=
 =?us-ascii?Q?YhiqBJdcrRk1T4TM0irsZM1H3B+QO3xoxoh7Id7ogL/7XPxkzKbhK+8S33ca?=
 =?us-ascii?Q?2Y61aaW8+FvfHecwpHnKkpJdjJ1fkYAggPhrOD83W1swaIQqU2ACzC3pcRF3?=
 =?us-ascii?Q?IMRO+iNzRrv827HWWr9lG+pGBKPWsyC0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bzcPJH3i5Xif+W6lhtMPPrQMTg/uRzWtjlZ1jhSxtg2VvSTFpNa9Y62uRbqC?=
 =?us-ascii?Q?B31j6iWULdFnqxWJyVof3oAN+niTyQq+aXAz5Yl5+owz2hDbqbJ1M5SB4swB?=
 =?us-ascii?Q?csmaPLN3vkFcOZUApcg2cfOMnCWtLtwdfDRiVIkanls8mXBH0Sj/v0UMVCu2?=
 =?us-ascii?Q?B1/2J86aJOA/pDEU9zH9btjMqL0mJSmpzy62tU2xy3JoBtUqBKNasXnpACMc?=
 =?us-ascii?Q?kD/vXXHQcc2/zMhHxoJ2HeOfqDB2kX20VRMgILHkXSSvPI0DTj4LnbSnENTf?=
 =?us-ascii?Q?FvlovhpSueglcvRophOkeauK8T4K/6/yOhHbHeuCs1+EMNM/YTrfxdWIkOZR?=
 =?us-ascii?Q?O6Zg/YTfNvm7oK5edFTNliViXYn+yqpxGCtHFbNf8uU+33amzcPaYyNBot7w?=
 =?us-ascii?Q?qePMG4b04cSNnjImS6Obm/8Mem/K4DUx6NAB8GceS1MRsC801oSlNm9Ref5X?=
 =?us-ascii?Q?evHS/z43dWtSbjzyXa9sSLNVbk4UCMXKsIJDYpfGME0bTenUlLhko3EC5otE?=
 =?us-ascii?Q?XcB/EhPHAh/8AgCZB4w1ZfgdFDsnlVHKeG8eP3O6PoYjbuBfNrr+xQlCvwOc?=
 =?us-ascii?Q?u9j4yGyFMJ+z7hIqLDPOVFbBC3/RBi67OJ/Lqq2SNjTVrxf9feU78wwFnKuw?=
 =?us-ascii?Q?T0gc8t/hTfwQMXB4dC2STkTIDlzhB2IQBhdnfiJRxVdpewBIpoKGw1vGvNai?=
 =?us-ascii?Q?iWDpp6ydu1KE/SnXP6CRmyzWRFqocdb3GckQ8AWmYIsjVQcBV2S9PL+LF90K?=
 =?us-ascii?Q?3w8+X+biC28AsQc+E/Vyda3xxwsISKwuiFBxreJCErNzOPVQ5d1voKqEWS6r?=
 =?us-ascii?Q?wXGmh2GaBQSGCRXwPEZ6ZlUK5v6Feiuv5lmLcEvSWhrOH/VVMLx1aGB/5dm/?=
 =?us-ascii?Q?endEjrP4XkRKSOSJsUV33naNiwNhNqgrEhSIbJBU2/vU2v+O1FnQwraqCdg1?=
 =?us-ascii?Q?zKgyrg9lepB81zlSTBuv6YTpApYf41363FJOCxLGDaZssg9NDmcQSYvNB6at?=
 =?us-ascii?Q?P8D/IZx1qH+c4upm/QzBCdJHMeGakX1wf+FxrAzHtYdtTOP9Ivy9hNi+tQPn?=
 =?us-ascii?Q?pI0bUiOHC0P0/fiOXuEKkVWv+oq9/evzwPzHlcsHlglyXNa6tihlUSVHQkHQ?=
 =?us-ascii?Q?XxhO68eDS7tMdrbyX7yZdQNWsIHCs2FAnksCOb0a4cvZ/Z4mmxswx761GSrl?=
 =?us-ascii?Q?a3D3T1B0AmJtk7cJjq/ZapIl/TntiXWMV7nR+wwKwMNG9O71vJ3qWtYMf+xb?=
 =?us-ascii?Q?UcsXwjwKU1B03oiDlpYDdu4cW0Qs9KB9NtH0xM80lBOXUmm64KZ/6Puk4PSP?=
 =?us-ascii?Q?5WCum1DroFtNozewSk4cYmxpEq8lqjYE1fi7m148YhC5NcOIS7Nd646uAzXx?=
 =?us-ascii?Q?7Nw8NQe8NFvB5jU0HOslan7wKgFZxWuielSjuDZgjYtL5yveasUBFqOc8P+X?=
 =?us-ascii?Q?Ej6XvFMR/2QObjs+cRH+8sf9bCJF4t76dZ3DwXLRW++K4IYYsYIcuvf9Y4LG?=
 =?us-ascii?Q?nj9IzlOtowwCtX5fF1sKPla08QbnSwGdPyv9UgBfyn6anvpZPNzohtK1U6D8?=
 =?us-ascii?Q?zZtpPBQlBej5DtrSKGOd3f+IYFPJw8M59WVFzfQCJyVt0a9zrqbjdEodHtnh?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HXOH3TMjGttlfYzwOACArOhQFkPrtjw/odGluHxs0J7bOARivvcqVb6PfT4Q5dfau2/CJlGDSTn2Uus6kcZEl+yLluqtdmcLW28dZVpP1g2cxFeeoPUHACDUI57CJY2ccT+v3FvzjRKHyxtcpCdy3I6wsDGfSiK22XrhHTbDO0cNbNW/d5xeDrcOAPaz9L+sLhXcK3ZYX9/IvMeRsa6d1zaq6OAPltURAiZoMRjnz+OB/M6DRBT/0vlCVTNm+ziCAUd2b/KXLc0MU5S3j85D67VeY/B9Qk9AT/66/A2cf/M9CvkM9Fz40Ve5I1a7aNjkbiViY8qDVdtr06bcPqgYZQt9FUIAGwo6zuUv80BLRIoIQF6pCjG2HNsK5p5SdiLz21fVlFJWfWaMotP1QouJ4l3dltcRyKjKstNg1kDVm6eIXUT0J3T1GAiXwt9iB8Hbp/7LYFVuBHM8yfapErj1eAXyf7SdxLNvxfeF13tZmyyBCp7XGN9OvzuTlyDRIE/N4eW1ojzGht/6mPqnmeDnu/XpGouppmYoHrt5dELUfqgHT25I6b/pSZmIlb9ZJf3abTedqA0OKlCyRyq+VBKJoGp7fueY2UUU5GVeILaISQg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44777a33-6784-4307-0a53-08de065c2a92
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 11:16:45.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVZZKffV+1NgT2jgBUvMEIwpf4+IYdwcVOsnLjVJSLfQUpGyNX037D26ywGgca8eHnfaBHgPanet5AIPgDClGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510080077
X-Proofpoint-ORIG-GUID: Yd8Hb_4JqqP9UFdliDxXATOoFMW45CoE
X-Proofpoint-GUID: Yd8Hb_4JqqP9UFdliDxXATOoFMW45CoE
X-Authority-Analysis: v=2.4 cv=X8Bf6WTe c=1 sm=1 tr=0 ts=68e64821 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tHz1UzMi2-AkDzQgga4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA1NiBTYWx0ZWRfX0yq7jlhk13mQ
 o/sU4AZeev1QXVZNoDqyGFx46kfStlKwIbIScvuBAyU55LEDA0N4x46loNlrNM6AS+k/wfw8vH6
 wnw9xgd8+DNmKo7Bm/DWNA0xDD1x7jDkQUvTJIVBhYmMWsajQHS7QEKdMmHvvN2mbNRAxCHa9ZS
 aWURqBYGXLI+DiVDmx7m8Q7FANv4Xn1z+OIyUXQhMsGMvdPKYFXELhEVN3zFU43jcaGs7y1JFYj
 Q1sTvxV6J49x92qBq4YLwfqLXVJ2HzQgt8sPP7LBZWDNBQJr3K7buKvEnwx0jGKWhRLRhzfo2xS
 mVXC9a1WuPbZRzCva5WKlntoK2vxqs2tO3ShmELTUrHqgDr4aJpWW2oNLjBT4mVDzcm8OidFYeG
 n7wuNM6gRoZJasRtrf0Otj0V8zRXAw==

These two tests probe on sys_poll and just hope something calls it.
On sufficiently quiet systems, nothing does.

Use hrtimer_nanosleep instead.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/fbtprovider/tst.return0.d      | 4 +++-
 test/unittest/fbtprovider/tst.return0.r      | 2 +-
 test/unittest/providers/rawfbt/tst.return0.d | 4 +++-
 test/unittest/providers/rawfbt/tst.return0.r | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/test/unittest/fbtprovider/tst.return0.d b/test/unittest/fbtprovider/tst.return0.d
index 0b7091b320904..f06120a55e5d0 100644
--- a/test/unittest/fbtprovider/tst.return0.d
+++ b/test/unittest/fbtprovider/tst.return0.d
@@ -11,10 +11,12 @@
  * SECTION: FBT Provider/Probe arguments
  */
 
+/* @@trigger: periodic_output */
+
 #pragma D option quiet
 #pragma D option statusrate=10ms
 
-fbt::do_sys_poll:return
+fbt:vmlinux:hrtimer_nanosleep:return
 /arg1 == 0/
 {
 	printf("%s %x returned 0", probefunc, arg0);
diff --git a/test/unittest/fbtprovider/tst.return0.r b/test/unittest/fbtprovider/tst.return0.r
index 53308c30f27ab..e4065e20062e0 100644
--- a/test/unittest/fbtprovider/tst.return0.r
+++ b/test/unittest/fbtprovider/tst.return0.r
@@ -1 +1 @@
-do_sys_poll ffffffffffffffff returned 0
+hrtimer_nanosleep ffffffffffffffff returned 0
diff --git a/test/unittest/providers/rawfbt/tst.return0.d b/test/unittest/providers/rawfbt/tst.return0.d
index 0146d684f1033..3a39740071c49 100644
--- a/test/unittest/providers/rawfbt/tst.return0.d
+++ b/test/unittest/providers/rawfbt/tst.return0.d
@@ -9,10 +9,12 @@
  * ASSERTION: simple rawfbt provider arg0 and probefunc print test.
  */
 
+/* @@trigger: periodic_output */
+
 #pragma D option quiet
 #pragma D option statusrate=10ms
 
-rawfbt::do_sys_poll:return
+fbt:vmlinux:hrtimer_nanosleep:return
 /arg1 == 0/
 {
 	printf("%s %x returned 0", probefunc, arg0);
diff --git a/test/unittest/providers/rawfbt/tst.return0.r b/test/unittest/providers/rawfbt/tst.return0.r
index 53308c30f27ab..e4065e20062e0 100644
--- a/test/unittest/providers/rawfbt/tst.return0.r
+++ b/test/unittest/providers/rawfbt/tst.return0.r
@@ -1 +1 @@
-do_sys_poll ffffffffffffffff returned 0
+hrtimer_nanosleep ffffffffffffffff returned 0

base-commit: 877fcdeb25b370be182d51f27fb4bd8e4f739fb1
-- 
2.51.0.284.g117bcb8de7

