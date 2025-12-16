Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92D32E738
	for <dtrace@lists.linux.dev>; Tue, 16 Dec 2025 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865515; cv=fail; b=PdYocZYu2N0l5+LiZFgNqN/bsxSlOQFiiwsfmIkdL2j7NFsUfT6f4CM4oI1j1jhvqsI4gKnQ0QMNdjq5v2ZA9EE6y3wf4NvpvTqKOJhAZzVZZu8sSxa7i9CLN//F5qhATP1p610oeBVM6niyPmsukxkB1HaKUKxHExChQrAtGE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865515; c=relaxed/simple;
	bh=xTzumR+Ek4F77zGcsoHPqJU2W75O6VkfKjziLiEF/yU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UEGjfbmeQwbMu1jmoX+lPLjio2dPsi9vhqKHUCwZ2yM0UKrlBEoRzMckG8QapWP4UlEpUd6nq7CWy4TTcPpnudYXSQ5mzsscAWytbyyRp/amnYT1GYpyJA9GTNrW/PXIg9ZyXnmtA4oQ6aHhoXuPJIapmVW2bxbZR5PlDczOmzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qzAiz9Fr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LCTaJJum; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qzAiz9Fr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LCTaJJum"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG1gYNp3705984
	for <dtrace@lists.linux.dev>; Tue, 16 Dec 2025 06:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=AsEoxLOiCofioYEr
	6AiXegh/J4mAhBACxC79mtzTloc=; b=qzAiz9FrGyPNKhvn30S5vQ0h1Km93f0Y
	/BleKevny0bD5nNJ990PXkhD61bpdpUK1g1jUWOn/muJuMjlHXryHbNdekUVvEpc
	mI16iqEx1+pU4mHvjKfhpX8duMun5wJn9N8tzWi1YYCTvZRtu2mHfWrV48J2asJU
	Wogz8X3qQRJrFXDHUxrSYHDfqalH1mu4ciosrLzzMx93wiSZOFO3adcMlLYeUw+c
	B5UGljMVj3T1wnXvk718cRctxCsGm8Y8+2mplHMLp3xSYLOpVIUMRKiUr7ApznGC
	gje+N/bUltbc8ji/0++YivO+OvwaubQ2wLLs6pqlmjFbcxV9a7F87g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b106cbbt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Dec 2025 06:11:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BG5C0wY024776
	for <dtrace@lists.linux.dev>; Tue, 16 Dec 2025 06:11:37 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xka32rd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Dec 2025 06:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9GiMKn0xu8Bd7QRwjpveftR/8bx9zi15FmMu0dznAgl63GUda/RT2b4D3jmQXOplg5n6fwR6Fc2GJZq/hYvYQPjmxCGOQo6g49SQvV4UZ90G+FekthXAIjY3/YsFJznakWh0zt5QWvx04yljO2K3O3fDnTmfQ5/8MqO6WPys+dd9HNG2R8VhOvSvtNo1t5e0kdQ8UkCRqX/+AAI92+w2+riuDPOOIgxGwvA+tXP6q31WHZXUT4b43QiXOAqFZNYS0Es1WUJomu7boicdcudvObJ3bjssYLRvQrLxB+q4mKrBFTKKBIxKjXJvVtzfYTVZz93F5bFoHVUiv9M3eXQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsEoxLOiCofioYEr6AiXegh/J4mAhBACxC79mtzTloc=;
 b=xYDaLVDbP9M1nAQTW83a8YdMAxHwG+p+k8MR9dqCeM141vYD8kVDF+pZSYuE+HKA997bakZFJX7Bcn7bEY/fuSNUDLq8varlX6B4z0zVtB3j9Zyz7QdwbwNuuzc4jbPLs2v+UGeFutyxBnDmEsIbIqrfrrJZ1S+W+OR7ct0tQFW4shAmqo8u2h/KrlYJ5h/oAM5cwlUnEN4SymQJZ+ZzytewkzuuF/bjKOFrRDNh5193hyBD8iKBxaxbuI9lOM3pa4pnAbNwaGrdqnuUM1OhFI1llHeQvVYgnG/Ch6us001ylbpX9yOT+H2AJ2vyCWFCAT7ydGT2Yg8VOeYaDQG2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsEoxLOiCofioYEr6AiXegh/J4mAhBACxC79mtzTloc=;
 b=LCTaJJumBiAxoTZhYvP/J/N5E1bULWN0RZj+R+tSKIrll/SiPtyWWcw2CcPSXzCxwsuPQosPFHoeyfntf6LokrtKVFNHGCVZZMutddhFmccdKEUpa6hzE3ML35vGl624KVYEo5McSUA2jQJEPMgxY0QM/KSdngFEjvjr+D8gNAE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6784.namprd10.prod.outlook.com (2603:10b6:208:428::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:11:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:11:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: Add the DTrace Tutorial to the git repo and install package
Date: Tue, 16 Dec 2025 01:11:23 -0500
Message-Id: <20251216061123.3501-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 94943c2e-7052-4584-f24e-08de3c69f195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clRrY2R3L294QVRuMERteHk0endabTF3c3BQVEFJaGZ5bldsa1JHWDdBRTZj?=
 =?utf-8?B?c00yZ25MamVodWYxbVNOM0pZM3BETWxsT2MxZjFaOWZ0TkRmdy9XNktpYWxN?=
 =?utf-8?B?UU1uZ0FkMDNGb1kzVTQzcWxNTFBuT0JLdjhxYmlVQS84dzU1RG9uZmt1Tjlo?=
 =?utf-8?B?UjJMQUZSYm8yeWVBY3NFWDRSS2orZ3ZNNVlDMnpIS3lIVU00ZDZ1UW1nSVE0?=
 =?utf-8?B?Rk5VdEZFdEJOQzBKSkFQbFpGeVdTQ1ZzNDltbnpFOCtKSTNFSGRqT2NIZ2Fr?=
 =?utf-8?B?RmkvOEd0TTl1V2N0Z09hcTJUN3hybzJZOUxlREVNZjZoU3Via0xLQUFkak9C?=
 =?utf-8?B?ejdhbjdZTGRNT0lOaGt2U2xEVm1VbEJqWGZvZmFTQ21YRk5OVmJzbnVzTWJp?=
 =?utf-8?B?WWFvK3NYeUM1cldjTEF3Z09oYVRBZytRcjRLZ2ZqbjdUb21vaklFQlFJSFBu?=
 =?utf-8?B?eGtXa1ozVVJJeldsSWpUdlUrQWtoM0hjczhqdTdQWkVLSzBxSlZUMHVUR3gv?=
 =?utf-8?B?eThxdG5GWGIrdjF1Y0dDNGI4c0o1cTVpNWczM3ZoTUpKbldKY3oydEFzczBq?=
 =?utf-8?B?VkFXRlZoSTFJdHZoU0FIOXFqK1FTV0VpdmV2Q1R4MU5iS3R5N3FObktyOEI3?=
 =?utf-8?B?U1JpRmhFRVBvcU02M0Frcm1IWHhDa1NZbFh2bUs4bGlIUmZ5by9xci9xOUp3?=
 =?utf-8?B?d3dkUVJoR1JIQ0tSRllyaWtrbUxGeDdaVXFiMFJzM3VMSnJEZ2hmSDcwRGhW?=
 =?utf-8?B?K01rVVkrdUZoMStpUEdORXVPcTRsM2ZaMmwvZFFIOGViQnR6SnFmQnVLeHNi?=
 =?utf-8?B?VG55dkdXMHBiZDhNTmU0b2t1WnVDZDE1OG5uZlh3VVc2R2EvQ29VUDRYdVAz?=
 =?utf-8?B?ZW5UOUJpbXdTejNtVm5sM2o3K09vWENrb3U5YUJFelYrT3d0L3l6RjlhQnpB?=
 =?utf-8?B?TTdtRHVtK0dwSWlZazRxd2VJQUNZNktnN2xsODFOeVdZbnJLWlpqb2JzR1BW?=
 =?utf-8?B?TG9QTlNibzlxNm1mV21JUTFsVFNPaWVUVG9IUW1TNzlGZ3E3Tk1DVjNoL1pQ?=
 =?utf-8?B?MDFYNzJxUVRLOEJpUmJvNkg5MGRhZlF4dklFQTl1V0c2Y1huZnRKWEtnelFi?=
 =?utf-8?B?WGxRYlk1ODRxaUttOWNrNjdad2M5a2ZOaDdzaktPNENTRE4xTkQxWHFDVDQ3?=
 =?utf-8?B?SFEzWG91R1RLK0c4UHJrVGM0Y2hRSnFWeGN2UHZqWkJZend6VWlSYUVJZzhJ?=
 =?utf-8?B?MnVkVkQxcDBZenBqVk9FODR2TmoyN3pVT01xWG9DMnpJTkUvaG1jclQ4eksx?=
 =?utf-8?B?TXZ6cDY1bXEwLzFWcGg0NkRNb1RJVTJRZXdxaXh3ajRrekZVeTM5cUhCNEo1?=
 =?utf-8?B?eG0xb1ZZU05tSERVSXN0dmlzQ2hRRWpQUWNTZXNmL3N4eks1ZDdYZnk0MEpj?=
 =?utf-8?B?NUliWWZONzNwOWFBaUFlU3cxMDFMNWo3bld3MDlvQmhXc2UwSURaUkRWZkgw?=
 =?utf-8?B?K0JqNlpBRHlYWGdtSkN0eGxpajhuVlk5ZXNpZ29tUUptSGV6RkdYMGJFS253?=
 =?utf-8?B?Z0h6WDZ4RHM5d1ZyVkZCRjhnYnM3bjBTbkpXQk9GdXY0Qm83YlJOaDVjZjV1?=
 =?utf-8?B?VTVVY05ZZU9xdkhxUDhmbUNmY0VNeVZyVTdvUTRWVjIzVno3YjAxWlA0NzJB?=
 =?utf-8?B?L09sSWdJelVhWitEKzJGRU5OQ3A4bjA0VCt2OVRRemhMWEZWdHlTZlFUb2NI?=
 =?utf-8?B?ZXFQSE0yeXFQMURFdnlCeVVYQzg5enpxVUhlMTdsRmJWMU5QdlBjdU5xQ09P?=
 =?utf-8?B?Ym5KV0JoK1B6bWhUT0R1TFdvZE5jVDRtZUJTRXpRUkR0bVZPZ1lLS2IrcXBL?=
 =?utf-8?B?NlFQSVUvNFl1QXc3WVYwNUZlUVNhWlNCOEJrR0wzSFJ4bHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmNpVk10a0JXREtIV1pmT0tpMlRIM1NOeGpIamdQMWx2Q1BPUkU1OUZCOUhI?=
 =?utf-8?B?NHVQWEhjdys0UmYxR0gwS2VBRlJUSlZlV2hFaHJLSndRdlZyZjdqR2RBdkx0?=
 =?utf-8?B?ZHZIM2hUUmdDS0tNZmVWSTRhT01ibkFhYkZ6TzR0eHdOdHlDbzJUTktxUE1K?=
 =?utf-8?B?VTZ2TGlNeDZUQzJLMlRMYlBuQXVPeDlHY3d3U01aa2VhZGRVZEo0NUJIbXRt?=
 =?utf-8?B?MHdmeUVaQTdRR2JzcW5hWmo5eUFIWFVyOERLU1FnUHdzWWQ2RHNBQ09qaFNj?=
 =?utf-8?B?SkdFZGR6QjV0SXRPYmxmOWU1K2xlb0Z2RHNOKzZUMUNQSnZGZERydmI4eFpu?=
 =?utf-8?B?UDNwRy8wNEl1VGQ1NzltMHlTM201UTlWN1ZRUU9Gdy93bTNYcHRPWlJ0Q05Q?=
 =?utf-8?B?Wk1teW50M3pJWWlJL1pZYy9KSFZFMEZ2dnp2ckZtaHlScFRvZENtQXJheTkx?=
 =?utf-8?B?ZWloS294M2F1NkdFNVZ3OFY1cWN0NldmWFFOT3NVZ2VneGN2MjJtOVdJOE9L?=
 =?utf-8?B?K1VnZ0JHYWtsQlJMUmhkekFzTTVvY1o1OUJPeTI5NE5KQVF3VTZOMlQ3ZG1y?=
 =?utf-8?B?b1pkYUYwNUg3NU1IaUFWd0tkZ29iUzFjeXNQc1h6TXU1cEFhZS8rR2RuZzY4?=
 =?utf-8?B?Q2ozZUVkMGV3UzI2VXBnL3M4bnV1K3p0aktGOTNQTEFEZkdKbEZPWVZKWUdT?=
 =?utf-8?B?eXl4M21EWkR3ZlJOa0ZFQW5wWDRzSnQzbU5QanRpdFdUZHBubER2NlZtTS9V?=
 =?utf-8?B?U0NEY1lLWkFpYTA5QXJRTythWU9INm9KZFR4bFRITnl5V2Q4YjNiUWhiQWs0?=
 =?utf-8?B?UjZOMityZmxmQmYwU0tNKzJVNzMyN1dmWm1GRDFna3Y1YWtaRzRVNE5mSGwx?=
 =?utf-8?B?L2w2UmNJWHBaVTlQS2ZDVDZMTzF1WmxXWkFFUXNUQjE2SzZKaEQrVUR3Sldl?=
 =?utf-8?B?WTZaMCsxbEhhUGp0RkhaYlRZWjVUSzZ1YzVCbDNCYTROQWVpemFablFrSmNr?=
 =?utf-8?B?OUZGTlJsdnI2RVdGQ3dWUDd3TjZTVFZ6aDNuNFFuUHc4WU00Um9BTzd4S2lE?=
 =?utf-8?B?U25NZWRDaE9jWVpjM2IvN0lFdnI4QUlwUThac1NESm9pQm45NFBJdkFmbTZD?=
 =?utf-8?B?K0Z0bkFlcDQvQ2pRWk1JVnltZk5iMzBVZlg0Z1RGd3hkd1BCMnN2bUJUci9F?=
 =?utf-8?B?YmZjUi9zMllGb1c4NVdlaVJmaXVGZk9DdFltcGxmUXBCTDNFYjB6VFgxL1F5?=
 =?utf-8?B?SGxuY2NmNnJJZVI3QkJINW5VMUZOM1RBRnZ2OURpUWk1TzMzNEw4bWc0ejYx?=
 =?utf-8?B?aGdlT3hZSURvTjZPbDZBZmoybWI1NUpOaDJXMXlKbENkRHFhS3BVME9haTM3?=
 =?utf-8?B?N1I0aHQ3RW0zU0YzMHdZa0tDQzhmaHNvVzF4ZUxKZzNEQUZuR0lET1cxMjVV?=
 =?utf-8?B?Q3p3NzJ3aGVxczFOSGNzYSt1U1B6aFRFYUpoeU1MT1JrVm9WTi9yM0QvdGMy?=
 =?utf-8?B?V0VMK3dURUVmMEt5bXlFSXY4cUY4VkprUWRYRlRwaThwd1hRZENIMmxEcUtn?=
 =?utf-8?B?K3JhYTNwQkRSUmNCcmV2T2lYTVE5YnFrcyt5dGxDTUM4bG5pdFJ6bnB3dy92?=
 =?utf-8?B?Q3Z3ZzNSQlhvck5uTDY0NnJ5cTBRemN4OHhzazJFT3ZtQzdZUFZyNll5QTRO?=
 =?utf-8?B?cWRCQzBDQzNBVnJKeWwxblViU1FUdEw4YzExYXZUM2lxVUZFaVVtczNoTXhM?=
 =?utf-8?B?eHdYbm1xVUpoMmxpZ1pnQktUaUJvL0xrRXVIOHJwNUNQK2liYTV1aVhNc1hB?=
 =?utf-8?B?djNJMmxaS3lURG9zZ3Jmbms0SmQ0UEUrY01ZRWZhblpvZ2FGa1AyZ0ZuNC9z?=
 =?utf-8?B?TGQvN1ZDdlJCVytDSEtGbDcxQ0FtZCt5VUdidThvemhLYUFFYjJYS1U0Zlhw?=
 =?utf-8?B?cGZrRzFXcEl4T1IyR0wxKzBjUEhoc016aFlnZm5nb0ZsSWtNWGtyMUZ0a1RU?=
 =?utf-8?B?ZmVLWnlRRzdtakRYYTFHbEJUbllLRTc3ZnN4VEJCOU01TTErOWZWdjIzRTM1?=
 =?utf-8?B?Vk9GZEF5WUlkT2FTbTM0MzdYVFVQUG1mYlYyRm5JM3g0MFJPRTFzVGVxZzU2?=
 =?utf-8?Q?//ENqV6L0blpBKnlJ2w/G9wtO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Qr5yo57QwCJbCkVFI81EQumRoL8YtJyqNNhk1PiisvcAwo4umqrsnrRmAeF+b/EfcfOtF+lSTBZScnNBjhZ+/+aXc61J7NesdIVYEbPvcbT5vPR6AHzEEtlGHS4EiQseWOmy9RGkYRWXosCQOV+oiMd+j0Si+uSZy/2FGaFyu2y+U5udOXCCZVVtdF6yjk7vN7C7AV+k9aNIkFT5adyg3CRMBuoqFepqUWGgmcIZ4uh0XC0lHQLV+4XgMUtcmD5wEJ+sn/+0UfkGcvUIBSKwIgVgF/W8WhpZQv2pqJkN21daIchYfH2T/szItpWJuab/WDApikFlUU3HzpUryfE5onaakR/9Cug5FQCdbAChZMr5yfINEB65pTBs0UqFtTOpp4rKLaCuJyrAnB0Gm5qYHXtD2s+1gXPvmhWqsKrFDl1UfD55mOPnrDZSrS8Rkb65limoynwjOBjoQQF0KPdEN5/NaeIjizcd+m1p4yBo9f1COl3rY0NG43TSwBUwuPue89H7JmRvrQpKqhM/TBfUUMFouD07zBFwFP5G3Mp5UFx/ESk1s8BjrcZvAmjLxJi1CrT7JpaQmjDK6nuyIVJ5stbFgDssrpPlWcHgVfjs6c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94943c2e-7052-4584-f24e-08de3c69f195
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:11:26.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaOygyHA9lkzfLI8wwf4/wPvdxfQwQqz6zmXhuHI7p/UncWgQxBaJGVcoLfZWfSIltgvT2WdGabVV5Z6FrjtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512160048
X-Proofpoint-ORIG-GUID: _kTitt5hPqffr6y7boD46U7-KV0Q_wcv
X-Proofpoint-GUID: _kTitt5hPqffr6y7boD46U7-KV0Q_wcv
X-Authority-Analysis: v=2.4 cv=et/SD4pX c=1 sm=1 tr=0 ts=6940f81a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=-bMhQ6iiAAAA:8 a=imnVqbrq-AsuyA02W_IA:9
 a=4SCo7kKI6wFXW_pn:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-v1MBfbDw80A:10
 a=ccI9GnBFVOAA:10 a=YtyDI5NwW8oA:10 a=tP-YDM5l0ZsA:10 a=-y5_LWEbUKIA:10
 a=IQMH9J1fxScA:10 a=RPlHiC3S0lIA:10 a=aViEl8YYgB_fEZN5ws7z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0OSBTYWx0ZWRfXx2dhb0DauU8G
 icAPobcA+ECCJFBoDVJoaoi/9dNgD2ZzNklcYP7g2wfZWm/1krhs70bw4V1p5A5lUFSk4gS+ZiM
 SMFAGOjuGwdcPWP9SCw2ehX7cVhosfUOiGUdFT1LLHbxyKzmqAYAiZU4bw6khCaFYoXXwP/N3Ss
 YC7AieOB4Kz1HavnE246zkY6TmVVYj+/+8nY5xv/NZZdwgeA/vK5m7bpKK4n1JieU6Eg7/Gh//t
 Oth8UvvStsrdWYFCClAZ8vSdXk5gVchn0JzRwDjxa7XrWk9UMbI6VsPqUAYa4DZFEPq35h+QUzG
 4bhndXNA6C9FeQr3SwEeIUPW4lH9TAtUOqIFEcrwzIE1UTO9SujIrOL/oaWiP2Z6sbSXHDGdQiy
 6EF1TXQKA5LSNh6yUWnFGyDV+aiWKA==

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 Build                                         |    4 +-
 doc/tutorial/1.IntroducingDTrace.md           |  380 ++++
 .../2.TracingOperatingSystemBehavior.md       | 1741 +++++++++++++++++
 .../3.TracingUserSpaceApplications.md         |  832 ++++++++
 doc/tutorial/4.GoingFurtherWithDTrace.md      |   14 +
 doc/tutorial/index.md                         |   15 +
 6 files changed, 2985 insertions(+), 1 deletion(-)
 create mode 100644 doc/tutorial/1.IntroducingDTrace.md
 create mode 100644 doc/tutorial/2.TracingOperatingSystemBehavior.md
 create mode 100644 doc/tutorial/3.TracingUserSpaceApplications.md
 create mode 100644 doc/tutorial/4.GoingFurtherWithDTrace.md
 create mode 100644 doc/tutorial/index.md

diff --git a/Build b/Build
index 220c97845..434f8ad92 100644
--- a/Build
+++ b/Build
@@ -3,14 +3,16 @@
 
 install::
 	mkdir -p $(INSTDOCDIR)
+	mkdir -p $(INSTDOCDIR)/tutorial
 	mkdir -p $(INSTDOCDIR)/userguide
 	mkdir -p $(INSTDOCDIR)/userguide/explanation
 	mkdir -p $(INSTDOCDIR)/userguide/how-to
 	mkdir -p $(INSTDOCDIR)/userguide/reference
 	mkdir -p $(INSTDOCDIR)/examples/
 	mkdir -p $(INSTDOCDIR)/examples/language_features
-	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS userguide examples)
+	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS tutorial userguide examples)
 	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
