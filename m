Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509A13D51E
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 18:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829724; cv=fail; b=ipnJfUZ3+QWVMEcA57aSUHZY2fWEQ+VA73smBiMssFyWYOmOCIYiMyeL94PchQHSW4MjEyd8bG1yv1PL9o8fKeuyQOT2VwBEBFIrwjFbPvaW+HTcCzZuun6hlCWCtxbpWqCCQwCtBL5xJ6XKLBsKU7XJF9d5IfjUsAk2ENUoExU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829724; c=relaxed/simple;
	bh=7CJHKe4wop74UYnIuTz/tZWIs9xYEVpn6PFnE6tcOJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u859jRGNmCpchbMerDdMbzI/c2lk2tlv2iUzCSAZf2fb2D15Et1COKbMEcgBSljDLUud03Zsw+9rzEBE2vQMv1Q7WHgP5VZXuOLkvJumCgthHvHrq+uh0jdYKFt1CpYgZdMBJb75f60FutkxRy0F53GxzpxEldYGX3uwkxx0dbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GHNRW6np; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fy5Rh/IJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GHNRW6np";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fy5Rh/IJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DiZlJ030190
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 18:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=69Y7lk0zjzLGFoBJBg
	j7ABqduJYzkPL2+s8pKtFMVvA=; b=GHNRW6npQd3bTnwLocVrEOBFqAHgQdeHZe
	XAEqESUZOJhWmFmkIsAg0SXI1d0i3hNy098Z7QbaN8dvxLoH1eY4vS/+x+HGXGJP
	pD/1duZEVlag3jvIFAP83IG26Ebv9j8+DQSxHRQOfSuuOYAKbblqQtVFzwI2r0Pg
	No+nct8XWX5TaPiqsDXtEK3F32ogiqtICtW0lArp+sIUP40rgoti8rVRHxZYGRbV
	pQG+kdUuE6uYRyul9QozGD0eFuzr0KFj1NzNvPR6elw3t/DMalnQVjBJ4wVrle/d
	+iPMpJeTPWWPL/ssnz8pS/QhHPQD+6XVgOMdwOH+lt692o3WQk+A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nanyx367-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 18:02:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5HfkRT036334
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 18:01:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdry3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 18:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj92LhdQ7OmmOsjmDUDmCz/VEmnxfE178d2OUL9kVrr7g4oDeXBZyKPR73JQyLrPgq3WeLRBGlrgGp8xQrXCgwGMG0RECHZmGUelAiHDfCJgglvrn5mq5Mb1rYyleMj0UL5tfRiGjZJw8ld1eOOSLMd3TQdxLYm75g8zZFvy3nlU9yhGc+uKlaV8txD982AaiLw4eZhM/qJnBD1gnzGhdeCux1g47V0ZPwpcrvR/juWS/4vzfphGeJHT5dPJ00mjvzRlyZ2y3EjK4pU4fnqXVlgxPuOX80BXiZ8eaQz+o/ZHnNSyNgFgjX7qmErbobMQHttqg3iUQ1E2hHGGWoIcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69Y7lk0zjzLGFoBJBgj7ABqduJYzkPL2+s8pKtFMVvA=;
 b=XCC8nhmRKTdzf9e1RJVgOQpcDWxShPZMguOasZTx4OPKhdDFLNj7moOOctvtt/9Lf4J8D1AVUFbZxNQsLCkuBeY4+Pg/kmGLNprry8HqK2i3KHn8LVn6xa4ynidp6NJhlocciDKOEuIe/16TVO0T0J6OCto1EkHfJxeB1fhA2gn5m8sPG30ZxtQMFlBcH3IkKQvBpSzBeoLI2A4Pf8sa2rdGbMoAIeqAzLHYMqmHyxFzC0ydB05yJfuIr2pnSciPP9e05AESNF155dgwUT81e+5b72lv6qkbAPf4G4zKQOqz9eAsXczRRf4TgWtfTVXVuCpiSRtyL+JYIpTLcnSGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69Y7lk0zjzLGFoBJBgj7ABqduJYzkPL2+s8pKtFMVvA=;
 b=fy5Rh/IJ3vcUzJxVeWkby+PM409RiY+AOHWL274mMShKSie7rBWI5I/ZXIEtDXO1yOITf9oLicXnF1C0veU+PC1D1W3Jf8cul8sFLrGUD3cZAVrDqL9mwUuN8by4vxE3u3VJD8ave57WdN69uS1nZxHHmMpbqcMrgreH6p04tZA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA3PR10MB7094.namprd10.prod.outlook.com (2603:10b6:806:31b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 18:01:24 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 18:01:24 +0000
Date: Tue, 5 Nov 2024 13:01:21 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v5 1/6] usdt: get arg types and xlations
 into DTrace from the DOF
