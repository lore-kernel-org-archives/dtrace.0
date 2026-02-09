Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E440303CAB
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669837; cv=fail; b=LLXhvG8YWYlnf7tmEYtAbJHxOoLRY0+Bt7bueiz7FcC5NOnYrGhiTir5j2Ag40yaeuRHfpZTHxEhq2/2jrYQOiaQDmBwUsPdrvbVTMKfiR5aPpOTQITgPEVMci/7TZ+tBqyydKZFwI6Lmej+1F1cmFivaw1AZ8OE5F3IlHj4m2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669837; c=relaxed/simple;
	bh=q2qvLxma++004fTF0hf3ejcNI0iG5tZvwfdikrfcKmc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RWDvNOltduZ9gyngj0xFrpMCG2bMiXJ4Nx6VzfZ/cv6RIXAziSAcBsw/X1ePFvtgUM5WHWUMoPKQKFbCaHeQoTC3cBrj64ZZY5NULH9qSHKiQ0QvmPO62rQXMu2W2MtcZiqRhn/Vgu6aveX0vugkf7zke5ctKoZ9K+Gj58RaN8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mYXsT/R3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ktUeZB7y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mYXsT/R3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ktUeZB7y"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619EDPWg1559044
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=aLLZj5UarThIR6wuAjH6PwENIYamA+gmJU/EemiHddM=; b=
	mYXsT/R37QqDj5OSMBuf4jJH6hMiFG9FHOnxGRCXB0gq97zJ1RVHtKjuBEwNvXi/
	e2ckviFfbMzXpj8QMYseO/mZomP4mylhCNCkE7E4t6q9CafoFu8qshxwmcYfFiTd
	bcfNjzC2lsJY9V8esv25fsFrF54tKpSebF0zpsOFTDUw1hgt/Td3OkLo+EL7iHU+
	xU41NOLxBcAoRaGO5AOZ2UsBtB84ZGrzGy/V46cJVg4cMaOjW8nVqiXFtV43NxnP
	SrmoRsC1nXofj7sEkdgkJerP3Ofg4LC7DrcgRNu0JbSt1ZTLCDGjfn4ekjv4K3mu
	df3tKetM/R+cf8fXsWlKxQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xhuaqnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619J1qEI000438
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:54 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uudh8pt-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ5DmR7+kDL+0nGKNhx8YtYlFfnLRXfpMMACARBnJA/p3DNbzuDVxhYbKXUfbWlF92ZOmfMUWpSUhC+98otwmSPP5GdVbZ/cjd8FwtgIK+SbRLKxiTHIi0SAEmJG40ucnCEUW0Pk0sEpp+YI2xIOulc69SCFPMTC3YSt1Sm9rDBCZ4wfojeWrAYgPVw6q/PDDQIFYQq6Q9a0IWTuFJPjzPMu+G8Wl0H/NJZQTeJhfBU8gz7gsUICgTJ44Q7lv0/R+5X86jVTeib74XejclfCCm4y+pSC7wRg5uOCVOQC14MnR8GHURMi4RKMRgDZj8Otz+qNz8DmR68uBKwXnk6NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLLZj5UarThIR6wuAjH6PwENIYamA+gmJU/EemiHddM=;
 b=YPj2lqHMmIfY8s4UIErAm8ZHgKY9vmAoghTtJwpe2GEC4ASxlZ9d3dbM3GTELWbj+rFiExs6oKfxpcPk82xBqm3x5b4G6sBmwmE728wiCiFcyTWb6JJn0FeEkSpcR6eDL66bkOu5YnuWMg1eFOkCt+ahuy99GoNsN/Yk8VXQMAh2TT8ppSB9zpxlroFUsbzUM4QfSfIeZsxAmUHoOAA9YsAqYJOkqeO7uvgiLRMskbUskZlPjoRGVBegoBXJ7v9AZyPy2wMDjoPmx56NfkZJs7QD3RHFR2u5E/1Rtb0LsyqOkq87bkFnSgHZQiAU0LxRZOMQHlPhue4FcNCEp2+fDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLLZj5UarThIR6wuAjH6PwENIYamA+gmJU/EemiHddM=;
 b=ktUeZB7y96OysD47wc//mVUodJSKfEn+sVems1706VD+etz6Vw5v/Bne2OHc7gee+cC8Mnl5Ip+6DHJQxpz6rqsYRHLkfjfPzSJfx+6WYZyczPAUobeJYIq6Hxvzpc3dwogfiQcGuMsqs5n0Sw6tyUP2KjWj8XPhf+8A9Fm2yXM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH3PR10MB7356.namprd10.prod.outlook.com (2603:10b6:610:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:43:51 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:43:51 +0000