+	install -m 644 doc/tutorial/*.md $(INSTDOCDIR)/tutorial
 	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
 	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
 	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
new file mode 100644
index 000000000..c91cf88e4
--- /dev/null
+++ b/doc/tutorial/1.IntroducingDTrace.md
@@ -0,0 +1,380 @@
+
+## Introducing DTrace
+
+This chapter introduces the dynamic tracing (DTrace) facility,
+available on Linux.
+You can use DTrace to examine the behavior of the operating system
+and of user-space programs, particularly those that have been
+instrumented with DTrace probes.
+DTrace has been implemented on Linux using eBPF,
+allowing DTrace to run as a user-space tool,
+albeit as root for most uses.
+
+### About This Tutorial
+
+This tutorial includes a variety of DTrace scripts and describes
+different ways in which you can use DTrace.
+Several examples have additional exercises that offer further
+practice in using DTrace.
+You should already have a good understanding of Linux administration
+and system programming, and broad experience using a programming language,
+such as C or C++, and a scripting language, such as Python.
+If you are not familiar with terms such as *system call*, *type*,
+*cast*, *signal*, *struct*, or *pointer*,
+you might have difficulty in understanding some of the examples
+or completing some of the exercises in this tutorial.
+However, each exercise provides a sample solution in case you do get stuck.
+You are encouraged to experiment with the examples to develop your
+skills at creating DTrace scripts.
+
+>Caution:
+>
+>To run the examples and perform the exercises in this tutorial,
+you need to have `root` access to a system.
+Only the `root` user or a user with `sudo` access to run commands
+as `root` can use the `dtrace` utility.
+As `root`, you have total power over a
+system and so have total responsibility for that system.
+Although DTrace is designed so that you can use it safely
+without needing to worry about corrupting the operating system
+or other processes,
+there are ways to circumvent some of the default, built-in safety measures.
+>
+>To minimize risk, perform the examples and exercises in this
+tutorial on a system other than a production system.
+>
+>Also, make sure that `/usr/sbin` is before `/usr/bin` in the root path,
+or specify `/usr/sbin/dtrace` explicitly.
+
+The examples in this tutorial demonstrate the different ways that
+you can perform dynamic tracing of your system: by entering a
+simple D program as an argument to `dtrace` on
+the command line, by using the `dtrace` command
+to run a script that contains a D program, or by using an
+executable D script that contains a *hashbang*
+(`#!` or *shebang*) invocation of `dtrace`.
+When you create your own D programs,
+you can choose which method best suits your needs.
+
+### About DTrace
+
+DTrace is a comprehensive dynamic tracing facility that was first
+developed for use on the Solaris operating system (now known as
+Oracle Solaris) and subsequently ported to Oracle Linux.
+You can use
+DTrace to explore the operation of your system to better
+understand how it works, to track down performance problems across
+many layers of software, or to locate the causes of aberrant
+behavior.
+
+Using DTrace, you can record data at previously instrumented
+places of interest, which are referred to as
+*probes*, in kernel and user-space programs.
+A probe is a location to which DTrace can bind a request to perform
+a set of actions, such as recording a stack trace, a timestamp, or
+the argument to a function.
+Probes function like programmable
+sensors that record information.
+When a probe is triggered, DTrace
+gathers data that you have designated in a D script and reports
+this data back to you.
+
+Using DTrace's D programming language, you can query the system
+probes to provide immediate and concise answers to any number of
+questions that you might formulate.
+
+A D program describes the actions that occur if one or more
+specified probes is triggered.
+A probe is uniquely specified by
+the name of the DTrace provider that publishes the probe, the name
+of the module, library, or user-space program in which the probe
+is located, the name of the function in which the probe is
+located, and the name of the probe itself, which usually describes
+some operation or functionality that you can trace.
+Because you do
+not need to specify probes exactly, this allows DTrace to perform
+the same action for a number of different probes.
+Full and
+explicit representation of a single probe in the D language takes
+the form *provider*:*module*:*function*:*name*.
+
+When you use the `dtrace` command to run a D
+program, you invoke the compiler for the D language.
+The compiled code, eBPF instructions, is loaded into the kernel
+and attached to the appropriate probes.
+DTrace handles any runtime errors that might occur
+during your D program's execution, including dividing by zero,
+dereferencing invalid memory, and so on, and reports them to you.
+
+The *module* is the kernel module in which a probe appears or,
+in the case of user code, the load object.  Some probes, such
+as clock-triggered profiling interrupts, have no module associated
+with them.
+
+Unless you explicitly permit DTrace to perform potentially
+destructive actions, you cannot construct an unsafe program that
+would cause DTrace to inadvertently damage either the operating
+system or any process that is running on your system. These safety
+features enable you to use DTrace in a production environment
+without worrying about crashing or corrupting your system. If you
+make a programming mistake, DTrace reports the error and
+deactivates your program's probes. You can then correct your
+program and try again.
+
+For more information about using DTrace, see the
+[DTrace User Guide](../userguide/index.md).
+
+### About DTrace Providers
+
+Here are the providers in the Oracle Linux implementation of DTrace:
+
+```
+           kernel       user space
+     +-----------------------------+
+     |             dtrace          |  I want to control my D program.
+     +----------------+------------+
+     |                |  syscall   |  I want to see how I call the kernel.
+     +----------------+------------+
+     |          cpc profile        |  I want to look at resource usage.
+     +----------------+------------+
+     | ip tcp udp     |            |
+     | io lockstat    |            |  I know the semantics of the code.
+     | sdt rawtp      | usdt       | (I know what probes are in the code.)
+     | proc sched     |            |
+     +----------------+------------+
+     | fbt rawfbt     | pid        |  I know the functions of the code.
+     +----------------+------------+
+```
+
+That is, these providers provide:
+
+- `dtrace`: probes that relate to DTrace itself,
+    such as `BEGIN`, `ERROR`, and `END`.
+    You can use these probes to initialize DTrace's state before
+    tracing begins, process its state after tracing has completed,
+    and handle unexpected execution errors in other probes.
+- `syscall`: probes that fire at the entry to and return from every system call.
+    Because system calls are the primary interface between user-level
+    applications and the operating system kernel, these probes can
+    offer you an insight into the interaction between applications and
+    the system.
+- `cpc`: probes that fire when hardware resource counters (or
+    software emulation thereof) trip, giving you an idea of
+    where statistically hardware events are triggered.
+- `profile`: probes that fire at fixed and specified time intervals.
+    You can use these probes to sample some aspect of a system's state.
+- `ip`: probes that fire for important steps in the IP protocol,
+    for both IPv4 and IPv6.
+- `tcp`: probes that fire for important steps in the TCP protocol,
+   for both IPv4 and IPv6.
+- `udp`: probes that fire for important steps in the the UDP protocol,
+    for both IPv4 and IPv6.
+- `io`: probes that relate to data input and output.
+    The `io` provider enables quick exploration of behavior
+    observed through I/O monitoring.
+- `lockstat`: probes that fire for important steps in lock handling,
+    including for mutexes, read-write locks, and spin locks.
+- `sdt`: probes that fire when statically defined tracepoints in the Linux kernel
+    are executed.
+- `rawtp`: probes that fire when statically defined tracepoints in the Linux kernel
+    are executed, but report raw arguments.
+- `proc`: probes that fire for process creation and termination, LWP creation
+    and termination, execution of new programs, and signal handling.
+- `sched`: probes that fire for important steps in CPU scheduling.
+    Because CPUs are the one resource that all threads must consume,
+    the `sched` provider is very useful for understanding systemic behavior.
+- `usdt`: probes that fire when user-space statically defined trace points
+    are encountered.
+- `fbt`: probes that fire for function boundary tracing (FBT) -- that is,
+    when kernel functions are entered or return.
+- `rawfbt`: probes that are like `fbt`, but are implemented with `kprobes`,
+    include synthetic functions (such as compiler-generated optimized
+    variants of functions with `.` suffixes.), and have unconverted and
+    untyped probe arguments.
+- `pid`: probes that fire for the specified process id (`pid`) upon
+    entry into or return from a function.
+
+See [DTrace Providers](../userguide/reference/dtrace_providers.md) in
+the [DTrace User Guide](../userguide/index.md)
+for more information about providers and their probes.
+
+### Preparing to Install and Configure DTrace
+
+DTrace is available for Linux from
+[github](https://github.com/oracle/dtrace-utils/tree/stable).
+Or, there are
+[DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
+
+#### Example: Displaying Probes for a Provider
+
+The following example shows how you would display the probes
+for a provider, such as `proc`, by using the `dtrace` command.
+
+```
+# dtrace -l -P proc
+   ID   PROVIDER    MODULE          FUNCTION NAME
+   53       proc   vmlinux                   start
+   52       proc   vmlinux                   signal-send
+   51       proc   vmlinux                   signal-handle
+   50       proc   vmlinux                   signal-discard
+   49       proc   vmlinux                   signal-clear
+   48       proc   vmlinux                   lwp-start
+   47       proc   vmlinux                   lwp-exit
+   46       proc   vmlinux                   lwp-create
+   45       proc   vmlinux                   exit
+   44       proc   vmlinux                   exec-success
+   43       proc   vmlinux                   exec-failure
+   42       proc   vmlinux                   exec
+   41       proc   vmlinux                   create
+```
+
+These probes enable you to monitor how the system creates
+processes, executes programs, and handles signals.
+
+The output shows the numeric identifier of the probe, the name
+of the probe provider, the name of the probe module, the name
+of the function that contains the probe (none for this provider),
+and the name of the probe itself.
+
+The full name of a probe is *provider*:*module*:*function*:*name*,
+for example, `proc:vmlinux::create`.
+
+When probes are listed, a missing field indicates there is no
+corresponding value.
+When you specify a probe, omitting a field is equivalent to using
+the wildcard `*`.
+
+#### Exercise: Enabling and Listing DTrace Probes
+
+Try listing the probes of the `syscall` provider.
+Notice that both `entry` and `return` probes are provided for each system call.
+
+#### Solution to Exercise: Enabling and Listing DTrace Probes
+
+```
+# dtrace -l -P syscall
+   ID  PROVIDER     MODULE          FUNCTION NAME
+ 5055   syscall    vmlinux            socket entry
+ 5054   syscall    vmlinux            socket return
+ 5053   syscall    vmlinux        socketpair entry
+ 5052   syscall    vmlinux        socketpair return
+ 5051   syscall    vmlinux              bind entry
+ 5050   syscall    vmlinux              bind return
+ 5049   syscall    vmlinux            listen entry
+ 5048   syscall    vmlinux            listen return
+ ...
+ 4375   syscall    vmlinux            ioperm entry
+ 4374   syscall    vmlinux            ioperm return
+ 4373   syscall    vmlinux              iopl entry
+ 4372   syscall    vmlinux              iopl return
+ 4371   syscall    vmlinux      rt_sigreturn entry
+ 4370   syscall    vmlinux      rt_sigreturn return
+ 4369   syscall    vmlinux        arch_prctl entry
+ 4368   syscall    vmlinux        arch_prctl return
+```
+
+The probe ID numbers can differ from run to run.
+
+### Running a Simple DTrace Program
+
+The following example shows how you could use a simple D program
+that is in a file called `hello.d`.
+
+#### Example: Simple D Program That Uses the BEGIN Probe (hello.d)
+
+```
+/* hello.d -- A simple D program that uses the BEGIN probe */
+
+BEGIN
+{
+    /* This is a C-style comment */
+    trace("hello, world");
+    exit(0);
+}
+```
+
+A D program consists of a series of clauses, where each clause
+describes one or more probes to enable, and an optional set of actions
+to perform when the probe fires. The actions are listed as a series
+of statements enclosed in braces `{}` following the probe name.
+Each statement ends with a semicolon (`;`).
+
+In this example, the function `trace` directs DTrace to record the
+specified argument, the string ”hello, world”, when the `BEGIN` probe fires,
+and then print it out.
+The function `exit()` tells DTrace to cease tracing and exit the `dtrace`
+command.
+
+The full name of the `BEGIN` probe is `dtrace:::BEGIN`.
+The `dtrace` provider provides three probes: `dtrace:::BEGIN`,
+`dtrace:::END`, and `dtrace:::ERROR`.
+Because these probe names are unique to the `dtrace` provider,
+their names can be shortened to `BEGIN`, `END`, and `ERROR`.
+
+When you have saved your program, you can run it by using the
+`dtrace` command with the `-s` option,
+which specifies the name of the file that contains the D program:
+
+```
+# dtrace -s hello.d
+dtrace: script 'hello.d' matched 1 probe
+CPU     ID                    FUNCTION:NAME
+  0      1                           :BEGIN   hello, world
+```
+
+DTrace interprets and runs the script. You will notice
+that in addition to the string `"hello,world"`,
+the default behavior of DTrace is to display information about
+the CPU on which the script was running when a probe fired,
+the ID of the probe, the name of the function that contains
+the probe, and the name of the probe itself.
+The function name is displayed as blank for `BEGIN`,
+as DTrace provides this probe.
+
+You can suppress the probe information in a number of different
+ways, for example, by specifying the `-q` quiet option:
+
+```
+# dtrace -q -s hello.d
+hello, world
+```
+
+#### Exercise: Using the END Probe
+
+Copy the `hello.d` program to the file `goodbye.d`.
+Edit this file so that it traces the string "goodbye, world"
+and uses the `END` probe instead of `BEGIN`.
+When you run this new script, you need to type `Ctrl-C` to cause the
+probe to fire and exit `dtrace`.
+
+#### Solution to Exercise and Example: Using the END Probe
+
+The following is an example of a simple D program that
+demonstrates the use of the `END` probe:
+
+```
+/* goodbye.d -- Simple D program that demonstrates the END probe */
+
+END
+{
+  trace("goodbye, world");
+}
+```
+
+The default output is:
+
+```
+# dtrace -s goodbye.d
+dtrace: script 'goodbye.d' matched 1 probe
+^C
+CPU     ID                    FUNCTION:NAME
+  3      2                             :END   goodbye, world
+```
+
+Or, with the `-q` quiet option:
+
+```
+# dtrace -q -s ./goodbye.d
+^C
+goodbye, world
+```
diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
new file mode 100644
index 000000000..b3445ab6d
--- /dev/null
+++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
@@ -0,0 +1,1741 @@
+
+## Tracing Operating System Behavior
+
+This chapter provides examples of D programs that you can use to
+investigate what is happening in the operating system.
+
+### Tracing Process Creation
+
+The `proc` probes enable you to trace process creation and termination,
+execution of new program images, and signal processing on a system. See
+[Proc Provider](../userguide/reference/dtrace_providers_proc.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of the `proc` probes and their arguments.
+
+#### Example: Monitoring the System as Programs Are Executed (execcalls.d)
+
+The following example shows the D program, `execcalls.d`, which uses
+`proc` probes to monitor the system as it executes process images:
+
+```
+/* execcalls.d -- Monitor the system as it executes programs */
+
+proc:::exec
+{
+  trace(stringof(args[0]));
+}
+```
+
+The `args[0]` argument to the `exec` probe is set to the path name of the
+program that is being executed.
+You use the `stringof()` function to convert the type from
+`char *` to the D type `string`.
+
+Type the `dtrace -s execcalls.d` command to run the D program in one window.
+Then start different programs from another window,
+while observing the output from `dtrace` in the first window.
+To stop tracing after a few seconds have elapsed,
+type `Ctrl-C` in the window that is running `dtrace`.
+
+```
+# dtrace -s execcalls.d
+dtrace: script 'execcalls.d' matched 1 probe
+CPU     ID                    FUNCTION:NAME
+  3     42                            :exec   /usr/sbin/sshd
+  1     42                            :exec   /bin/bash
+  0     42                            :exec   /usr/bin/id
+  2     42                            :exec   /usr/bin/hostnamectl
+  1     42                            :exec   /usr/lib/systemd/systemd-hostnamed
+  3     42                            :exec   /usr/bin/register-python-argcomplete
+  3     42                            :exec   /usr/libexec/grepconf.sh
+  0     42                            :exec   /usr/bin/grep
+  2     42                            :exec   /usr/bin/dircolors
+  3     42                            :exec   /usr/bin/grep
+  3     42                            :exec   /usr/libexec/grepconf.sh
+^C
+```
+
+The activity here shows a login to the same system (from another
+terminal) while the script is running.
+
+The probe `proc:::exec` fires whenever the system executes a new program and
+the associated action uses `trace()` to display the path name of the program.
+
+#### Exercise: Suppressing Verbose Output From DTrace
+
+Run the `execcalls.d` program again, but this time add the
+`-q` option to suppress all output except output from `trace()`.
+Notice how DTrace displays only what you traced with `trace()`.
+
+#### Solution to Exercise: Suppressing Verbose Output From DTrace
+
+```
+# dtrace -q -s execcalls.d
+/usr/sbin/sshd/bin/bash/usr/bin/id/usr/bin/hostnamectl/usr/lib/systemd/systemd-h
+ostnamed/usr/bin/register-python-argcomplete/usr/libexec/grepconf.sh/usr/bin/gre
+p/usr/bin/dircolors/usr/bin/grep/usr/libexec/grepconf.sh^C
+```
+
+### Tracing System Calls
+
+System calls are the interface between user programs and the
+kernel, which perform operations on the programs' behalf.
+
+The next example shows the next D program,
+`syscalls.d`, which uses
+`syscall` probes to record
+`open()` system call activity on a system.
+
+#### Example: Recording open() System Calls on a System (syscalls.d)
+
+```
+/* syscalls.d -- Record open() system calls on a system */
+
+syscall::open:entry
+{
+  printf("%-16s %-16s\n",execname,copyinstr(arg0));
+}
+syscall::openat*:entry
+{
+  printf("%-16s %-16s\n",execname,copyinstr(arg1));
+}
+```
+
+In this example, the `printf()` function is used to display the
+name of the executable that is calling `open()` and the path name
+of the file that it is attempting to open.
+
+>Note:
+>
+>Use the `copyinstr()` function to convert the first argument (`arg0`)
+in the `open()` call to a string.
+Whenever a probe accesses a pointer to data in the address space of a user process,
+you must use one of the `copyin()`, `copyinstr()`, or `copyinto()` functions
+to copy the data from user space to a DTrace buffer in kernel space.
+In this example, it is appropriate to use `copyinstr()`,
+as the pointer refers to a character array.
+If the string is not null-terminated, you also need to specify the
+length of the string to `copyinstr()`, for example,
+`copyinstr(arg1, arg2 + 1)`, for a system call such as `write()`,
+to copy arg2 bytes and then add a NUL terminating character after those bytes,
+which are possibly already NUL-terminated.
+See
+[Pointers and Address Spaces](../userguide/reference/dtrace-ref-PointersandScalarArrays.md#pointers_and_address_spaces)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+```
+# dtrace -q -s syscalls.d
+irqbalance       /proc/interrupts
+irqbalance       /proc/stat      
+irqbalance       /proc/interrupts
+irqbalance       /proc/stat      
+irqbalance       /proc/interrupts
+irqbalance       /proc/stat      
+NetworkManager   /proc/sys/net/ipv6/conf/enX0/mtu
+irqbalance       /proc/interrupts
+irqbalance       /proc/stat      
+systemd          /proc/1200459/cgroup
+NetworkManager   /proc/sys/net/ipv6/conf/enX0/mtu
+^C
+```
+
+#### Exercise: Using the printf() Function to Format Output
+
+Amend the arguments to the `printf()` function so that `dtrace`
+also prints the process ID and user ID for the process.
+Use a conversion specifier such as `%-4d`.
+
+See
+[printf](../userguide/reference/function_printf.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of the function.
+
+The process ID and user ID are available as the variables
+`pid` and `uid`. Use the
+`BEGIN` probe to create a header for the
+output.
+
+#### Solution to Exercise: Using the printf() Function to Format Output
+
+```
+/* syscalls1.d -- Modified version of syscalls.d that displays more information */
+
+BEGIN
+{
+  printf("%-7s %-4s %-16s %-16s\n","PID","UID","EXECNAME","FILENAME");
+  mypid = pid;
+}
+
+syscall::open:entry
+/pid != mypid/
+{
+  printf("%-7d %-4d %-16s %-16s\n",pid,uid, execname,copyinstr(arg0));
+}
+syscall::openat*:entry
+/pid != mypid/
+{
+  printf("%-7d %-4d %-16s %-16s\n",pid,uid, execname,copyinstr(arg1));
+}
+```
+
+Note how this solution uses similar formatting strings to output
+the header and the data.
+Also, we add *predicates* to exclude probes that fire on the `dtrace`
+process itself.
+
+```
+# dtrace -q -s syscalls1.d
+PID     UID  EXECNAME         FILENAME
+2852652 0    nm-daemon-helpe  /etc/ld.so.cache
+2852652 0    nm-daemon-helpe  /lib64/libgcc_s.so.1
+2852652 0    nm-daemon-helpe  /lib64/libc.so.6
+2852652 0    nm-daemon-helpe  /etc/nsswitch.conf
+2852652 0    nm-daemon-helpe  /etc/host.conf
+2852652 0    nm-daemon-helpe  /etc/resolv.conf
+2852652 0    nm-daemon-helpe  /etc/hosts
+2852653 0    nm-daemon-helpe  /etc/ld.so.cache
+2852653 0    nm-daemon-helpe  /lib64/libgcc_s.so.1
+2852653 0    nm-daemon-helpe  /lib64/libc.so.6
+2852653 0    nm-daemon-helpe  /etc/nsswitch.conf
+2852653 0    nm-daemon-helpe  /etc/host.conf
+2852653 0    nm-daemon-helpe  /etc/resolv.conf
+2852653 0    nm-daemon-helpe  /etc/hosts
+1200456 0    irqbalance       /proc/interrupts
+1200456 0    irqbalance       /proc/stat
+1       0    systemd          /proc/1200459/cgroup
+1       0    systemd          /proc/1200460/cgroup
+^C
+```
+
+### Performing an Action at Specified Intervals
+
+The `profile` provider includes `tick` probes that you can use
+to sample some aspect of a system's state at regular intervals.
+
+#### Example: Using `tick.d`
+
+The following is an example of the `tick.d` program.
+
+```
+/* tick.d -- Perform an action at regular intervals */
+
+BEGIN
+{
+  i = 0;
+}
+
+profile:::tick-1sec
+{
+  printf("i = %d\n",++i);
+}
+
+END
+{
+  trace(i);
+}
+```
+
+In this example, the program initializes (and thereby implicitly
+declares) the variable `i` when the D program starts,
+increments the variable and prints its value once every second,
+and displays the final value of `i` when the program exits.
+
+When you run this program, it produces output that is similar to
+the following, until you type `Ctrl-C`:
+
+```
+# dtrace -s tick.d
+dtrace: script 'tick.d' matched 3 probes
+CPU     ID                    FUNCTION:NAME
+  1   5315                       :tick-1sec i = 1
+
+  1   5315                       :tick-1sec i = 2
+
+  1   5315                       :tick-1sec i = 3
+
+  1   5315                       :tick-1sec i = 4
+
+  1   5315                       :tick-1sec i = 5
+
+  1   5315                       :tick-1sec i = 6
+
+^C
+  1   5315                       :tick-1sec i = 7
+
+  0      2                             :END         7
+```
+
+To suppress all of the output except the output from
+`printf()` and `trace()`, specify the `-q` option:
+
+```
+# dtrace -q -s tick.d
+i = 1
+i = 2
+i = 3
+i = 4
+^C
+i = 5
+5
+```
+
+#### Exercise: Using tick Probes
+
+List the available `profile` provider probes.
+Experiment with using a different `tick` probe.
+Replace the `trace()` call in
+`END` with a `printf()` call.
+
+See
+[Profile Provider](../userguide/reference/dtrace_providers_profile.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of the probes.
+
+#### Solution to Exercise and Example: Using tick Probes
+
+```
+# dtrace -l -P profile
+  ID   PROVIDER           MODULE               FUNCTION NAME
+   5    profile                                         profile-97
+   6    profile                                         profile-199
+   7    profile                                         profile-499
+   8    profile                                         profile-997
+   9    profile                                         profile-1999
+  10    profile                                         profile-4001
+  11    profile                                         profile-4999
+  12    profile                                         tick-1
+  13    profile                                         tick-10
+  14    profile                                         tick-100
+  15    profile                                         tick-500
+  16    profile                                         tick-1000
+  17    profile                                         tick-5000
+5315    profile                                         tick-1sec
+5316    profile                                         tick-10sec
+```
+
+#### Example: Modified Version of tick.d
+
+```
+/* tick1.d -- Modified version of tick.d */
+
+BEGIN
+{
+  i = 0;
+}
+
+/* tick-500ms fires every 500 milliseconds */
+profile:::tick-500ms
+{
+  printf("i = %d\n",++i);
+}
+
+END
+{
+  printf("\nFinal value of i = %d\n",i);
+}
+```
+
+This example uses the `tick-500ms` probe,
+which fires twice per second.
+
+```
+# dtrace -s tick1.d
+dtrace: script 'tick1.d' matched 3 probes
+CPU     ID                    FUNCTION:NAME
+  2    642                      :tick-500ms i = 1
+
+  2    642                      :tick-500ms i = 2
+
+  2    642                      :tick-500ms i = 3
+
+  2    642                      :tick-500ms i = 4
+
+^C
+  2    642                      :tick-500ms i = 5
+
+  3      2                             :END
+Final value of i = 5
+```
+
+### Using Predicates to Select Actions
+
+Predicates are logic statements that choose whether DTrace invokes
+the actions that are associated with a probe. You can use
+predicates to focus tracing analysis on specific contexts under
+which a probe fires.
+
+#### Example: Using daterun.d
+
+The following example shows an executable DTrace script, `daterun.d`, which
+displays the file descriptor, output string, and string length specified to
+the `write()` system call whenever the `date` command is run on the system.
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* daterun.d -- Display arguments to write() when date runs */
+
+syscall::write:entry
+/execname == "date"/
+{
+  printf("%s(%d, %s, %d)\n", probefunc, arg0, copyinstr(arg1, arg2 + 1), arg2);
+}
+```
+
+In the example, the predicate is `/execname == "date"/`, which
+specifies that if the probe `syscall::write:entry` is triggered,
+DTrace runs the associated action only if the name of the executable is `date`.
+The `copyinstr()` string will have room for `arg2+1` bytes,
+including a NUL-terminated byte in case the first `arg2` bytes need it.
+
+Make the script executable by changing its mode:
+
+```
+# chmod +x daterun.d
+```
+
+If you run the script from one window,
+while typing the `date` command in another window,
+output similar to the following is displayed in the first window:
+
+```
+# ./daterun.d
+write(1, Tue Dec  9 11:14:43 GMT 2025
+, 29)
+```
+
+#### Example: Listing Available syscall Provider Probes
+
+The following example shows how you would list available
+`syscall` provider probes.
+
+```
+# dtrace -l -P syscall | less
+   ID   PROVIDER            MODULE                 FUNCTION NAME
+   18    syscall           vmlinux                     read entry
+   19    syscall           vmlinux                     read return
+   20    syscall           vmlinux                    write entry
+   21    syscall           vmlinux                    write return
+   22    syscall           vmlinux                     open entry
+   23    syscall           vmlinux                     open return
+   24    syscall           vmlinux                    close entry
+   25    syscall           vmlinux                    close return
+   26    syscall           vmlinux                  newstat entry
+   27    syscall           vmlinux                  newstat return
+...
+  648    syscall           vmlinux               pkey_alloc entry
+  649    syscall           vmlinux               pkey_alloc return
+  650    syscall           vmlinux                pkey_free entry
+  651    syscall           vmlinux                pkey_free return
+  652    syscall           vmlinux                    statx entry
+  653    syscall           vmlinux                    statx return
+  654    syscall           vmlinux                   waitfd entry
+  655    syscall           vmlinux                   waitfd return
+```
+
+#### Exercise: Using syscall Probes
+
+Experiment by adapting the `daterun.d` script for another program.
+Make the new script produce output when the system is running `w`.
+
+#### Solution to Exercise: Using syscall Probes
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* wrun.d -- Modified version of daterun.d for the w command */
+
+syscall::write:entry
+/execname == "w"/
+{
+  printf("%s(%d, %s, %d)\n", probefunc, arg0, copyinstr(arg1, arg2 + 1), arg2);
+}
+```
+
+We can run the script as follows:
+
+```
+# chmod +x wrun.d
+# ./wrun.d
+write(1,  12:14:55 up  3:21,  3 users,  load average: 0.14, 0.15, 0.18
+, 62)
+write(1, USER     TTY      FROM      LOGIN@   IDLE   JCPU   PCPU WHAT
+, 61)
+write(1, guest    pts/0    :0.0     08:57    7.00s  0.17s  0.03s w
+, 58)
+...
+^C
+```
+
+### Timing Events on a System
+
+Determining the time that a system takes to perform different
+activities is a fundamental technique for analyzing its operation
+and determining where bottlenecks might be occurring.
+
+#### Example: Monitoring read() System Call Duration (readtrace.d)
+
+The following is an example of the D program, `readtrace.d`.
+
+```
+/* readtrace.d -- Display time spent in read() calls */
+
+syscall::read:entry
+{
+  self->t = timestamp; /* Initialize a thread-local variable */
+}
+
+syscall::read:return
+/self->t != 0/
+{
+  printf("%s (pid=%d) spent %d microseconds in read()\n",
+  execname, pid, ((timestamp - self->t)/1000)); /* Divide by 1000 for microseconds */
+
+  self->t = 0; /* Reset the variable */
+}
+```
+
+In the example, the `readtrace.d` program displays the command name,
+process ID, and call duration in microseconds whenever a process
+invokes the `read()` system call.
+The variable `self->t` is *thread-local*,
+meaning that it exists only within the scope of execution of a
+thread on the system.
+
+The program records the value of `timestamp` in `self->t` when
+the process calls `read()`, and subtracts this value from the
+value of `timestamp` when the call returns.
+The units of `timestamp` are nanoseconds,
+so you divide by 1000 to obtain a value in microseconds.
+
+The following is output from running this program:
+
+```
+# dtrace -q -s readtrace.d
+NetworkManager (pid=878) spent 10 microseconds in read()
+NetworkManager (pid=878) spent 9 microseconds in read()
+NetworkManager (pid=878) spent 2 microseconds in read()
+in:imjournal (pid=815) spent 63 microseconds in read()
+gdbus (pid=878) spent 7 microseconds in read()
+gdbus (pid=878) spent 66 microseconds in read()
+gdbus (pid=878) spent 63 microseconds in read()
+irqbalance (pid=816) spent 56 microseconds in read()
+irqbalance (pid=816) spent 113 microseconds in read()
+irqbalance (pid=816) spent 104 microseconds in read()
+irqbalance (pid=816) spent 91 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 63 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+irqbalance (pid=816) spent 61 microseconds in read()
+sshd (pid=10230) spent 8 microseconds in read()
+in:imjournal (pid=815) spent 6 microseconds in read()
+sshd (pid=10230) spent 7 microseconds in read()
+in:imjournal (pid=815) spent 5 microseconds in read()
+sshd (pid=10230) spent 7 microseconds in read()
+in:imjournal (pid=815) spent 6 microseconds in read()
+sshd (pid=10230) spent 7 microseconds in read()
+in:imjournal (pid=815) spent 5 microseconds in read()
+^C
+```
+
+#### Exercise: Timing System Calls
+
+Add a predicate to the `entry` probe in `readtrace.d` so that `dtrace`
+displays results for a disk space usage report that is selected
+by the name of its executable (`df`).
+
+#### Solution to Exercise: Timing System Calls
+
+The following example shows a modified version of the
+`readtrace.d` program that includes a predicate.
+
+```
+/* readtrace1.d -- Modified version of readtrace.d that includes a predicate */
+
+syscall::read:entry
+/execname == "df"/
+{
+  self->t = timestamp;
+}
+
+syscall::read:return
+/self->t != 0/
+{
+  printf("%s (pid=%d) spent %d microseconds in read()\n",
+  execname, pid, ((timestamp - self->t)/1000));
+
+  self->t = 0; /* Reset the variable */
+}
+```
+
+The predicate `/execname == "df"/` tests whether the
+`df` program is running when the probe fires.
+
+```
+# dtrace -q -s readtrace1.d
+df (pid=1666) spent 6 microseconds in read()
+df (pid=1666) spent 8 microseconds in read()
+df (pid=1666) spent 1 microseconds in read()
+df (pid=1666) spent 50 microseconds in read()
+df (pid=1666) spent 38 microseconds in read()
+df (pid=1666) spent 10 microseconds in read()
+df (pid=1666) spent 1 microseconds in read()
+^C
+```
+
+#### Exercise: Timing All System Calls for cp (calltrace.d)
+
+Using the `probefunc` variable and the `syscall:::entry` and
+`syscall:::return` probes, create a D program, `calltrace.d`,
+which times all system calls for the executable `cp`.
+
+#### Solution to Exercise: Timing All System Calls for cp (calltrace.d)
+
+```
+/* calltrace.d -- Time all system calls for cp */
+
+syscall:::entry
+/execname == "cp"/
+{
+  self->t = timestamp; /* Initialize a thread-local variable */
+}
+
+syscall:::return
+/self->t != 0/
+{
+  printf("%s (pid=%d) spent %d microseconds in %s()\n",
+  execname, pid, ((timestamp - self->t)/1000), probefunc);
+
+  self->t = 0; /* Reset the variable */
+}
+```
+
+Dropping the function name `read` from the probe specifications
+matches all instances of `entry` and `return` probes for `syscall`.
+The following is a check for system calls resulting from running
+the `cp` executable:
+
+```
+# dtrace -q -s calltrace.d
+cp (pid=2801) spent 4 microseconds in brk()
+cp (pid=2801) spent 5 microseconds in mmap()
+cp (pid=2801) spent 15 microseconds in access()
+cp (pid=2801) spent 7 microseconds in open()
+cp (pid=2801) spent 2 microseconds in newfstat()
+cp (pid=2801) spent 3 microseconds in mmap()
+cp (pid=2801) spent 1 microseconds in close()
+cp (pid=2801) spent 8 microseconds in open()
+cp (pid=2801) spent 3 microseconds in read()
+cp (pid=2801) spent 1 microseconds in newfstat()
+cp (pid=2801) spent 4 microseconds in mmap()
+cp (pid=2801) spent 12 microseconds in mprotect()
+   ...
+cp (pid=2801) spent 183 microseconds in open()
+cp (pid=2801) spent 1 microseconds in newfstat()
+cp (pid=2801) spent 1 microseconds in fadvise64()
+cp (pid=2801) spent 17251 microseconds in read()
+cp (pid=2801) spent 80 microseconds in write()
+cp (pid=2801) spent 58 microseconds in read()
+cp (pid=2801) spent 57 microseconds in close()
+cp (pid=2801) spent 85 microseconds in close()
+cp (pid=2801) spent 57 microseconds in lseek()
+cp (pid=2801) spent 56 microseconds in close()
+cp (pid=2801) spent 56 microseconds in close()
+cp (pid=2801) spent 56 microseconds in close()
+^C
+```
+
+### Tracing Parent and Child Processes
+
+When a process forks, it creates a child process that is effectively
+a copy of its parent process, but with a different process ID.
+For information about other differences, see the `fork(2)` manual page.
+The child process can either run independently from its parent process
+to perform some separate task.
+Or, a child process can execute a new program image that replaces
+the child's program image while retaining the same process ID.
+
+#### Example: Using proc Probes to Report Activity on a System (activity.d)
+
+The D program `activity.d` in the following example uses `proc`
+probes to report `fork()` and `exec()` activity on a system.
+
+```
+#pragma D option quiet
+
+/* activity.d -- Record fork() and exec() activity */
+
+proc:::create
+{
+  /* Extract PID of child process from the psinfo_t pointed to by args[0] */
+  childpid = args[0]->pr_pid;
+
+  time[childpid] = timestamp;
+  p_pid[childpid] = pid; /* Current process ID (parent PID of new child) */
+  p_name[childpid] = execname; /* Parent command name */
+  p_exec[childpid] = ""; /* Child has not yet been exec'ed */
+}
+
+proc:::exec
+/p_pid[pid] != 0/
+{
+  p_exec[pid] = args[0]; /* Child process path name */
+}
+
+proc:::exit
+/p_pid[pid] != 0 &&  p_exec[pid] != ""/
+{
+  printf("%s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+proc:::exit
+/p_pid[pid] != 0 &&  p_exec[pid] == ""/
+{
+  printf("%s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
+```
+
+In the example, the statement `#pragma D option quiet` has the same
+effect as specifying the `-q` option on the command line.
+
+The process ID of the child process (`childpid`), following a `fork()`,
+is determined by examining the `pr_pid` member of the `psinfo_t` data
+structure that is pointed to by the `args[0]` probe argument.
+For more information about the arguments to `proc` probes, see
+[Proc Provider](../userguide/reference/dtrace_providers_proc.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+The program uses the value of the child process ID to initialize
+globally unique associative array entries, such as `p_pid[childpid]`.
+
+>Note:
+>
+>An *associative array* is similar to a normal array, in that it associates
+keys with values, but the keys can be of any type; they need not be integers.
+
+When you run the program, you should see output similar to the following as you
+use the `ssh` command to access the same system from another terminal window.
+You might want to try running different programs from this new terminal
+window to generate additional output:
+
+```
+# dtrace -s activity.d
+sshd (3966) forked itself (as 3967) for 3667020 microseconds
+bash (3971) forked itself (as 3972) for 1718 microseconds
+bash (3973) executed /usr/bin/hostname (3974) for 1169 microseconds
+grepconf.sh (3975) forked itself (as 3976) for 1333 microseconds
+bash (3977) forked itself (as 3978) for 967 microseconds
+bash (3977) executed /usr/bin/tput (3979) for 1355 microseconds
+bash (3980) executed /usr/bin/dircolors (3981) for 1212 microseconds
+sshd (3966) executed /usr/sbin/unix_chkpwd (3968) for 31444 microseconds
+sshd (3966) executed /usr/sbin/unix_chkpwd (3969) for 1653 microseconds
+bash (3970) forked itself (as 3971) for 2411 microseconds
+bash (3970) forked itself (as 3973) for 1830 microseconds
+bash (3970) executed /usr/libexec/grepconf.sh (3975) for 3696 microseconds
+bash (3970) forked itself (as 3977) for 3273 microseconds
+bash (3970) forked itself (as 3980) for 1928 microseconds
+bash (3970) executed /usr/bin/grep (3982) for 1570 microseconds
+^C
+```
+
+#### Exercise: Using a Predicate to Control the Execution of an Action
+
+Modify `activity.d` so that `dtrace` displays results for parent processes
+that are selected by their executable name, for example, `bash`,
+or by a program name that you specify as an argument to the `dtrace` command.
+
+#### Solution to Exercise: Using a Predicate to Control the Execution of an Action
+
+The only change that is required to specify the name of an executable
+is to add a predicate to the `proc::_:create` probe, for example:
+
+```
+/execname == "bash"/
+```
+
+A more generic version of the program sets the predicate check
+value from a passed-in command-line argument instead, for example:
+
+```
+/execname == $1/
+```
+
+#### Example: Recording fork() and exec() Activity for a Specified Program (activity1.d)
+
+The following example uses a predicate that is passed in from the command line.
+
+```
+#pragma D option quiet
+
+/* activity1.d -- Record fork() and exec() activity for a specified program */
+
+proc:::create
+/execname == $1/
+{
+  /* Extract PID of child process from the psinfo_t pointed to by args[0] */
+  childpid = args[0]->pr_pid;
+
+  time[childpid] = timestamp;
+  p_pid[childpid] = pid; /* Current process ID (parent PID of new child) */
+  p_name[childpid] = execname; /* Parent command name */
+  p_exec[childpid] = ""; /* Child has not yet been exec'ed */
+}
+
+proc:::exec
+/p_pid[pid] != 0/
+{
+  p_exec[pid] = args[0]; /* Child process path name */
+}
+
+proc:::exit
+/p_pid[pid] != 0 &&  p_exec[pid] != ""/
+{
+  printf("%s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+proc:::exit
+/p_pid[pid] != 0 &&  p_exec[pid] == ""/
+{
+  printf("%s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
+```
+
+As shown in the following example, you can now specify the name
+of the program to be traced as an argument to the `dtrace` command.
+Note that you need to escape the argument to protect the double quotes
+from the shell:
+
+```
+# dtrace -s activity.d '"bash"'
+bash (10367) executed /bin/ps (10368) for 10926 microseconds
+bash (10360) executed /usr/bin/tty (10361) for 3046 microseconds
+bash (10359) forked itself (as 10363) for 32005 microseconds
+bash (10366) executed /bin/basename (10369) for 1285 microseconds
+bash (10359) forked itself (as 10370) for 12373 microseconds
+bash (10360) executed /usr/bin/tput (10362) for 34409 microseconds
+bash (10363) executed /usr/bin/dircolors (10364) for 29527 microseconds
+bash (10359) executed /bin/grep (10365) for 21024 microseconds
+bash (10366) forked itself (as 10367) for 11749 microseconds
+bash (10359) forked itself (as 10360) for 41918 microseconds
+bash (10359) forked itself (as 10366) for 14197 microseconds
+bash (10370) executed /usr/bin/id (10371) for 11729 microseconds
+^C
+```
+
+### Simple Data Aggregations
+
+DTrace provides several functions for aggregating the data that individual
+probes gather.
+These functions include `avg()`, `count()`, `max()`, `min()`, `stddev()`,
+and `sum()`, which return the average (mean), count (number), maximum value,
+minimum value, standard deviation, and summation of the data being gathered,
+respectively.
+See
+[Aggregations](../userguide/reference/aggregation.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for descriptions of aggregation functions.
+
+DTrace indexes the results of an aggregation by using a tuple
+expression similar to what is used for an associative array:
+
+```
+@name[list_of_keys] = aggregating_function(args);
+```
+
+The name of the aggregation is prefixed with an `@` character.
+The keys describe the data that the aggregating function is collecting.
+If you do not specify a name for the aggregation, DTrace uses `@` as an
+anonymous aggregation name, which is usually sufficient for simple D programs.
+
+#### Example: Counting the Number of write() System Calls Invoked by Processes
+
+In the following example, the command counts the number of `write()`
+system calls that are invoked by processes, until you type `Ctrl-C`.
+
+```
+# dtrace -n 'syscall::write:entry { @["write() calls"] = count(); }'
+dtrace: description 'syscall:::' matched 1 probe
+^C
+
+  write() calls                   6932
+```
+
+>Note:
+>
+>Rather than create a separate D script for this simple example,
+the probe and the action is specified on the `dtrace` command line.
+
+DTrace prints the result of the aggregation automatically.
+Alternatively, you can use the `printa()`
+function to format the result of the aggregation.
+
+#### Example: Counting the Number of read() and write() System Calls
+
+The following example counts the number of both
+`read()` and `write()` system calls.
+
+```
+# dtrace -n 'syscall::write:entry,syscall::read:entry { @[strjoin(probefunc,"() calls")] = count(); }'
+dtrace: description 'syscall::write:entry,syscall::read:entry' matched 2 probes
+^C
+
+  write() calls                                            150
+  read() calls                                            1555
+```
+
+#### Exercise: Counting System Calls Over a Fixed Period
+
+Write a D program named `countcalls.d` that uses a `tick` probe and `exit()`
+to stop collecting data after 100 seconds and display the number of `open()`,
+`read()` and `write()` calls.
+
+#### Solution to Exercise and Example: Counting Write, Read, and Open System Calls Over 100 Seconds (countcalls.d)
+
+```
+/* countcalls.d -- Count write, read, and open system calls over 100 seconds */
+
+profile:::tick-100sec
+{
+  exit(0);
+}
+
+syscall::write:entry, syscall::read:entry, syscall::open:entry
+{
+  @[strjoin(probefunc,"() calls")] = count();
+}
+```
+
+The action that is associated with the `tick-100s` probe means that
+`dtrace` exits after 100 seconds. By default, exit will print the
+results of the aggregation.
+
+```
+# dtrace -s countcalls.d
+dtrace: script 'countcalls.d' matched 4 probes
+CPU     ID                    FUNCTION:NAME
+  3    643                     :tick-100sec
+
+  write() calls                                                  1062
+  open() calls                                                   1672
+  read() calls                                                  29672
+```
+
+#### Example: Counting System Calls Invoked by a Process (countsyscalls.d)
+
+The D program `countsyscalls.d` shown in the following example counts
+the number of times a process that is specified by its process ID
+invokes different system calls.
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* countsyscalls.d -- Count system calls invoked by a process */
+
+syscall:::entry
+/pid == $1/
+{
+  @num[probefunc] = count();
+}
+```
+
+After making the `syscalls.d` file executable,
+you can run it from the command line,
+specifying a process ID as its argument.
+
+The following example shows how you would monitor the use of the
+`emacs` program that was previously invoked.
+After the script is invoked, within `emacs` a couple files are opened,
+modified, and then saved before exiting the D script.
+
+Make the script executable:
+
+```
+# chmod +x countsyscalls.d
+```
+
+From another command line, type:
+
+```
+# emacs foobar.txt
+```
+
+Now, start the script and use the opened `emacs` window:
+
+```
+# ./countsyscalls.d $(pgrep -u root emacs)
+                     ^C
+
+  chmod                                                             1
+  exit_group                                                        1
+  futex                                                             1
+  getpgrp                                                           1
+  lseek                                                             1
+  lsetxattr                                                         1
+  rename                                                            1
+  fsync                                                             2
+  lgetxattr                                                         2
+  alarm                                                             3
+  rt_sigaction                                                      3
+  unlink                                                            3
+  mmap                                                              4
+  munmap                                                            4
+  symlink                                                           4
+  fcntl                                                             6
+  newfstat                                                          6
+  getgid                                                            7
+  getuid                                                            7
+  geteuid                                                           8
+  openat                                                            8
+  access                                                            9
+  getegid                                                          14
+  open                                                             14
+  getdents                                                         15
+  close                                                            17
+  readlink                                                         19
+  newlstat                                                         33
+  newstat                                                         155
+  read                                                            216
+  timer_settime                                                   231
+  write                                                           314
+  pselect6                                                        376
+  rt_sigreturn                                                    393
+  ioctl                                                           995
+  rt_sigprocmask                                                 1261
+  clock_gettime                                                  3495
+```
+
+In the preceding example, the `pgrep` command is used to determine the
+process ID of the `emacs` program that the `root` user is running.
+
+#### Exercise: Tracing Processes That Are Run by a User
+
+Create a program `countprogs.d` that counts and displays the number of
+times a user (specified by their user name) runs different programs.
+You can use the `id -u` command to obtain the ID that corresponds to a user name.
+
+#### Solution to Exercise and Example: Counting Programs Invoked by a Specified User (countprogs.d)
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* countprogs.d -- Count programs invoked by a specified user */
+
+proc:::exec
+/uid == $1/
+{
+  @num[execname] = count();
+}
+```
+
+The predicate `/uid == $1/` compares the effective UID for each program
+that is run against the argument specified on the command line.
+You can use the `id -u` command to find out the ID of the guest user account, for example:
+
+```
+# chmod +x countprogs.d
+# ./countprogs.d $(id -u guest)
+^C
+
+less 1
+lesspipe.sh 1
+sh 1
+bash 9
+```
+
+You can use the same command for the `root` user, which is typically user `0`.
+For testing purposes, you might want to have the user account under a test
+login by using another window and then run some nominal programs.
+
+#### Example: Counting the Number of Times a Program Reads From Different Files in 10 Seconds (fdscount.d)
+
+The following D program counts the number of times
+a program reads from files in a ten-second period
+and displays at most the top five results.
+
+```
+/* fdscount.d -- Count read system calls for 10 seconds */
+
+syscall::read:entry
+/execname == ENAME/
+{
+  @[fds[arg0].fi_name] = count();
+}
+
+profile:::tick-10sec {
+  exit(0);
+}
+
+END
+{
+  trunc(@, 5);
+}
+```
+
+We can run the script as follows:
+
+```
+# dtrace -C -D ENAME='"df"' -qs fdscount.d
+
+  libc.so.6                           1
+  locale.alias                        2
+  mountinfo                           5
+```
+
+You specify a C preprocessor directive to `dtrace` that sets
+the value of the `ENAME` variable, such as to `df`.
+You must use additional single quotes to escape the string quotes.
+
+Use the `fds[]` built-in array to determine which file
+corresponds to the file descriptor argument `arg0` to `read()`.
+The `fi_name` member of the `fileinfo_t` structure `fds[arg0]`
+contains the basename of the file.
+See
+[`fds`](../userguide/reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
+and
+[`fileinfo_t`](../userguide/reference/dtrace_providers_io.md#dt_ref_iofile_prov)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for more information.
+
+The [`trunc()`](../userguide/reference/function_trunc.md) function
+in the `END` action removes all but the 5 most important keys.
+Here, there are fewer than 5 keys to start with.
+
+#### Exercise: Counting Context Switches on a System
+
+Create an executable D program named `cswpercpu.d` that displays
+a timestamp and prints the number of context switches per CPU and
+the total for all CPUs once per second, together with the CPU
+number or `"total"`.
+
+- Using the `BEGIN` probe, print a header for the display
+  with columns labelled `Timestamp`, `CPU`, and `Ncsw`.
+
+- Using the `sched:::on-cpu` probe to detect the end of a context switch,
+  use `count()` to increment the aggregation variable `@n`, once with the
+  key value set to the CPU number and once with the key value set to `"total"`.
+  Since `"total"` is a string and aggregation keys must have consistent types,
+  the CPU keys are also converted to strings, using `lltostr()`.
+
+  See
+  [Sched Provider](../userguide/reference/dtrace_providers_sched.md)
+  in the
+  [Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+  for a description of the `sched:::on-cpu`
+  probe.
+
+- Using the `profile:::tick-1sec` probe, use `printf()` to
+  print the data and time, use `printa()` to print the key
+  (the CPU number string or `"total"`) and the aggregation value.
+  The date and time are available as the value of `walltimestamp` variable,
+  which you can print using the `%Y` conversion format
+
+- Use `clear()` to reset the aggregation variable `@n`.
+
+#### Solution to Exercise and Example: Counting Context Switches on a System
+
+The following example shows the executable D program `cswpercpu.d`.
+The program displays a timestamp and prints the number of context switches,
+per-CPU, and the total for all CPUs, once per second, together with the CPU
+number or `"total"`:
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* cswpercpu.d -- Print number of context switches per CPU once per second */
+
+#pragma D option quiet
+
+dtrace:::BEGIN
+{
+  /* Print the header */
+  printf("%-25s %5s %15s", "Timestamp", "CPU", "Ncsw");
+}
+
+sched:::on-cpu
+{
+  /* Convert the cpu number to a string */
+  cpustr = lltostr(cpu);
+  /* Increment the counters */
+  @n[cpustr] = count();
+  @n["total"] = count();
+}
+
+profile:::tick-1sec
+{
+  /* Print the date and time before the first result */
+  printf("\n%-25Y ", walltimestamp);
+
+  /* Print the aggregated counts for each CPU and the total for all CPUs */
+  printa("%5s %@15d\n                          ", @n);
+
+  /* Reset the aggregation */
+  clear(@n);
+}
+```
+
+```
+# chmod +x cswpercpu.d
+# ./cswpercpu.d
+Timestamp                   CPU            Ncsw
+2013 Nov  6 20:47:26          1             148
+                              0             155
+                              3             200
+                              2             272
+                          total             775
+
+2013 Nov  6 20:47:27          1             348
+                              0             364
+                              3             364
+                              2             417
+                          total            1493
+
+2013 Nov  6 20:47:28          3              47
+                              1             100
+                              0             121
+                              2             178
+                          total             446
+                          ^C
+```
+
+You might want to experiment with aggregating the total time that
+is spent context switching and the average time per context switch.
+For example, you can experiment by initializing a thread-local variable
+to the value of `timestamp` in the action to a `sched:::off-cpu` probe,
+and subtracting this value from the value of `timestamp`
+in the action to `sched:::on-cpu`.
+Use the `sum()` and `avg()` aggregation functions, respectively.
+
+### Working With More Complex Data Aggregations
+
+Use the `lquantize()` and `quantize()` functions to display
+linear and power-of-two frequency distributions of data.
+See
+[Aggregations](../userguide/reference/aggregation.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of aggregation functions.
+
+#### Example: Displaying the Distribution of Read Sizes Resulting From a Command
+
+As shown in the following example, you can display the
+distribution of the sizes specified to `arg2` of `read()` calls
+that were invoked by all instances of `find` that are running.
+After running the script, start a search with `find`
+in another window, such as `find .` or `find /.`.
+
+```
+# dtrace -n 'syscall::read:entry /execname=="find"/{@dist["find"]=quantize(arg2);}'
+dtrace: description 'syscall::read:entry ' matched 1 probe
+^C
+
+   find
+            value  ------------- Distribution ------------- count
+              256 | 0
+              512 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 6
+             1024 | 0
+             2048 | 0
+             4096 |@@@@@@@@@@ 2
+             8192 | 0
+```
+
+When the program is as simple as in this example,
+it is often convenient to run it from the command line.
+
+#### Example: Displaying the Distribution of I/O Throughput for Block Devices (diskact.d)
+
+In the following example, the `diskact.d` script uses `io`
+provider probes to display the distribution of I/O throughput
+for the block devices on the system.
+
+```
+#pragma D option quiet
+
+/* diskact.d -- Display the distribution of I/O throughput for block devices */
+
+io:::start
+{
+  start[args[0]->b_edev, args[0]->b_blkno] = timestamp;
+}
+
+io:::done
+/start[args[0]->b_edev, args[0]->b_blkno]/
+{
+  /*
+     You want to get an idea of throughput to this device in KB/sec
+     but you have values that are measured in bytes and nanoseconds.
+     You want to calculate the following:
+
+     bytes / 1024
+     ------------------------
+     nanoseconds / 1000000000
+
+     As DTrace uses integer arithmetic and the denominator is usually
+     between 0 and 1 for most I/O, the calculation as shown will lose
+     precision. So, restate the fraction as:
+
+     bytes         1000000000      bytes * 976562
+     ----------- * ------------- = --------------
+     nanoseconds   1024            nanoseconds
+
+     This is easy to calculate using integer arithmetic.
+   */
+  this->elapsed = timestamp - start[args[0]->b_edev, args[0]->b_blkno];
+  @[args[1]->dev_statname, args[1]->dev_pathname] =
+    quantize((args[0]->b_bcount * 976562) / this->elapsed);
+  start[args[0]->b_edev, args[0]->b_blkno] = 0;
+}
+
+END
+{
+  printa(" %s (%s)\n%@d\n", @);
+}
+```
+
+The `#pragma D option quiet` statement is used
+to suppress unwanted output and the `printa()`
+function is used to display the results of the aggregation.
+
+See
+[IO Provider](../userguide/reference/dtrace_providers_io.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of the arguments to the
+`io:::start` and `io:::done` probes.
+
+See
+[printa](../userguide/reference/function_printa.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+for a description of the function.
+
+After running the program for approximately a minute, type
+`Ctrl-C` to display the results:
+
+```
+# dtrace -s diskact.d
+                     ^C
+
+xvda2 (<unknown>)
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 3
+                1 | 0
+
+xvdc (<unknown>)
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 3
+                1 | 0
+
+xvdc1 (<unknown>)
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 3
+                1 | 0
+
+  dm-0 (<unknown>)
+
+            value  ------------- Distribution ------------- count
+              256 | 0
+              512 |@@ 1
+             1024 |@@ 1
+             2048 |@@@@@@ 3
+             4096 |@@@@@@@@@@ 5
+             8192 |@@@@@@@@@@@@@@@@@ 9
+            16384 |@@@@ 2
+            32768 | 0
+```
+
+#### Exercise: Displaying Read and Write I/O Throughput Separately
+
+Create a version of `diskact.d` that aggregates the results
+separately for reading from, and writing to, block devices.
+Use a `tick` probe to collect data for 10 seconds.
+
+- In the actions for `io:::start` and `io:::done`,
+  assign the value of `args[0]->b_flags & B_READ ? "READ" : "WRITE"`
+  to the clause-local variable `this->iodir`.
+
+- In the actions for `io:::start` and `io:::done`,
+  add `this->iodir` as a key to the `start[]` associative array.
+
+- In the action for `io:::done`,
+  add `this->iodir` as a key to the anonymous aggregation variable `@[]`.
+
+- Modify the format string for `printa()` to display the value of the `iodir` key.
+
+#### Solution to Exercise: Displaying Read and Write I/O Throughput Separately
+
+The following example shows a modified version of the `diskact.d` script,
+which displays separate results for read and write I/O:
+
+```
+#pragma D option quiet
+
+/* rwdiskact.d -- Modified version of diskact.d that displays
+                  separate results for read and write I/O     */
+
+profile:::tick-10sec
+{
+  exit(0);
+}
+
+io:::start
+{
+  this->iodir = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  start[args[0]->b_edev, args[0]->b_blkno, this->iodir] = timestamp;
+}
+
+io:::done
+/
+  (this->iodir = args[0]->b_flags & B_READ ? "READ" : "WRITE") != NULL
+  &&
+  start[args[0]->b_edev, args[0]->b_blkno, this->iodir] != 0
+/
+{
+  this->elapsed = timestamp - start[args[0]->b_edev, args[0]->b_blkno, this->iodir];
+  @[args[1]->dev_statname, args[1]->dev_pathname, this->iodir] =
+    quantize((args[0]->b_bcount * 976562) / this->elapsed);
+  start[args[0]->b_edev, args[0]->b_blkno, this->iodir] = 0;
+}
+
+END
+{
+  printa(" %s (%s) %s \n%@d\n", @);
+}
+```
+
+In the example, adding the `this->iodir` variable to the
+tuple in the aggregation variable enables DTrace to display
+separate aggregations for read and write I/O operations.
+
+```
+# dtrace -s rwdiskact.d
+
+^C
+  xvda2 (<unknown>) WRITE
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 1
+                1 | 0
+
+  xvdc (<unknown>) WRITE
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 1
+                1 | 0
+
+  xvdc1 (<unknown>) WRITE
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 1
+                1 | 0
+
+  nfs (<nfs>) READ
+
+            value  ------------- Distribution ------------- count
+               -1 | 0
+                0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 5
+                1 | 0
+
+  dm-0 (<unknown>) WRITE
+
+            value  ------------- Distribution ------------- count
+             4096 | 0
+             8192 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 1
+            16384 | 0
+```
+
+#### Example: Displaying Cumulative Read and Write Activity Across a File System Device (fsact)
+
+The following example is a `bash` shell script that uses
+an embedded D program to display cumulative read and write
+block counts for a local file system according to their
+location on the file system's underlying block device.
+The `lquantize()` aggregation function is used to
+display the results linearly as tenths of the total
+number of blocks on the device.
+
+```
+#!/bin/bash
+
+# fsact -- Display cumulative read and write activity across a file system device
+#
+#          Usage: fsact [<filesystem>]
+
+# If no file system is specified, assume /
+[ $# -eq 1 ] && FSNAME=$1 || FSNAME="/"
+[ ! -e $FSNAME ] && echo "$FSNAME not found" && exit 1
+
+# Determine the mountpoint, major and minor numbers, and file system size
+MNTPNT=$(df $FSNAME | gawk '{ getline; print $1; exit }')
+MAJOR=$(printf "%d\n" 0x$(stat -Lc "%t" $MNTPNT))
+MINOR=$(printf "%d\n" 0x$(stat -Lc "%T" $MNTPNT))
+FSSIZE=$(stat -fc "%b" $FSNAME)
+
+# Run the embedded D program
+dtrace -qs /dev/stdin << EOF
+io:::done
+/args[1]->dev_major == $MAJOR && args[1]->dev_minor == $MINOR/
+{
+  this->iodir = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  /* Normalize the block number as an integer in the range 0 to 10 */
+  blkno = (args[0]->b_blkno)*10/$FSSIZE;
+  /* Aggregate blkno linearly over the range 0 to 10 in steps of 1 */
+  @a[this->iodir] = lquantize(blkno,0,10,1)
+}
+
+tick-10sec
+{
+  printf("%Y\n",walltimestamp);
+  /* Display the results of the aggregation */
+  printa("%s\n%@d\n",@a);
+  /* To reset the aggregation every tick, uncomment the following line */
+  /* clear(@a); */
+}
+EOF
+```
+
+You embed the D program in a shell script so that you can
+set up the parameters that are needed, which are the major
+and minor numbers of the underlying device and the total
+size of the file system in file system blocks.
+You then access these parameters directly in the D code.
+
+>Note:
+>
+>An alternate way of passing values into the D program is to
+use C preprocessor directives, for example:
+
+```
+dtrace -C -D MAJ=$MAJOR -D MIN=$MINOR -D FSZ=$FSSIZE -qs /dev/stdin << EOF
+```
+
+You can then refer to the variables in the D program by their
+macro names instead of their shell names:
+
+```
+/args[1]->dev_major == MAJ && args[1]->dev_minor == MIN/
+
+blkno = (args[0]->b_blkno)*10/FSZ;
+```
+
+The following example shows output from running the `fsact`
+command after making the script executable,
+then running `cp -R` on a directory and `rm -rf` on the copied directory:
+
+```
+# chmod +x fsact
+# ./fsact
+2018 Feb 16 16:59:46
+READ
+
+            value  ------------- Distribution ------------- count
+              < 0 | 0
+                0 |@@@@@@@ 8
+                1 |@@@@@@@@@@@@@@@@@@@@@@@@@@@ 32
+                2 | 0
+                3 | 0
+                4 | 0
+                5 | 0
+                6 | 0
+                7 | 0
+                8 | 0
+                9 | 0
+            >= 10 |@@@@@@@ 8
+
+WRITE
+
+            value  ------------- Distribution ------------- count
+                9 | 0
+            >= 10 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 42                                       0
+
+^C
+```
+
+### Displaying System Call Errors
+
+The following information pertains to using the D program
+`errno.d` to display system call errors.
+
+#### Example: Displaying System Call Errors (`errno.d`)
+
+The following is an example of the D program, `errno.d`.
+In this example, the program displays the value of `errno`
+and the file name if an error occurs when using the `open()`
+system call to open a file.
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* errno.d -- Display errno and the file name for failed open() calls */
+
+syscall::open:entry
+{
+  self->filename = copyinstr(arg0);
+}
+
+syscall::openat*:entry
+{
+  self->filename = copyinstr(arg1);
+}
+
+syscall::open*:return
+/arg0 < 0 && self->filename != NULL/
+{
+  printf("errno = %-2d   file = %s\n", errno, self->filename);
+}
+
+syscall::open*:return
+{
+  self->filename = NULL;
+}
+```
+
+If an error occurs in the `open()` system call, the `return` probe
+sets the `arg0` argument to `-1` and the value of the built-in
+`errno` variable indicates the nature of the error.
+A predicate is used to test the value of `arg0`.
+Alternatively, you could test whether the value of `errno` is greater than zero.
+
+The dynamic variable `self->filename` should be freed (set to 0,
+or in this case `NULL`) as a habit to reduce memory leaks.
+
+When you have saved this script to a file and made the file executable,
+you can then run it to display information about any failures of the
+`open()` system call that occur on the system.
+After you have started the script, in a separate terminal window,
+you can run commands that result in an error, such as running the
+`ls` command to list a file that does not exist.
+Or, as in the following example, from another terminal the `cat`
+command has been issued on a directory, which results in an error:
+
+```
+# ./errno.d
+
+errno = 2    file = /usr/share/locale/en_US.UTF-8/LC_MESSAGES/libc.mo
+errno = 2    file = /usr/share/locale/en_US.utf8/LC_MESSAGES/libc.mo
+errno = 2    file = /usr/share/locale/en_US/LC_MESSAGES/libc.mo
+errno = 2    file = /usr/share/locale/en.UTF-8/LC_MESSAGES/libc.mo
+errno = 2    file = /usr/share/locale/en.utf8/LC_MESSAGES/libc.mo
+errno = 2    file = /usr/share/locale/en/LC_MESSAGES/libc.mo
+^C
+```
+
+#### Exercise: Displaying More Information About System Call Errors
+
+Adapt `errno.d` to display the name of the
+error instead of its number for any failed system call.
+
+- The numeric values of errors such as `EACCES` and `EEXIST`
+  are defined in `/usr/include/asm-generic/errno-base.h` and
+  `/usr/include/asm-generic/errno.h`.
+  DTrace defines inline names (which are effectively constants)
+  for the numeric error values in `/usr/lib64/dtrace/*/errno.d`.
+  Use an associative array named `error[]` to store the mapping
+  between the inline names and the error names that are defined
+  in `/usr/include/asm-generic/errno-base.h`.
+
+- Use `printf()` to display the user ID, the process ID, the
+  program name, the error name, and the name of the system call.
+
+- Use the `BEGIN` probe to print column headings.
+
+- Use the value of `errno` rather than `arg0` to test whether an
+  error from the range of mapped names has occurred in a system call.
+
+#### Solution to Exercise: Displaying More Information About System Call Errors
+
+The following is an example that shows a modified version of `errno.d`,
+which displays error names.
+
+##### Example: Modified Version of errno.d Displaying Error Names (displayerrno.d)
+
+```
+#!/usr/sbin/dtrace -qs
+
+/* displayerrno.d -- Modified version of errno.d that displays error names */
+
+BEGIN
+{
+  printf("%-4s %-6s %-10s %-10s %s\n", "UID", "PID", "Prog", "Error", "Func");
+
+  /* Assign error names to the associative array error[] */
+  error[EPERM]   = "EPERM";    /* Operation not permitted */
+  error[ENOENT]  = "ENOENT";   /* No such file or directory */
+  error[ESRCH]   = "ESRCH";    /* No such process */
+  error[EINTR]   = "EINTR";    /* Interrupted system call */
+  error[EIO]     = "EIO";      /* I/O error */
+  error[ENXIO]   = "ENXIO";    /* No such device or address */
+  error[E2BIG]   = "E2BIG";    /* Argument list too long */
+  error[ENOEXEC] = "ENOEXEC";  /* Exec format error */
+  error[EBADF]   = "EBADF";    /* Bad file number */
+  error[ECHILD]  = "ECHILD";   /* No child processes */
+  error[EAGAIN]  = "EAGAIN";   /* Try again or operation would block */
+  error[ENOMEM]  = "ENOMEM";   /* Out of memory */
+  error[EACCES]  = "EACCES";   /* Permission denied */
+  error[EFAULT]  = "EFAULT";   /* Bad address */
+  error[ENOTBLK] = "ENOTBLK";  /* Block device required */
+  error[EBUSY]   = "EBUSY";    /* Device or resource busy */
+  error[EEXIST]  = "EEXIST";   /* File exists */
+  error[EXDEV]   = "EXDEV";    /* Cross-device link */
+  error[ENODEV]  = "ENODEV";   /* No such device */
+  error[ENOTDIR] = "ENOTDIR";  /* Not a directory */
+  error[EISDIR]  = "EISDIR";   /* Is a directory */
+  error[EINVAL]  = "EINVAL";   /* Invalid argument */
+  error[ENFILE]  = "ENFILE";   /* File table overflow */
+  error[EMFILE]  = "EMFILE";   /* Too many open files */
+  error[ENOTTY]  = "ENOTTY";   /* Not a typewriter */
+  error[ETXTBSY] = "ETXTBSY";  /* Text file busy */
+  error[EFBIG]   = "EFBIG";    /* File too large */
+  error[ENOSPC]  = "ENOSPC";   /* No space left on device */
+  error[ESPIPE]  = "ESPIPE";   /* Illegal seek */
+  error[EROFS]   = "EROFS";    /* Read-only file system */
+  error[EMLINK]  = "EMLINK";   /* Too many links */
+  error[EPIPE]   = "EPIPE";    /* Broken pipe */
+  error[EDOM]    = "EDOM";     /* Math argument out of domain of func */
+  error[ERANGE]  = "ERANGE";   /* Math result not representable */
+}
+
+/* Specify any syscall return probe and test that the value of errno is in range */
+
+syscall:::return
+/errno > 0 && errno <= ERANGE/
+{
+  printf("%-4d %-6d %-10s %-10s %s()\n", uid, pid, execname, error[errno], probefunc);
+}
+```
+
+```
+# chmod +x displayerrno.d
+# ./displayerrno.d
+UID  PID    Prog       Error      Func
+500  3575   test       EACCES     open()
+500  3575   test       EINTR      clock_gettime()
+^C
+```
+
+You could modify this program so that it displays verbose
+information about the nature of the error, in addition to the
+name of the error.
diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
new file mode 100644
index 000000000..1d9bf69f2
--- /dev/null
+++ b/doc/tutorial/3.TracingUserSpaceApplications.md
@@ -0,0 +1,832 @@
+
+## Tracing User-Space Applications
+
+This chapter provides information about how to trace a user-space
+application and includes examples of D programs that you can use
+to investigate what is happening in an example user-space program.
+
+### Sample Application
+
+This section provides a sample application to be used in
+subsequent exercises and examples in this chapter. The example,
+which illustrates a simple program, favors brevity and probing
+opportunity rather than completeness or efficiency.
+
+>Note:
+>
+>The following simple program is provided for example purposes
+*only* and is not intended to efficiently solve a practical
+problem nor exhibit preferred coding methods.
+
+The sample program finds the lowest factor of a number, which you input.
+The program is comprised of the following four files:
+`makefile`, `primelib.h`, `primelib.c`, and `primain.c`,
+which are stored in the same working directory.
+
+#### Description and Format of the makefile File
+
+The following example shows the contents of the `makefile` file.
+
+>Note:
+>
+>A `makefile` must use tabs for indentation so
+that the `make` command can function properly.
+Also, be sure that tabs are retained if the
+file is copied and then used.
+
+```
+default: prime
+
+# compile the library primelib first
+primelib.o: primelib.c
+	gcc -c primelib.c
+
+# compile the main program
+primain.o: primain.c
+	gcc -c primain.c
+
+# link and create executable file "prime"
+prime: primelib.o primain.o
+	gcc primain.o primelib.o -o prime -lm
+
+clean:
+	-rm -f *.o
+	-rm -f prime
+```
+
+#### Description of the primelib.h Source File
+
+The following example shows the contents of the `primelib.h` file.
+
+```
+int findMaxCheck( int inValue );
+int seekFactorA( int input, int maxtry );
+int seekFactorB( int input );
+```
+
+#### Description of the primelib.c Source File
+
+The following example shows the contents of the `primelib.c` file.
+
+```
+#include <stdio.h>
+#include <math.h>
+
+/*
+ * utility functions which are called from the main source code
+ */
+
+// Find and return our highest value to check -- which is the square root
+int findMaxCheck( int inValue )  {
+  float sqRoot;
+  sqRoot = sqrt( inValue );
+  printf("Square root of %d is %lf\n", inValue, sqRoot);
+  return floor( sqRoot );
+}
+
+int debugFlag = 0;
+
+// Search for a factor to the input value, proving prime on return of zero
+int seekFactorA( int input, int maxtry )  {
+  int divisor, factor = 0;
+  for( divisor=2; divisor<=maxtry; ++divisor ) {
+    if( 0 == input%divisor ) {
+      factor = divisor;
+      break;
+    }
+    else if ( debugFlag != 0 )
+      printf( "modulo %d yields: %d\n", divisor, input%divisor );
+  }
+  return factor;
+}
+
+// Search for a factor to the input value, proving prime on return of zero
+// This is a different method than "A", using one argument
+int seekFactorB( int input )  {
+  int divisor, factor = 0;
+  if( 0 == input%2 ) return 2;
+  for( divisor=3; divisor<=input/2; divisor+=2 ) {
+    if( 0 == input%divisor ) {
+      factor = divisor;
+      break;
+    }
+  }
+  return factor;
+}
+```
+
+#### Description of the primain.c Source File
+
+The following example shows the contents of the `primain.c` file.
+
+```
+#include <stdio.h>
+#include "primelib.h"
+
+/*
+ * Nominal C program churning to provide a code base we might want to
+ * instrument with D
+ */
+
+// Search for a divisor -- thereby proving composite value of the input.
+int main()  {
+  int targVal, divisor, factorA=0, factorB=0;
+
+  printf( "Enter a positive target integer to test for prime status: " );
+  scanf( "%d", &targVal );
+
+  // Check that the user input is valid
+  if( targVal < 2 ) {
+    printf( "Invalid input value -- exiting now\n" );
+    return -2;
+  }
+
+  // Search for a divisor using method and function A
+  int lastCheck;
+  lastCheck = findMaxCheck( targVal );
+  printf( "%d highest value to check as divisor\n", lastCheck );
+  factorA = seekFactorA( targVal, lastCheck );
+
+  // Search for a divisor using method and function B
+  factorB = seekFactorB( targVal );
+
+  // Warn if the methods give different results
+  if (factorA != factorB)
+    printf( "%d does not equal %d! How can this be?\n", factorA, factorB );
+
+  // Print results
+  if( !factorA )
+    printf( "%d is a prime number\n", targVal );
+  else
+    printf( "%d is not prime because there is a factor %d\n",
+	    targVal, factorA );
+  return 0;
+}
+```
+
+#### Compiling the Program and Running the prime Executable
+
+With the four files previously described located in the
+same working directory, compile the program by using the
+`make` command as follows:
+
+```
+# make
+gcc -c primelib.c
+gcc -c primain.c
+gcc primain.o primelib.o -o prime -lm
+```
+
+Running the `make` command creates an executable named `prime`,
+which can be run to find the lowest prime value of the input,
+as shown in the following two examples:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status: 5099
+Square root of 5099 is 71.407280
+71 highest value to check as divisor
+5099 is a prime number
+```
+```
+# ./prime
+Enter a positive target integer to test for prime status: 95099
+Square root of 95099 is 308.381256
+308 highest value to check as divisor
+95099 is not prime because there is a factor 61
+```
+
+### Using the `pid` Provider
+
+So far, we have built our application without
+taking DTrace at all into account.
+Nevertheless, we can still study execution of this application,
+using the `pid` provider to trace entry into and return from user functions.
+
+For example, from one window, start the application
+but do not yet provide it with any input,
+thereby leaving the application paused and waiting:
+
+```
+$ ./prime 
+Enter a positive target integer to test for prime status: 
+```
+
+In another window, we can list the probes supplied by the `pid` provider.
+Actually, there is a different such provider for each process,
+meaning that we must append the process ID to specify the process to trace.
+For example, we can run `pgrep prime` to get the process ID.
+In our case, it is 2889188.
+Then, we can list the `pid` probes associated with this process in either of two ways:
+
+```
+# dtrace -ln pid2889188:a.out::
+# dtrace -p 2889188 -ln pid'$target':a.out::
+```
+
+In the first case, we append the process ID
+explicitly to form the provider name `pid2889188`.
+In the second case, the provider name refers to the process ID symbolically,
+using the macro `$target`,
+and the traced process 2889188 is specified using a
+`dtrace` command-line option `-p`.
+This second form is useful when the probe specification is contained in
+a D script that we do not want to modify each time we use it.
+
+We specify a module of the application executable.
+It could be the load object of the executable, here referred to as `a.out`,
+or it could be a shared library.
+The probe function and name are omitted, equivalent to the wildcard `*`.
+
+In our case, this probe specification results in 187 probes.
+We show a few of them here:
+
+```
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ 5433 pid2889188             prime                       seekFactorB 56
+ 5431 pid2889188             prime                       seekFactorB 55
+ 5429 pid2889188             prime                       seekFactorB 52
+ [...]
+ 5375 pid2889188             prime                       seekFactorB 4
+ 5373 pid2889188             prime                       seekFactorB 1
+ 5371 pid2889188             prime                       seekFactorB 0
+ 5370 pid2889188             prime                       seekFactorB entry
+ 5368 pid2889188             prime                       seekFactorB return
+ 5366 pid2889188             prime                       seekFactorA 68
+ 5364 pid2889188             prime                       seekFactorA 67
+ 5362 pid2889188             prime                       seekFactorA 64
+ [...]
+ 5302 pid2889188             prime                       seekFactorA 4
+ 5300 pid2889188             prime                       seekFactorA 1
+ 5298 pid2889188             prime                       seekFactorA 0
+ 5297 pid2889188             prime                       seekFactorA entry
+ 5295 pid2889188             prime                       seekFactorA return
+ 5293 pid2889188             prime                      findMaxCheck 70
+ 5291 pid2889188             prime                      findMaxCheck 6f
+ 5289 pid2889188             prime                      findMaxCheck 6b
+ [...]
+ 5243 pid2889188             prime                      findMaxCheck 4
+ 5241 pid2889188             prime                      findMaxCheck 1
+ 5239 pid2889188             prime                      findMaxCheck 0
+ 5238 pid2889188             prime                      findMaxCheck entry
+ 5236 pid2889188             prime                      findMaxCheck return
+ 5234 pid2889188             prime                              main ef
+ 5232 pid2889188             prime                              main ee
+ 5230 pid2889188             prime                              main e9
+ [...]
+ 5110 pid2889188             prime                              main 4
+ 5108 pid2889188             prime                              main 1
+ 5106 pid2889188             prime                              main 0
+ 5105 pid2889188             prime                              main entry
+ 5103 pid2889188             prime                              main return
+ [...]
+```
+
+The module, which we specified by the nickname `a.out`,
+is listed by its executable name `prime`.
+The functions of this module appear:  `seekFactorB`, `seekFactorA`, and so on.
+For each function, there is a probe for entry, return, and each instruction offset.
+
+This listing shows us what probes we might specify to trace this
+user program without having added any DTrace-specific instrumentation.
+For more information on how to use the `pid` provider to trace
+user function entry and return or on specific instruction offsets,
+see
+[Pid Provider](../userguide/reference/dtrace_providers_pid.md)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+### Adding USDT Probes to an Application
+
+In this section, we practice adding USDT probes to an application.
+For background information and other details, see
+[Adding USDT Probes to Application Code](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+To get started, you will need to create a `.d` file, as described in
+[Defining USDT Providers and Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+>Note:
+>
+>This `.d` file is not a script that is run in the same
+way that is shown in previous examples in this tutorial,
+but is rather the `.d` source file that you use when
+compiling and linking your application.
+
+In this `.d` file, you define the probes you will
+place in the `primain.c` source file.
+These probes mark the sequence of operations that are
+used after the user entry is completed and checked:
+
+| Description                              | Probe                       |
+| :-----------                             | :-----------                |
+| User entry complete and checked          | `userentry( int )`          |
+| Return from `findMaxCheck()`             | `maxcheckval( int, int )`   |
+| Return from `seekFactorA()`              | `factorreturnA( int, int )` |
+| Return from `seekFactorB()`              | `factorreturnB( int, int )` |
+| Immediately prior to the program exiting | `final()`                   |
+
+#### Exercise: Creating a dprime.d File
+
+Declare the above probes in a file `dprime.d` and store the
+file in the same working directory as the other source files.
+
+#### Solution to Exercise: Creating a dprime.d File
+
+```
+provider primeget
+{
+  probe query__userentry( int );
+  probe query__maxcheckval( int, int );
+  probe query__factorreturnA( int, int );
+  probe query__factorreturnB( int, int );
+  probe query__final();
+};
+```
+
+#### Example: Creating a .h File From a dprime.d File
+
+The next step is to create a `.h` header file to use in your
+C source program from the `dprime.d` file, as shown here:
+
+```
+# dtrace -h -s dprime.d
+```
+
+The `dprime.h` file that is created contains a reference to each
+of the probe points that are defined in the `dprime.d` file.
+
+Next, in the application source file, `primain.c`, we add
+`#include "dprime.h"` and the appropriate probe macros at the proper
+locations.
+
+In the resulting `primain.c` file, the probe macros are easy
+to recognize, as they appear in uppercase letters:
+
+```
+#include <stdio.h>
+#include "primelib.h"
+#include "dprime.h"
+
+/*
+ * Nominal C program churning to provide a code base we might want to
+ * instrument with D
+*/
+
+// Search for a divisor -- thereby proving composite value of the input.
+int main()  {
+  int targVal, divisor, factorA=0, factorB=0;
+
+  printf( "Enter a positive target integer to test for prime status: " );
+  scanf( "%d", &targVal );
+
+  // Check that the user input is valid
+  if( targVal < 2 ) {
+    printf( "Invalid input value -- exiting now\n" );
+    return -2;
+  }
+  if (PRIMEGET_QUERY_USERENTRY_ENABLED())
+    PRIMEGET_QUERY_USERENTRY(targVal);
+
+  // Search for a divisor using method and function A
+  int lastCheck;
+  lastCheck = findMaxCheck( targVal );
+  printf( "%d highest value to check as divisor\n", lastCheck );
+  if (PRIMEGET_QUERY_MAXCHECKVAL_ENABLED())
+    PRIMEGET_QUERY_MAXCHECKVAL(lastCheck, targVal);
+
+  factorA = seekFactorA( targVal, lastCheck );
+  if (PRIMEGET_QUERY_FACTORRETURNA_ENABLED())
+    PRIMEGET_QUERY_FACTORRETURNA(factorA, targVal);
+
+  // Search for a divisor using method and function B
+  factorB = seekFactorB( targVal );
+ if (PRIMEGET_QUERY_FACTORRETURNB_ENABLED())
+    PRIMEGET_QUERY_FACTORRETURNB(factorB, targVal);
+
+  // Warn if the methods give different results
+  if (factorA != factorB)
+    printf( "%d does not equal %d! How can this be?\n", factorA, factorB );
+
+  // Print results
+  if( !factorA )
+    printf( "%d is a prime number\n", targVal );
+  else
+    printf( "%d is not prime because there is a factor %d\n",
+	    targVal, factorA );
+  if (PRIMEGET_QUERY_FINAL_ENABLED())
+    PRIMEGET_QUERY_FINAL();
+
+  return 0;
+}
+```
+
+Any `*_ENABLED()` probe will translate into a truth value if
+the associated probe is enabled (some consumer is using it),
+and a false value if the associated probe is not enabled.
+
+Next, you will need to modify the `makefile` file.
+For step-by-step instructions, See
+[Building Applications With USDT Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
+in the
+[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+
+#### Exercise: Directing makefile to Re-Create the dprime.h File
+
+Add a target that instructs `dtrace` to re-create the `dprime.h` file
+in the event that changes are subsequently made to the `dprime.d` file.
+This step ensures that you do not have to manually run the
+`dtrace -h -s dprime.d` command if any changes are made.
+
+This exercise also has you direct `dtrace` to create a `prime.o` file.
+
+#### Solution to Exercise: Directing makefile to Re-Create the dprime.h File
+
+```
+default: prime
+
+# re-create new dprime.h if dprime.d file has been changed
+dprime.h: dprime.d
+	dtrace -h -s dprime.d
+
+# compile the library primelib first
+primelib.o: primelib.c
+	gcc -c primelib.c
+
+# compile the main program
+primain.o: primain.c dprime.h
+	gcc -c -I/usr/lib64/dtrace/include primain.c
+
+# have dtrace post-process the object files
+prime.o: dprime.d primelib.o primain.o
+	dtrace -G -s dprime.d primelib.o primain.o -o prime.o
+
+# link and create executable file "prime"
+prime: prime.o
+	gcc -Wl,--export-dynamic,--strip-all -o prime prime.o primelib.o primain.o -lm
+
+clean:
+	-rm -f *.o
+	-rm -f prime
+	-rm -f dprime.h
+```
+
+Notice that the `primain.c` file now includes the generated
+`dprime.h` file, which includes `<sys/usdt.h>`.
+Therefore, when we compile `gcc -c primain.c`,
+we include a `-I` option to find `<sys/usdt.h>`.
+The path to use on your system is given by:
+
+```
+pkg-config --cflags dtrace_sdt
+```
+
+which is `/usr/lib64/dtrace/include` in the example above.
+In the DTrace source code directory, the file is in `uts/common`.
+
+In the link stage, the `-Wl,--export-dynamic` link options to `gcc`
+are required for symbol lookup in a stripped executable at runtime,
+for example, when you use the D function `ustack()`.
+
+#### Example: Testing the Program
+
+After creating a fresh build, test that the executable is still
+working as expected:
+
+```
+# make clean
+rm -f *.o
+rm -f prime
+rm -f dprime.h
+# make
+gcc -c primelib.c
+dtrace -h -s dprime.d
+gcc -c primain.c
+dtrace -G -s dprime.d primelib.o primain.o -o prime.o
+gcc -Wl,--export-dynamic,--strip-all -o prime prime.o primelib.o primain.o dprime.h -lm
+```
+
+```
+# ./prime
+Enter a positive target integer to test for prime status: 6799
+Square root of 6799 is 82.456047
+82 highest value to check as divisor
+6799 is not prime because there is a factor 13
+```
+
+### Using USDT Probes
+
+This section provides some practice in the nominal use of the USDT
+probes that were created in
+[Adding USDT Probes to an Application](#adding-usdt-probes-to-an-application).
+
+Initially, the probes are not visible because the application is
+not running with the probes, as shown in the following output:
+
+```
+# dtrace -l -P 'prime*'
+  ID   PROVIDER            MODULE                          FUNCTION NAME
+dtrace: failed to match prime*:::: No probe matches description
+```
+
+Start the application, but do not enter any value yet:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status:
+```
+
+From another command line, issue a probe listing:
+
+```
+# dtrace -l -P 'prime*'
+   ID      PROVIDER            MODULE                          FUNCTION NAME
+ 2475 primeget26556             prime                              main query-factorreturnA
+ 2476 primeget26556             prime                              main query-factorreturnB
+ 2477 primeget26556             prime                              main query-final
+ 2478 primeget26556             prime                              main query-maxcheckval
+ 2479 primeget26556             prime                              main query-userentry
+```
+
+Note that the provider name is a combination of the defined `provider primeget`,
+from the `dprime.d` file, and the PID of the running application `prime`.
+The output of the following command displays the PID of prime:
+
+```
+# ps aux | grep prime
+root 26556 0.0 0.0 7404 1692 pts/0 S+ 21:50 0:00 ./prime
+```
+
+At this point, we can kill the application or provide an input
+value so that the application runs to completion.
+
+#### Example: Using simpleTimeProbe.d to Show the Elapsed Time Between Two Probes
+
+The following example shows how you would create a simple script
+that measures the time elapsed between the first probe and the
+second probe (`query-userentry` to `query-maxcheckval`).
+
+```
+/* simpleTimeProbe.d */
+
+/* Show how much time elapses between two probes */
+
+primeget*:::query-userentry
+{
+  self->t = timestamp; /* Initialize a thread-local variable with the time */
+}
+
+primeget*:::query-maxcheckval
+/self->t != 0/
+{
+  this->timeNow = timestamp;
+  /* Divide by 1000 for microseconds */
+  printf("%s (pid=%d) spent %d microseconds between userentry & maxcheckval\n",
+         execname, pid, ((this->timeNow - self->t)/1000));
+
+  self->t = 0; /* Reset the variable */
+}
+```
+
+Since `timeNow` is used only within this clause,
+we use `this->` to denote its clause-local scope.
+
+Once again, start the execution of the target application:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status:
+```
+
+Then, run the DTrace script from another window:
+
+```
+# dtrace -q -s simpleTimeProbe.d
+```
+
+As the application is running, the output of the script is also
+running in parallel:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status: 7921
+Square root of 7921 is 89.000000
+89 highest value to check as divisor
+7921 is not prime because there is a factor 89
+# ./prime
+Enter a positive target integer to test for prime status: 995099
+Square root of 995099 is 997.546509
+997 highest value to check as divisor
+995099 is not prime because there is a factor 7
+# ./prime
+Enter a positive target integer to test for prime status: 7921
+Square root of 7921 is 89.000000
+89 highest value to check as divisor
+7921 is not prime because there is a factor 89
+```
+
+On the command line where the script is being run, you should
+see output similar to the following:
+
+```
+# dtrace -q -s simpleTimeProbe.d
+prime (pid=2328) spent 45 microseconds between userentry & maxcheckval
+prime (pid=2330) spent 41 microseconds between userentry & maxcheckval
+prime (pid=2331) spent 89 microseconds between userentry & maxcheckval
+^C
+```
+
+Another way of running the D script is with the `-Z` option.
+Previously, we started the application first so that some
+`primeget*` probes would be found.
+With the `-Z` option, `dtrace` will start up even if
+zero matching probes are found.
+Then, it will wait patiently until such probes are discovered
+and those probes fire.  That is, in one window, run:
+
+```
+# dtrace -q -Z -s simpleTimeProbe.d
+```
+
+Note the addition of the `-Z` option.
+In other window, run the application:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status: 7921
+Square root of 7921 is 89.000000
+89 highest value to check as divisor
+7921 is not prime because there is a factor 89
+#
+```
+
+The first window should show the `dtrace` output
+and you can terminate the script.
+
+```
+# dtrace -q -Z -s simpleTimeProbe.d
+prime (pid=4334) spent 85 microseconds between userentry & maxcheckval
+^C
+```
+
+And yet one more way of launching both the D script and the
+application, from the same window, is to use the `-c` option
+to `dtrace` to launch a command to trace:
+
+```
+# dtrace -q -c ./prime -s simpleTimeProbe.d
+Enter a positive target integer to test for prime status: 579
+Square root of 579 is 24.062418
+24 highest value to check as divisor
+579 is not prime because there is a factor 3
+prime (pid=2884516) spent 98 microseconds between userentry & maxcheckval
+```
+
+Here, `dtrace` is launched, it starts the command `./prime`,
+and when `dtrace` or the application terminates, so does the other.
+
+#### Example: Using timeTweenprobes.d to Show the Elapsed Time Between Each Probe
+
+You can broaden the script to monitor all of the following
+probes in the application:
+
+- `query-userentry`
+- `query-maxcheckval`
+- `query-factorreturnA`
+- `query-factorreturnB`
+- `query-final`
+
+```
+/* timeTweenProbes.d */
+
+/* show how much time elapses between each probe */
+
+BEGIN
+{
+  iterationCount = 0;
+}
+
+primeget*:::query-userentry
+{
+  printf("%s (pid=%d) running\n", execname, pid);
+  self->t = timestamp; /* Initialize a thread-local variable with time */
+}
+
+primeget*:::query-maxcheckval
+/self->t != 0/
+{
+  this->timeNow = timestamp;
+  printf(" maxcheckval spent %d microseconds since userentry\n",
+         ((this->timeNow - self->t)/1000));  /* Divide by 1000 for microseconds */
+  self->t = this->timeNow; /* set the time to recent sample */
+}
+
+primeget*:::query-factorreturnA
+/self->t != 0/
+{
+  this->timeNow = timestamp;
+  printf(" factorreturnA spent %d microseconds since maxcheckval\n",
+         ((this->timeNow - self->t)/1000));  /* Divide by 1000 for microseconds */
+  self->t = this->timeNow; /* set the time to recent sample */
+}
+
+primeget*:::query-factorreturnB
+/self->t != 0/
+{
+  this->timeNow = timestamp;
+  printf(" factorreturnB spent %d microseconds since factorreturnA\n",
+         ((this->timeNow - self->t)/1000));  /* Divide by 1000 for microseconds */
+  self->t = this->timeNow; /* set the time to recent sample */
+}
+
+primeget*:::query-final
+/self->t != 0/
+{
+  printf(" prime spent %d microseconds from factorreturnB until ending\n",
+         ((timestamp - self->t)/1000));
+  self->t = 0; /* Reset the variable */
+  iterationCount++;
+}
+
+END
+{
+  trace(iterationCount);
+}
+```
+
+Again, start the execution of the target application first,
+without yet providing input.
+Then from another window, start the D script.
+Back in the first window, you can run the application multiple times.
+Finally, in the second window, you can terminate the D script.
+The first window might look something like this:
+
+```
+# ./prime
+Enter a positive target integer to test for prime status: 995099
+Square root of 995099 is 997.546509
+997 highest value to check as divisor
+995099 is not prime because there is a factor 7
+# ./prime
+Enter a positive target integer to test for prime status: 7921
+Square root of 7921 is 89.000000
+89 highest value to check as divisor
+7921 is not prime because there is a factor 89
+# ./prime
+Enter a positive target integer to test for prime status: 95099
+Square root of 95099 is 308.381256
+308 highest value to check as divisor
+95099 is not prime because there is a factor 61
+# ./prime
+Enter a positive target integer to test for prime status: 95099
+Square root of 95099 is 308.381256
+308 highest value to check as divisor
+95099 is not prime because there is a factor 61
+# ./prime
+Enter a positive target integer to test for prime status: 5099
+Square root of 5099 is 71.407280
+71 highest value to check as divisor
+5099 is a prime number
+```
+
+The corresponding output from the script is similar to the
+following:
+
+```
+# dtrace -q -s ./timeTweenProbes.d
+prime (pid=2437) running
+ maxcheckval spent 96 microseconds since userentry
+ factorreturnA spent 9 microseconds since maxcheckval
+ factorreturnB spent 6 microseconds since factorreturnA
+ prime spent 9 microseconds from factorreturnB until ending
+prime (pid=2439) running
+ maxcheckval spent 45 microseconds since userentry
+ factorreturnA spent 10 microseconds since maxcheckval
+ factorreturnB spent 7 microseconds since factorreturnA
+ prime spent 9 microseconds from factorreturnB until ending
+prime (pid=2440) running
+ maxcheckval spent 43 microseconds since userentry
+ factorreturnA spent 11 microseconds since maxcheckval
+ factorreturnB spent 8 microseconds since factorreturnA
+ prime spent 10 microseconds from factorreturnB until ending
+prime (pid=2441) running
+ maxcheckval spent 53 microseconds since userentry
+ factorreturnA spent 10 microseconds since maxcheckval
+ factorreturnB spent 7 microseconds since factorreturnA
+ prime spent 10 microseconds from factorreturnB until ending
+prime (pid=2442) running
+ maxcheckval spent 40 microseconds since userentry
+ factorreturnA spent 9 microseconds since maxcheckval
+ factorreturnB spent 48 microseconds since factorreturnA
+ prime spent 10 microseconds from factorreturnB until ending
+
+^C
+5
+```
+
+As is observed in the previous example, there is now a set of
+DTrace features that can be used with the probes that were
+created.
diff --git a/doc/tutorial/4.GoingFurtherWithDTrace.md b/doc/tutorial/4.GoingFurtherWithDTrace.md
new file mode 100644
index 000000000..e267db907
--- /dev/null
+++ b/doc/tutorial/4.GoingFurtherWithDTrace.md
@@ -0,0 +1,14 @@
+
+## Going Further With DTrace
+
+For more information about using DTrace on Linux, see the
+[DTrace User Guide](../userguide/index.md).
+
+There are [DTrace trainings videos](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace).
+
+The latest DTrace development work and source code for Linux is
+available at <https://github.com/oracle/dtrace-utils/>.
+
+Or, there are [DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
+There are
+[Oracle Linux: DTrace Release Notes](https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-relnotes/)
diff --git a/doc/tutorial/index.md b/doc/tutorial/index.md
new file mode 100644
index 000000000..60d5dd8b4
--- /dev/null
+++ b/doc/tutorial/index.md
@@ -0,0 +1,15 @@
+# DTrace Tutorial
+
+- [Introducing DTrace](1.IntroducingDTrace.md)
+- [Tracing Operating System Behavior](2.TracingOperatingSystemBehavior.md)
+- [Tracing User Space Applications](3.TracingUserSpaceApplications.md)
+- [Going Further With DTrace](4.GoingFurtherWithDTrace.md)
+
+<!--
+These are from:
+https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-Preface.html
+https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-IntroducingDTrace.html
+https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-TracingOperatingSystemBehavior.html
+https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-TracingUserSpaceApplications.html
+https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-GoingFurtherWithDTrace.html
+-->
-- 
2.47.3