Message-ID: <ZypdcfLQrWI+osnV@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
 <20241105000608.333229-2-nick.alcock@oracle.com>
 <ZypOQd2JYFq9I0XC@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZypOQd2JYFq9I0XC@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA3PR10MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e4168e-6c9c-4993-0580-08dcfdc3dcde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J6ZU32Jadkt5on3ERbQud4JG8MhQglc9FCPHjqkwenknlYgjA0Eb1eHzIHJb?=
 =?us-ascii?Q?mgSrUWz3Ix1ZrkiZk+iXVOYXyHtiwyoZeyUG7imA7yqExmF/QxLg31l2eebd?=
 =?us-ascii?Q?/IpGAlhdkXGzvnN8FLDcm4MEsE7vXRDEh5q++5bOFUhf1G5bbZSgMwvutvz1?=
 =?us-ascii?Q?gkuQy/k2RuGvv+hFqVSXXxFMHpJZYW4Bp/pf08wyC54BMdcjPYU2+U3LyY28?=
 =?us-ascii?Q?ujHy7zlGBxToH/z/pqA37lVZTVKOPQyiCEfSI6s31f60zKeZTSCEMVDSGbqn?=
 =?us-ascii?Q?WcdCSs+Un6xBuMVoSpIySwfLlRDMmfgJtc+rHmv6zrkmaVap7/JnYdx49/1t?=
 =?us-ascii?Q?UeQC6oe2O+6AiycidPQcoWG3wsB+8CgpUvu6yaWZ8DRhQZaMKYJ9GURnwnU4?=
 =?us-ascii?Q?NyPrmyneMVmYB1N79ndZQ7ImZxUvRPDy8l6XG32hSvBAKuVYux7ANrvq4LNW?=
 =?us-ascii?Q?oEn3JPJ3Q+tVOLInMw2Fay5R0PuelOUGwCjsVOrWIE8+NrYYvmgVP15COp4j?=
 =?us-ascii?Q?uM43T/MilIOh0AfyzoWAmLD6D3eR2unndIxShjCxJyJMT6MuyibfFYvUyTpl?=
 =?us-ascii?Q?Oi4GxdcDuQ0eTqXOJj17DuQkrr9bqeQAGcWriWPELUMzHvecamtUpA8/PtyO?=
 =?us-ascii?Q?HtmzRnocqYUXMcnnw80VrXFgTHaVAnB+bS9W8qeO0LWUECdD+7bB04y+NhiX?=
 =?us-ascii?Q?5S9cXbaxTckn6yii6mGm3uFvFboFS4aCw9FMSJrWIf9GF0RNNKoaqTtgYw4s?=
 =?us-ascii?Q?mWMX64Us3n7yeylg5gt3nKIVlMPMb8b0KRBFzEsiWwwmhGp+bMLRWe4sXFcU?=
 =?us-ascii?Q?bKg38sHvdYKRSFTjdqoh6TjXcEmR9tAOdMKwjgIBYZ5+U0tJOwUx4XfGCPrx?=
 =?us-ascii?Q?nKXFjea59F0+6bixwVqlajC4+EqiLctRBPBj6hLv1N1RPdKm7DAZwOq+SIGy?=
 =?us-ascii?Q?T5f8z+NV+SMb8NNTADUUv5eMAYezQorJ0TWS/v6Jf5rKSMbsMOQ5H10bIwrc?=
 =?us-ascii?Q?V7aCU5rZRmYLLbQVTzRofJILUBK4fGfS/GR2f4YRPciU3wZsfEO5b0NWWhnL?=
 =?us-ascii?Q?x7HlgTve2rb9UPUn7E8LbkuSoA8V4V2bLU+BhEAdiINO7dnldSLeQ7QULsVb?=
 =?us-ascii?Q?2LUAsn62GctnTO9IRSRZNs49qvejGKGLe06zByjbqTFgdYqY+1q5RHzU6Kj1?=
 =?us-ascii?Q?6rc2ZfAGIKDO8ZIczbTZXfVcBgo08e9yXITaZBZwIDqqn6y1DZmdhZcDu7c3?=
 =?us-ascii?Q?+BJJS2YadvueKhdLyCCwAx8Vnj46SfYz5JYXoyGTNb0EGhY37EtXVB+g9pd6?=
 =?us-ascii?Q?FN0mbGgtMqFrQ3/RcPoEDX2D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k6mmCe2yJUTy5t22gTJ3G9tDL9cFC/NDEQ2pHoQe1LB0JNeqwySfSe4yeQMm?=
 =?us-ascii?Q?q+4D73hCl37pO/AywqGrPsx01VG+QdoXovcG6L90WekzBGO+dAWiC+G5ZCC1?=
 =?us-ascii?Q?+iSt0SfuLLYBaeWvfOX9fFNktgR1iCxeVabACYcpV7PeeI2IFJjTL9CwxJiu?=
 =?us-ascii?Q?hh7ihoZn88CaNtnl81bcNIvq+YMflUVJGHCOS/yY4V84LAGrokK7JIHnKGvF?=
 =?us-ascii?Q?r8dMvgGaT8tq5Mp5964rSDdhjdhqJVXpluYDGqk6+YB0MJjbSHVXEVCLeykw?=
 =?us-ascii?Q?H6C+hXzpL8nQBl/9RQUxxE2UtnuqZv3FSyPl7LfemmaIy4hQ6+RTs+6nWR3F?=
 =?us-ascii?Q?Jht7QRsTBqHKZyAM31Ux1Kv+ZotUhpFxhY6DdPkhz973NrPIRoQLm3+ruO4e?=
 =?us-ascii?Q?kzft44xGUSq8IcmDEy1Rjrhm30JUhbvgJtBnaJuEVF919B8IIBfCIAJ2zmgD?=
 =?us-ascii?Q?dIvfsYr+EqQK+YNckJ0lR1BA2A9+833XkylTxdIpXaLDXAEIRy8lI76uz5FK?=
 =?us-ascii?Q?ejo8OQtyc6k2dV6AEtdILwE6fywWkKxdisU8MdRuZUiyEioj0DAn1DyAkgxh?=
 =?us-ascii?Q?4gXItnIcT6LVgmzndWUTO3t40HYPs6ZDJEgwu3z5fGa7/mxj+WfIIv9wcOs8?=
 =?us-ascii?Q?iIf6Gz0E1Q+/jobyQ3nYSlLeNC1pBDIsKm+zmMHlMLZ4KnKZceQk1/gSvm1A?=
 =?us-ascii?Q?GYf7Jcs6Am0Q+RBroNdm4uU9oV7qkeHaWenSPW5Wwx9kVAUxKqPzG3Gu5gYE?=
 =?us-ascii?Q?wsDLtUfwlYjOJQvw6R3iPjh/+NnAQ+Hos1mlfwitpDUiciMk2m+fbaom7cbR?=
 =?us-ascii?Q?B0fTLcd7TdDbXFD0n4GmTbtgVFQwDtvyykYiA8fia/SSZe95klxk1OZbn/tI?=
 =?us-ascii?Q?V9X/HimY8MZ080A6xoGa19prHTLTEAOEy7Jcnf1lfjCgaOb3fq+jl4SL3VGo?=
 =?us-ascii?Q?boIR61RqO2euDhdTcmKcV/aci9GkBEFUWiuvcNXtz4yTrbx6Xw19wwZpn14r?=
 =?us-ascii?Q?LAGwsQlNYhLRVSZS6zW7pw5Gd8IRTQMCXFqGkgQnvAkV8JjxVNP60Im3DgS0?=
 =?us-ascii?Q?5VTZtLoDpyRq/w39lsVOP9b/LlZw+YCyEmHsK0NCkOwSxKkTfPREj6xrfdlz?=
 =?us-ascii?Q?bA+OLQljcV2BvS3HhQLzAcR4e59hC+3xLxRdnz2wL13xSuEQtsn4TdK9Eczg?=
 =?us-ascii?Q?fYJZdHT5X8eSbBSf1M5DCZKi8bK4cbIZZXgOUso8hjaWZuSXTtZJ006eT63S?=
 =?us-ascii?Q?QANdtA5Di/RaqOQWs221YjgYGzwYLHM1hU+GfYEl5AXYqzZfdVc4v9+QuI3p?=
 =?us-ascii?Q?bWyJOhgglpkN+TEE69hof5R05YjpnCqRLrbOeyY7GK2HYOQghbEYkUNqXKYv?=
 =?us-ascii?Q?PaBwCYNfxlnSQpH435Q9C3CA1V+3OpJs9wjAJuc6du49J5LnqLfnsG4yDtSC?=
 =?us-ascii?Q?Ofk8UeUFQGNWGATmh5W+eVTzSa0ScmE/SU/PeOllepXdNIjLkHDwhkpb+wSb?=
 =?us-ascii?Q?3YZ+Y/pLX4N1ZXfri9vYpMUbUjY8J70474HY1MEDAoiyLlLhtKa89rKP5Lgn?=
 =?us-ascii?Q?XSf1pyWe1ytIUvKqJBa3e6y0WY3e1uDPI+/vUqV32Y1O+r5iUhOnFfoo5EGj?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tqhGLGKp9hbxKpecmSxU0SZmhJfQax/hZSY19hCpwp5siBRYT9S2jocQKHeVeOyYcHeGF1fWCy2+hLNcjjx8vNSatOXVCPcwtSDnvVfS0+uUIS0lfZjR40aMToUuS4reUufOHVOlvLtNLqcSQNAckCBiWys9R86TiAtHgDAfxLPuHQsyo8Oem2VXQPCVCgVExyMKhNwCs4RpBo12aENKIt4BQMG0sOTE717JmOxwXADzYS/5nPRkixhaDmriG2x1vKso9VMDKLZyrTQ+RhfHpcxbnrpAZ8ua2DkLyvWKwz++amo7Oy+3UrysJM7Oxmlxc5+DrTju1sMx4Ttnafh0Tk82TC7pWehGnhN2bnSjFyj7fAqxk7P8PB/hIpc2xlNsOtiUK1KL5E8TPDBmTd7CFt+lhfp2JSusA4gYMLDQAawuHZXv6JlETgBVTUQDmXuPXOiaEzqFGBY4L09O8FCiwNyyvyHgA7lOAuDIjFSjF7HSfFwRNW9KIIkhPJRxPV4hnnBAldxkNt5ZkgjUtfkOGDMDjm5ub4KjCYrtxVm/lox8pkI5lTOdUKhdFPLEU+lnsdHe680MrSSeMj9OuuhQiVyV7REKpRg86BvRAAfr2sY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e4168e-6c9c-4993-0580-08dcfdc3dcde
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:01:24.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8nP96SEV+EysNDjtnJX2iM1q8jAI3lfplUhTLTJnlfx9CqQt2MrLXkr/vZiEn2Z2hwINBnwoMKDDiDFuKW5wqeWpRZ0VuPz1CFx6n/KY2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050139
X-Proofpoint-ORIG-GUID: C2s12FGYGJCGdQbfGKKEnsyoazQyeA3K
X-Proofpoint-GUID: C2s12FGYGJCGdQbfGKKEnsyoazQyeA3K