Date: Mon, 09 Feb 2026 15:43:50 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] test: adjust tst.pidprobes.sh to account for PIE
 executables
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522B4C2136DC1C1BBE9EC54C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH3PR10MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 285530bf-5c46-401e-fc59-08de681beef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lfg7WkveS42w/WzJPN0Xv0h8osC522DFyjObssEp1hIfFMq8EQLx0nszo8SP?=
 =?us-ascii?Q?E77axGcKW7kKFpuD4oItEknCGkHmHI26u0j89c8iN0OK81XyfS7hQr5h/bcj?=
 =?us-ascii?Q?1iUBRMisBvM81x/iPqxcIl4Kx4FEWnVpfmBZhZ0Wymp88abN/xmTr6Sj1UM7?=
 =?us-ascii?Q?vKQjAKBXlMvEz/ZYevrs7VfKsB2dzyLZ8L/70l9GhvQDp2qEianKCvkIvg7O?=
 =?us-ascii?Q?S8j47z+FMWvRY7cCjrT0y/DTCsYG3GnKbQ2aZiXYMiqjGpywHtG9QOGASub1?=
 =?us-ascii?Q?UcwExBJ2xehQl4Ot85QoVcQ8Bl9a/WpjqCL5mZgo2xWv2kiIQ9k4oYfdj2fc?=
 =?us-ascii?Q?iK+cryZX4T85WHzJsWshDy8BXgkCHLeh15Jp3KLf79+b4vlhYsZLRVwYURki?=
 =?us-ascii?Q?44qrsE9lNVpwAms2spsrJ7WYghH2ZuGiVN5PM3oLiqrI54+Xv76igJqmmhdu?=
 =?us-ascii?Q?9NUw4nrlAPjayMGsnrZQJdVVIBUabTwKVQyH2VSXnFbzxN54ylCmbw7KXNdk?=
 =?us-ascii?Q?kfFoDaZx2ydzHae4GB44f5iwfZkromKz1pnXOtxFN7pmnHbioAYp3MfFddY5?=
 =?us-ascii?Q?PTmCiTwKqDEO7ucAM2fQSUnTKDx+S1vCTooMI9TvZ8DLA+H63saN/hJpbPh0?=
 =?us-ascii?Q?yb4b59Mws4oy0255M27DkISpwPf4RDmsbeeoBikaxsJzzg8qj2aEqofrftof?=
 =?us-ascii?Q?TgZ5UgygpIn33M4Qda7TDE71LZFLx9dyHDr2v2YT54jOL90Y2N/Xi6k366fd?=
 =?us-ascii?Q?Nm5CDuo8K9vZIzcLN9/Kx8YkNwr4WkTwNsn1zWdxk9/WlWABAC5BGmuGBS+E?=
 =?us-ascii?Q?lL3Z6Nefgy8DepxaDsqk37T3Z8x4gkuG2Mbh8HZXGC8kDGKaoFQWcX1OVjoW?=
 =?us-ascii?Q?YgekQMqBa9EOq88L0EpV4qqRP0E22DmvLkeb9nWiPhkbf0I/HAgPq+hFMouP?=
 =?us-ascii?Q?Imcz11gYeMXnQM6XTQ8uaXapmaN9C68VesOrivkZuCLXw8ANYFtWGgYmpZHo?=
 =?us-ascii?Q?eZnn70vjGVrYqf6r+Z7dM4xeMIN67mYXyOc6rnxpQu3XXZtm7VNU83AD9Pgc?=
 =?us-ascii?Q?lpFZZc8qO9WhQcXRH8MCwuEg+YKv0Ka/J3TqYCY/dcqXZF7LblZm8sVMxmdS?=
 =?us-ascii?Q?VHNmqXN0z/j/k/utwfnEl+wrluonMXrcWAWwlapHv76HKke/qsDQVh4i1bDn?=
 =?us-ascii?Q?J+GqPaimyp5q3vLlaQ96yZh/LolGES5UntmvSHjhXhVlsE5u9UQrhvh8CB8I?=
 =?us-ascii?Q?eiYg0EYQDZ4uJ4LK0szAv7CmqoK/3y8BPe2JiknhxmadyqtL1QSHiULV+2rc?=
 =?us-ascii?Q?iTd6WEY4QQSEEx9iiB60sdbw8Nby65dIetXkQQKrZ+1yYj6J+ntuI/aKGkxV?=
 =?us-ascii?Q?Jf+xsJ1NcOmzRXS044GXzRqN5SiJ1xU71t7turRIqYk74xl1DPFJ7MQa6VnZ?=
 =?us-ascii?Q?9STwFnqZWG3q6X+fSDz50sx/hewyduydA/NJm79LuN9d2Y9zr5N4yLDOZqRP?=
 =?us-ascii?Q?Ay3PbqSdmuEL+YLlrQN15bYIcYl+6GQwW2+oPDpf0U2l13Cv7HfjmDXB3Sjg?=
 =?us-ascii?Q?HHBZAtxaEc+QE6UV3yk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KwD/38cZ1XVQyQs5KtND0yk055iZG4kvPVE5dC1W1h8EnWGgYwP0NjoEQUgk?=
 =?us-ascii?Q?uzIy/IdEllA2w5PR+aEYMkHqD4lXIfRzOTSzO+p+QQlVqD226+QO6AfnVoqg?=
 =?us-ascii?Q?6pGaE9Ho9ddNFHHtxMBFvSq8+dcTedn+r4wHdO97twKhV6tMlfUtLKdOqoQb?=
 =?us-ascii?Q?O3kyHwPQDdPOOHn1tWmrXadaaC9VwewQM49/mu/e8trxgyKxpo9xvLw/novw?=
 =?us-ascii?Q?0bN4lqUL/oU3PGH5Q1oZI2CyDTrsnzKuaYL9rDbrFhXMl98SXLsV65MfkvF/?=
 =?us-ascii?Q?Mhdi5UOiI78bYhWnDUOXfTPX10QlRMj2w1VpTrsW0uBfw76mfEr67N26BHKk?=
 =?us-ascii?Q?ZzCMKqk1oVoLTSOHNz4vE6s5j6ZGiG7WKOZ1B4uItoNBrkCmPXJB3Thdm93S?=
 =?us-ascii?Q?7cr4Si+o3bFnxuf7ek+IVJlP3aMjYV55AFMSPf4M3A6/w+oBvV9cQ4h91jw2?=
 =?us-ascii?Q?8lpdB6eG48l4cbmotPLsEXEWqLFXe7tZ+Ph9i9JMUKNSLMDmv7YilRwWijrB?=
 =?us-ascii?Q?kNk3x4KTBFCdbhWyKxwMLliL8LxTB4csPHyiHV7kTDvySTQmgUu0IIQbk3hk?=
 =?us-ascii?Q?I/CNMDyxHNk3+ZdbauV+CSOEcR3KAR6/RwdngJJ6pIIpox2n2nfJ+/+IVtTM?=
 =?us-ascii?Q?YNMnU0LA5jDuMKySzWwOHg0ETbecnBiuf3wCftWdZ3afhnABhhjUKSDQ8xZF?=
 =?us-ascii?Q?lFEKT9IGk5FAMJ30f7H/0gpMTwjPpGf+cV+9YZ0UAkD9YyEMip1XsJe49hzu?=
 =?us-ascii?Q?0MMMxQiW19GkTawRbJxw2e0Hfg/kMzxBKoStQfcf2jTsrMpe6FNHUOWJfKGW?=
 =?us-ascii?Q?JpTiaMxDxhHwMNGxSg52k0GPSlsNiIAsePnafjaW/OoriEeUbqa1J309h/g6?=
 =?us-ascii?Q?KPKKoZWJfP6ZXTVmx2ff/tLSrCc44y1SQu4o7kOY/Bq7PZQvqSaU2nDauhn6?=
 =?us-ascii?Q?7s763iQKHcHhBqecx60CGDUqfX01xxlJB8RZU/VgrfHjwuIT7pr3ieX8gU0k?=
 =?us-ascii?Q?Iu0vc0gY0e8IbHWBOM8w0NVswcp1mnBPBgahqoGm3dacZTl01vhBAnmquIYh?=
 =?us-ascii?Q?TXcsljtq8k80eIvFVt68Twomz/O4UnW8SOfqYBuZLOR6hg0h2JiOhXCfYhaD?=
 =?us-ascii?Q?DXxFzTejWuWMyimeX/zX6HsAwjlxEKb8AFG3oOParcpDYT1o3nUetf4t8Ghg?=
 =?us-ascii?Q?YIGAaXOaC9kdre56h06U2BHTD00/7y+jpxl44uuvkJxZc8VJMa70bo3BOyVl?=
 =?us-ascii?Q?qAuW4s2WQKpzYfw9YZonEbKiUI+LSHveb4z9JK8bEuGUXifndgnqIxZhxSB7?=
 =?us-ascii?Q?PeMYEVJ7PCHguD6KlvGZ49tYBM7pgibdXddLWNwbdqcompZurz4/PRz3fs6a?=
 =?us-ascii?Q?bvxYM9JHPPh3tYC9VLahqb/yU29Q8rxzo0NfQ58O+Ecso1kLRUZ322mSAjNe?=
 =?us-ascii?Q?nbM5strAhpNNYatpsVfX3C4eBcdnVQ2FUu5ZLxtFG7kpFF3jPum5DK/Me5j7?=
 =?us-ascii?Q?87Kz3J+VjE4gFDvxwiT8x9b7T9zUtcl2AUDSW9p2GaHzjKbdkbAI0BoVrr9I?=
 =?us-ascii?Q?byM/d08u9w6gorL5rfD3Avhi2awuEMcKTbIh1veQGRh1ySWKJUSdm6Khvlar?=
 =?us-ascii?Q?0Iq7R5KeihNGGyhg8ePDdvVMp2AyVS93n4HlTXazlnMQiuloz9ATwMR9w4xT?=
 =?us-ascii?Q?T0Ru0Szt7kzRXTWAO3z+3yorJbfh9hfG7oRycbwNUObZYbVcIcl6XLux+AiP?=
 =?us-ascii?Q?IR9LXj/aNw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yq0O43319UQG5MaNjhlmIbMDOo3DeNO2ZxDzjALkdf/DoRMk1mSigPKLaVMbsqK88j9KpJckbAwIVaGfW8YbniS1GMKGixPXAgTiqDMx8C0myK0K5pNLFUvhv7Ph53R0SgNlGVxi25Uf6CuKrCMbcxhzoQUZiHLM67LGolIWCajfDqJhTe+WFRhxacuMEHnSf2Yt2OBTRRvFiIYtgQiS8GGQfpSKcF0hxK6JKy1lDKnmpanD76rfQ389CVHzRSl94GK/SqEuBqiJjROpJGrSSWP8RvSV8QPM/meCOL4dP/n396nu25JBJH+R5KixXMdrJW+wQH3246Phks2GeOUMX/qr63YHjDIqgbiXsa0jugUlVhWIAEcfsOZkQH8h+rLZTvknNKx+kQDbp9k9l8GB2CLC/9/fSENsWIAYED6yfsB3tZfRSSUbs5COql8cWLiCuSIQX9pf0OXl5QMQNKP6HmnMP2Dt5HCHkU+XZg7it6IptUYQuqPjIoGax3rfDehtyfDwHUua8nRZToF6/+jQ6YkyEEAZwayijSwm2fZz8WwNFOzcsYBZSAEPNdLV6cExMu4W4zJdJzv/VjA9wjohs3Tkl8roAiw6f9wUMYqWi4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285530bf-5c46-401e-fc59-08de681beef8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:43:51.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyCZZ6COmZb09DNjqfbRVsELJavnrq95tq+2gWm2ELB2ZVV5On8nNvvSUdpg8N82bxwU9R32wz1uNdbye1r7Sk9NFVqnqv37PMVBqqxgNco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090175
X-Proofpoint-GUID: T1mqqA2X9_6dcDcxovWh02hzZt28J4oK
X-Authority-Analysis: v=2.4 cv=FIsWBuos c=1 sm=1 tr=0 ts=698a470b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=2OyXNydD7y_s-TsZ39kA:9 cc=ntf
 awl=host:12148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NCBTYWx0ZWRfX9+h0kn62XJSl
 Hezyzvci8OV6yKr8m+qs1hY+k0pHy7FG45O/XQLqPORoHTSnxqnEqin6TB+Z4ubv5v/cSgrpQy8
 KMyIlk+uNHIfO7LvJ129umiGuHemyfarpojxw371NDhogO/vI4UaKrWxOzuBsz6/DltkvL0nELw
 vy+Ybe7qrMgsDlj2fUbWj+350Ly0ZOCrxiZwZ5fJg0I19heDv83Zq3UI/Yz30nTaJu3on+Ntj5R
 t6GW4u9WyAt1qNJO+8JSnfHTqseIDOqfcEaGPaMwrtZ7VlEDUd1dCI1y9BdCleVCB5sKx1GID+V
 TsjAJJe4r1qrMn/d7Oz44nXb6BSTFNa/KF3iugFRI7rIuF5Z4xlCC/57q6N8D8yzZ66RMb0H1Ws
 CCNdylmnjoz9fHT0k8mQwIBi05j5vKPWpy4M1EHar8A+y+wBwDe+1A8900xDakD/qRB0LHyWW4V
 NWLeb+k2vtybH4hI92j+SUNR6pzpXSo6Hhcc3XOQ=
X-Proofpoint-ORIG-GUID: T1mqqA2X9_6dcDcxovWh02hzZt28J4oK

When the test executable is compiled as position independent code,
the comparison with expected reults fails unless the reported PC
values are adjusted based on the actual load address.  This is safe
to do in general, because for non-PIE cases the adjustment will be
0.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 24fbd518..80de5140 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -119,8 +119,11 @@ fi
 pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
 pc0=`echo $pcs | awk '{print $1}'`
 
-# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
+# Construct D script:  add a pid$pid::-:$pc0 probe to determine base address.
+printf 'p*d$target::-:%x\n' $pc0 >> pidprobes.d
+printf '{\n\tbase = uregs[R_PC] - %s;\n}\n' $pc0 >> pidprobes.d
 
+# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
 for pc in $pcs; do
 	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
 done
@@ -130,7 +133,7 @@ done
 cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
 {
-	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
+	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC] - base);
 }
 EOF
 
-- 
2.51.0