Reviewed-by withdrawn - see my comments on patch 4/6 (that one contains a diff
that belongs in this patch).

On Tue, Nov 05, 2024 at 11:56:33AM -0500, Kris Van Hees via DTrace-devel wrote:
> On Tue, Nov 05, 2024 at 12:06:03AM +0000, Nick Alcock wrote:
> > This change propagates native and xlated arg types and mapping info all
> > the way from the DOF, through the parser and dtprobed and the DOF stash,
> > into DTrace, where they end up in the pid_probespec_t for USDT probes.
> > We don't do anything with them once they get there in this commit: no
> > user-visible impacts expected.
> > 
> > We bump the DOF_PARSED_VERSION since we add three new types of record to the
> > dof_parser_t, all optional, covering native and xlated args and arg mapping
> > tables; to make life easier for consumers we emit them in a defined order
> > (documented in dof_parser.h), and add arg counts to the DIT_PROBE record
> > that precedes them indicating which will be present and how many args are in
> > them.  This means we retain the property that you can always tell which
> > records within a provider are coming next purely from records you already
> > have: there's no need to make decisions once the records turn up.  The DOF
> > stash hardly changes: all that happens is that the parsed data written to
> > each per-probe file gains some extra types of record (it can have
> > DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
> > DIT_PROBE record now).
> > 
> > As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
> > refuse to read probes added by dtprobeds that are on the other side of it.
> > (Restarting dtprobed will reparse all the probes in the stash to match the
> > new layout, and newly-started DTraces will pick that up -- so this only
> > affects running DTraces picking up new probes, which DTrace cannot do yet:
> > so no visible effects are expected.)
> > 
> > The code is a bit repetitive, with nargs, xargs and arg mapping all handled
> > separately even though the code is very similar.  In future maybe we could
> > unify them (but my attempts led to code that was much harder to read than
> > the original).
> > 
> > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> > ---
> >  dtprobed/dof_stash.c   |  15 +++--
> >  dtprobed/dtprobed.c    |  10 ++-
> >  include/dtrace/pid.h   |   7 ++
> >  libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
> >  libcommon/dof_parser.h |  64 ++++++++++++++++--
> >  libdtrace/dt_pid.c     |  59 ++++++++++++++++
> >  6 files changed, 256 insertions(+), 49 deletions(-)
> > 
> > diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> > index 0e639076f655..8bf465678217 100644
> > --- a/dtprobed/dof_stash.c
> > +++ b/dtprobed/dof_stash.c
> > @@ -59,8 +59,10 @@
> >   *    startup if the dof_parsed_t structure changed.  The file consists of a
> >   *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
> >   *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
> > - *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
> > - *    the DIT_PROBE record specifies.
> > + *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
> > + *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
> > + *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
> > + *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
> >   *
> >   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
> >   *
> > @@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
> >  			break;
> >  		}
> >  
> > -		/* Tracepoint: add to already-open file.  */
> > +		/* Args info or tracepoint: add to already-open file.  */
> > +		case DIT_ARGS_NATIVE:
> > +		case DIT_ARGS_XLAT:
> > +		case DIT_ARGS_MAP:
> >  		case DIT_TRACEPOINT:
> > -			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
> > +			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
> > +			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
> > +			       state == DIT_TRACEPOINT);
> >  			state = accump->parsed->type;
> >  
> >  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> > diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> > index f4c6be1e045d..2ca39b26f88a 100644
> > --- a/dtprobed/dtprobed.c
> > +++ b/dtprobed/dtprobed.c
> > @@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
> >  		if (dof_stash_push_parsed(&accum, probe) < 0)
> >  			goto oom;
> >  
> > -		for (j = 0; j < probe->probe.ntp; j++) {
> > +		j = 0;
> > +		do {
> >  			dof_parsed_t *tp = dof_read(pid, in);
> >  
> >  			errmsg = "no tracepoints in a probe, or parse state corrupt";
> > -			if (!tp || tp->type != DIT_TRACEPOINT)
> > +			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
> >  				goto err;
> >  
> >  			if (dof_stash_push_parsed(&accum, tp) < 0)
> >  				goto oom;
> > -		}
> > +
> > +			if (tp->type == DIT_TRACEPOINT)
> > +				j++;
> > +		} while (j < probe->probe.ntp);
> >  	}
> >  
> >  	if (!reparsing)
> > diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> > index 0129674adf0c..25bfacfdbfe2 100644
> > --- a/include/dtrace/pid.h
> > +++ b/include/dtrace/pid.h
> > @@ -35,6 +35,13 @@ typedef struct pid_probespec {
> >  	ino_t pps_inum;				/* object inode */
> >  	char *pps_fn;				/* object full filename */
> >  	uint64_t pps_off;			/* probe offset (in object) */
> > +	int pps_nargc;				/* number of native args */
> > +	int pps_xargc;				/* number of xlated and mapped args */
> > +	char *pps_nargv;			/* array of native args */
> > +	size_t pps_nargvlen;			/* (high estimate of) length of array */
> > +	char *pps_xargv;			/* array of xlated args */
> > +	size_t pps_xargvlen;			/* (high estimate of) length of array */
> > +	int8_t *pps_argmap;			/* mapped arg indexes */
> >  
> >  	/*
> >  	 * Fields below this point do not apply to underlying probes.
> > diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> > index d6631a1afdcb..1792a8bfcc84 100644
> > --- a/libcommon/dof_parser.c
> > +++ b/libcommon/dof_parser.c
> > @@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
> >  		}
> >  
> >  		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
> > -			   "%d is-enabled offsets\n", j,
> > +			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
> >  			   strtab + prov->dofpv_name, "",
> >  			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
> > -			   prb->dofpr_noffs, prb->dofpr_nenoffs);
> > +			   prb->dofpr_noffs, prb->dofpr_nenoffs,
> > +			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
> >  	}
> >  
> >  	return 0;
> > @@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	return 0;
> >  }
> >  
> > +static size_t
> > +strings_len(const char *strtab, size_t count)
> > +{
> > +	size_t len = 0;
> > +
> > +	for (; count > 0; count--) {
> > +		size_t this_len = strlen(strtab) + 1;
> > +
> > +		len += this_len;
> > +		strtab += this_len;
> > +	}
> > +	return len;
> > +}
> > +
> >  static void
> >  emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  {
> >  	int		i;
> > -	dof_parsed_t	*probe_msg;
> > -	size_t		probe_msg_size;
> > +	dof_parsed_t	*msg;
> > +	size_t		msg_size;
> >  	char		*ptr;
> >  
> >  	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
> > @@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	if (validate_probe(out, dhpb) != 0)
> >  		return;
> >  
> > -	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
> > -	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
> > -	    strlen(dhpb->dthpb_name) + 1;
> > +	/*
> > +	 * Compute the size of all the optional elements first, to fill out the
> > +	 * flags.
> > +	 */
> >  
> > -	probe_msg = malloc(probe_msg_size);
> > -	if (!probe_msg) {
> > -		dof_error(out, ENOMEM, "Out of memory allocating probe");
> > -		return;
> > -	}
> > +	msg_size = offsetof(dof_parsed_t, probe.name) +
> > +		   strlen(dhpb->dthpb_mod) + 1 +
> > +		   strlen(dhpb->dthpb_func) + 1 +
> > +		   strlen(dhpb->dthpb_name) + 1;
> >  
> > -	memset(probe_msg, 0, probe_msg_size);
> > +	msg = malloc(msg_size);
> > +	if (!msg)
> > +		goto oom;
> >  
> > -	probe_msg->size = probe_msg_size;
> > -	probe_msg->type = DIT_PROBE;
> > -	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> > -	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
> > +	memset(msg, 0, msg_size);
> > +
> > +	msg->size = msg_size;
> > +	msg->type = DIT_PROBE;
> > +	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> > +	msg->probe.nargc = dhpb->dthpb_nargc;
> > +	msg->probe.xargc = dhpb->dthpb_xargc;
> > +
> > +	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
> >  	ptr++;
> >  	ptr = stpcpy(ptr, dhpb->dthpb_func);
> >  	ptr++;
> >  	strcpy(ptr, dhpb->dthpb_name);
> > -	dof_parser_write_one(out, probe_msg, probe_msg_size);
> > +	dof_parser_write_one(out, msg, msg_size);
> >  
> > -	free(probe_msg);
> > +	free(msg);
> >  
> > -	/* XXX TODO translated args
> > -	   pp->ftp_nargs = dhpb->dthpb_xargc;
> > -	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
> > -	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
> > -	*/
> > +	/*
> > +	 * Emit info on all native and translated args in turn.
> > +	 *
> > +	 * FIXME: this code is a bit repetitious.
> > +	 *
> > +	 * First native args (if any).
> > +	 */
> > +
> > +	if (dhpb->dthpb_nargc > 0) {
> > +		size_t	nargs_size;
> > +
> > +		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
> > +		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> > +
> > +		msg = malloc(msg_size);
> > +		if (!msg)
> > +			goto oom;
> > +
> > +		memset(msg, 0, msg_size);
> > +
> > +		msg->size = msg_size;
> > +		msg->type = DIT_ARGS_NATIVE;
> > +		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
> > +		dof_parser_write_one(out, msg, msg_size);
> > +
> > +		free(msg);
> > +
> > +		/* Then translated args. */
> > +
> > +		if (dhpb->dthpb_xargc > 0) {
> > +			size_t	xargs_size, map_size;
> > +
> > +			xargs_size = strings_len(dhpb->dthpb_xtypes,
> > +						 dhpb->dthpb_xargc);
> > +			msg_size = offsetof(dof_parsed_t, xargs.args) +
> > +				   xargs_size;
> > +
> > +			msg = malloc(msg_size);
> > +			if (!msg)
> > +				goto oom;
> > +
> > +			memset(msg, 0, msg_size);
> > +
> > +			msg->size = msg_size;
> > +			msg->type = DIT_ARGS_XLAT;
> > +			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
> > +			dof_parser_write_one(out, msg, msg_size);
> > +
> > +			free(msg);
> > +
> > +			/* Then the mapping table. */
> > +
> > +			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
> > +			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
> > +				   map_size;
> > +
> > +			msg = malloc(msg_size);
> > +			if (!msg)
> > +				goto oom;
> > +
> > +			memset(msg, 0, msg_size);
> > +
> > +			msg->size = msg_size;
> > +			msg->type = DIT_ARGS_MAP;
> > +			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
> > +			dof_parser_write_one(out, msg, msg_size);
> > +			free(msg);
> > +		}
> > +	}
> >  
> >  	/*
> >  	 * Emit info on each tracepoint in turn.
> > @@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
> >  		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
> >  
> > -	/*
> > -	 * XXX later:
> > -	 * If the arguments are shuffled around we set the argument remapping
> > -	 * table. Later, when the probe fires, we only remap the arguments
> > -	 * if the table is non-NULL.
> > -	 *
> > -	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> > -		if (dhpb->dthpb_args[i] != i) {
> > -			pp->ftp_argmap = dhpb->dthpb_args;
> > -			break;
> > -		}
> > -	} */
> > +	return;
> > + oom:
> > +	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
> > +		  msg_size);
> >  }
> >  
> >  static void
> > diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> > index d3a6836f15fd..8f42d00551e3 100644
> > --- a/libcommon/dof_parser.h
> > +++ b/libcommon/dof_parser.h
> > @@ -15,10 +15,19 @@
> >  #include <dtrace/helpers.h>
> >  
> >  /*
> > - * Result of DOF probe parsing.  We receive a provider info structure, followed
> > - * by N probe info structures each of which is followed by possibly many
> > - * tracepoint info structures, all tagged.  Things not yet used for probe
> > - * creation (like args, translated types, etc) are not returned.
> > + * Result of DOF probe parsing.  The order of elements in the parsed stream
> > + * is:
> > + *
> > + * DIT_PROVIDER (at least 1, which contains...)
> > + *   DIT_PROBE (at least 1, each of which has...)
> > + *     DIT_ARGS_NATIVE (1, optional)
> > + *     DIT_ARGS_XLAT (1, optional)
> > + *     DIT_ARGS_MAP (1, optional)
> > + *     DIT_TRACEPOINT (any number >= 1)
> > + *
> > + * The dof_parsed.provider.flags word indicates the presence of the
> > + * various optional args records in the following stream (you can rely on
> > + * them if it simplifies things, but you don't have to).
> >   *
> >   * On error, a DIT_ERR structure is returned with an error message.
> >   */
> > @@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
> >  	DIT_PROVIDER = 0,
> >  	DIT_PROBE = 1,
> >  	DIT_TRACEPOINT = 2,
> > -	DIT_ERR = 3
> > +	DIT_ERR = 3,
> > +	DIT_ARGS_NATIVE = 4,
> > +	DIT_ARGS_XLAT = 5,
> > +	DIT_ARGS_MAP = 6,
> >  } dof_parsed_info_t;
> >  
> >  /*
> > @@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
> >   * start which is the version of the dof_parseds within it.  The data flowing
> >   * over the stream from the seccomped parser has no such prefix.
> >   */
> > -#define DOF_PARSED_VERSION 1
> > +#define DOF_PARSED_VERSION 2
> >  
> >  typedef struct dof_parsed {
> >  	/*
> > @@ -59,18 +71,58 @@ typedef struct dof_parsed {
> >  			 */
> >  			char name[1];
> >  		} provider;
> > +
> >  		struct dpi_probe_info {
> >  			/*
> >  			 * Number of tracepoints that follow.
> >  			 */
> >  			size_t ntp;
> >  
> > +			/*
> > +			 * Number of native arguments that follow (if > 0, a
> > +			 * DIT_ARGS_NATIVE will be received).
> > +			 */
> > +			size_t nargc;
> > +
> > +			/*
> > +			 * Number of xlated arguments that follow (if > 0, a
> > +			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
> > +			 */
> > +			size_t xargc;
> > +
> >  			/*
> >  			 * Probe module, function, and name (\0-separated).
> >  			 */
> >  			char name[1];
> >  		} probe;
> >  
> > +		/* V2+ only.  */
> > +		struct dpi_probe_args_native_info {
> > +			/*
> > +			 * Array of native args.  nargc in length.
> > +			 */
> > +			char args[1];
> > +		} nargs;
> > +
> > +		/* V2+ only.  */
> > +		struct dpi_probe_args_xlat_info {
> > +			/*
> > +			 * Array of translated args.  xargc in length.
> > +			 */
> > +			char args[1];
> > +		} xargs;
> > +
> > +		/*
> > +		 * V2+ only.
> > +		 */
> > +		struct dpi_probe_args_map_info {
> > +			/*
> > +			 * Mapping from native arg index to xlated arg index.
> > +			 * xargc in length.
> > +			 */
> > +			int8_t argmap[1];
> > +		} argmap;
> > +
> >  		struct dpi_tracepoint_info {
> >  			/*
> >  			 * Offset of this tracepoint.
> > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > index 41a87955ec1b..71ac1754d343 100644
> > --- a/libdtrace/dt_pid.c
> > +++ b/libdtrace/dt_pid.c
> > @@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  		uint64_t *dof_version;
> >  		char *prv, *mod, *fun, *prb;
> >  		dof_parsed_t *provider, *probe;
> > +		ssize_t nargvlen = 0, xargvlen = 0;
> > +		char *nargv = NULL, *xargv = NULL;
> > +		int8_t *argmap = NULL;
> >  
> >  		/*
> >  		 * Regular files only: in particular, skip . and ..,
> > @@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  		p += probe->size;
> >  		seen_size += probe->size;
> >  
> > +		/*
> > +		 * Assume the order given in dof_parser.h, for simplicity.
> > +		 */
> > +		if (probe->probe.nargc > 0) {
> > +			dof_parsed_t *args = (dof_parsed_t *) p;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			nargv = args->nargs.args;
> > +			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> > +			assert(nargvlen >= 0);
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +		}
> > +		if (probe->probe.xargc > 0) {
> > +			dof_parsed_t *args = (dof_parsed_t *) p;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			xargv = args->xargs.args;
> > +			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> > +			assert(xargvlen >= 0);
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			argmap = args->argmap.argmap;
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +		}
> > +
> >  		/*
> >  		 * Now the parsed DOF for this probe's tracepoints.
> >  		 */
> > @@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
> >  			psp.pps_nameoff = 0;
> >  
> > +			if (nargv) {
> > +				psp.pps_nargc = probe->probe.nargc;
> > +				psp.pps_nargvlen = nargvlen;
> > +				psp.pps_nargv = nargv;
> > +			}
> > +
> > +			if (xargv) {
> > +				psp.pps_xargc = probe->probe.xargc;
> > +				psp.pps_xargvlen = xargvlen;
> > +				psp.pps_xargv = xargv;
> > +			}
> > +
> > +			if (argmap)
> > +				psp.pps_argmap = argmap;
> > +
> >  			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
> >  				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
> >  			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> > -- 
> > 2.46.0.278.g36e3a12567
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
