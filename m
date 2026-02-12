Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2D8211A28
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770920320; cv=fail; b=Kf0bi259Og+hB81aCTaPLXD9107xXUjiN6XpJ6GsdY/kh1vEaxzWPIenRO9Wy1ttVV8l3qBf4zXCVSjwXBY2fHc4gVFxqYMI9AGGFJcsBozSl+2gJOwPFv6CbEaGU8xogWV88/VgfxGpo5ZCcTSzZMCb0BT+26yF+b2At8Qoblc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770920320; c=relaxed/simple;
	bh=xTtTzWvUlRfrM0v8ghiawK60GGrzo5I7g9ml8voALJU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KYLXW2GlcQntj8GTzskPNTTA2+MGWKH7W+dDSZQr40lNiuF9ctoLq1D7f9gakIiJxfDN9oPrWSaCqD4QZOEHMr3wNsKuZ4bXQEEDbTtfLC0DPyOBGB+TyjVOtFxB9sI0AJIj1ak1e8A7Dsfr+N/nKvKr2XZXLY2if+lss73aqOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h00BqGel; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oPhjKtyA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h00BqGel";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oPhjKtyA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNFKK2001161
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xTtTzWvUlRfrM0v8ghiawK60GGrzo5I7g9ml8voALJU=; b=
	h00BqGel8AUqHmjAfNzr4nyQIqJnOB7qjjMuzzoo5vRxL0M1d82b9tn4bIjfTen3
	YJgzoucQQ431HgDGMp94WLCtqcWRSWfm+txs3bAKIQaQiW+0GDwcgqe4k4Nl+6Cm
	lEAapWrH+xfV18qeP7rfx9droyfN4xB8J30EPHqcE0YFueXGmKUxFsnN8qRBy3sc
	qsG3qbU87eFzXrqOaoceVftAU37dbjq2yhyLQCzFFTMrYBv2ADM7bhaSK/LKmTSG
	f6XSnIOdvhd9wEBQwLaAadgZKNwGj9V5Gmzca5/OFFY35WBCG3bUZUFnYMzw77ry
	UR7OTXXUL+OTaI9iBZM78Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88df40fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:18:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CHZ4Wg022535
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:18:37 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c828d8v8k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TECzEmxA6DISzFmRGNk3cK+aBimiMDZje2DyfoGlJ8iq4qgDtyyY4yrivw0QLF5Hd50DPEmgL1OSDnl1i+8bWYvEabMJYwWcotsIcWZRcpvWoTERckt1cgUiqgzvGzmNIIJQE54n0WRNBTziG4nN/pYTSW4DZhrZL2jwfcUFpMMqly8k712IZTjEOFLjDfZF0CX4cBznk90+UUkd0zpTQuZm/GCk+7piDcQNuIFXXfpNAYhgC/G7rh1wXwZ0gCsPQ6EofGULCIiGQOl7Xpo8IeA37AzhmsVjLBiJD6flm4brC4k89ys9wqA3KCt0/XJ/ZX2rkrW64KUCF19sxyqYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTtTzWvUlRfrM0v8ghiawK60GGrzo5I7g9ml8voALJU=;
 b=NYlM2P0UQiTlesIssuYtx5gizqodE2qa8UK0gpsOlgt/8GWbtvHOoZ07ZsdFkc0W9abyv2J1F4wt1Lgu4EarmmiHClpxz0XMh6QTqvLwrEC9OtH9Wza6i1AL2FWInNfKRrO2ZTTiL2ULjlPrkw4XXBeHSgEcG1dgO3lRqNo3XrJX2xKNh4h7toG9Z2kHo7YDJdSn0hSuvVaO2aggJSVRarpgm1jt9MnGv7pwZ3GN1maOxs6OpAL5DnCMdivwh3WtKh5okJvB4x1DqbdrfhNZCDnL/A+PlWgwUvRzogGYUxB+Zl/WDgOo7Hzx0by4Zm3C9JqVdhbcYaLdWZY5AxDoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTtTzWvUlRfrM0v8ghiawK60GGrzo5I7g9ml8voALJU=;
 b=oPhjKtyA2o11RoAlDPVUHzBVnOQ6LvcrwGvATf7UcSqBvgmIHV4YVT80NdlDCM9gD//Q/gjYa6uF60Q/57vuIDp/QfsFMSsUbtAV7CEOC5fcf86rFI20AxyrKsc52UDigLhc67z+Mw+Ri8/QBz9V3LmtFNTB1uTa9RWg8qCrQOA=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA1PR10MB7447.namprd10.prod.outlook.com
 (2603:10b6:208:44c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:18:30 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 18:18:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace-devel@oss.oracle.com>,
        <dtrace@lists.linux.dev>
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
References: <20251202230453.124306-1-nick.alcock@oracle.com>
	<20260120162051.183028-1-nick.alcock@oracle.com>
	<08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
	<489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
Emacs: because you deserve a brk today.
Date: Thu, 12 Feb 2026 18:18:25 +0000
In-Reply-To: <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com> (Eugene Loh's
	message of "Thu, 12 Feb 2026 13:13:42 -0500")
Message-ID: <878qcxomfi.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA1PR10MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 736885e0-bb51-4d3b-0217-08de6a631fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW4yNFFLM29PdUUwcXFtUU5aMkV2V01lb1NwSm5QV2Q0TW1iVnlVRjhpZVZG?=
 =?utf-8?B?Mm9wUi9LRE84OXY5L29tSWRNTStmNmJObkhXQXY4bVpnSTM2YmRzN25UckNj?=
 =?utf-8?B?VlU5YmdiSy8xVk9XYWhzQXlnQkJybTFObENxWDc3aHJ2dThZTkR4c09JN3BX?=
 =?utf-8?B?NEdXekFySU9TbUU1dUdTaG5LQThIZ3M3RHZLUVZVS2h4dnlOT1NkL0FRT2Fi?=
 =?utf-8?B?YVhlNEpOZm5weWJpRk9DUk9mUnpxTnBCcFBKVmc1ajJ0QUN6azBuMW1wNHcv?=
 =?utf-8?B?TCthejNEcWVtZ29HOEdIWjBadE9Pem9PUmlVTlBQNExpOWdxTTRaenFXR0JT?=
 =?utf-8?B?TjJtRStiNWFrUWRKSVk5S3VEc2lCL3RPRmF2eG5IVWtYeEl6eWxhSWY4VlMv?=
 =?utf-8?B?TFJXUWNZZlF3eWt0Mmt4V2xVMnJIUHQ5NU96VU5kMXB2Z0NZL0JKYjBGZGdW?=
 =?utf-8?B?Q0FGUzhaanJjWENSN0IrUGcwZlpuZmRoRHg2THFLV0k3N2pZMGFRM2xRaHU5?=
 =?utf-8?B?djRaQktrRVZkR1VZY0FHVnFKaDk0b0pna21HZk5vYzNRTll5NDFEZk5zdlpH?=
 =?utf-8?B?QmtrZm5keTNIbythVlBTU2VpbTM2NW9pRE9DMEhXZVpDQjVPOWREY3Y1aXlk?=
 =?utf-8?B?U0NDS2NvcytmeHJoWmljUlNmRk1TdThVbENKN0tielRxbW9RaXUvWFZhajAx?=
 =?utf-8?B?ckdrQng4UFM4bmZVVHB1anh3YnNBaEpJU05MbHd1Q3N5TzlwaVFhK3Q4M3hE?=
 =?utf-8?B?ZmZZQjNFYkovbUJNOWxRVy81Zkx3N0gxNklqVkxCdW96dmQrbE95V3VIOFNN?=
 =?utf-8?B?SnpocWhGNmNxRzQzYzhqZWhuUm9XbWYvU1dJUHNKczJEejVwRE0ybUJYLytK?=
 =?utf-8?B?QlZGbjhLenhoZ29YZkUzaklvcjh0SWtRVVF2enAyUEZ5MXpJajJ3T2JvYUZQ?=
 =?utf-8?B?bXZua3ZWSWUzWUdJbVE2TlhIRTlEZHhsandqZHBKWURGNm44S2pkblcrZi9F?=
 =?utf-8?B?c0hOR21jQXJ6b3Z6cE5MQjVJWDQrUmVRbzlKL2I3L0NwaENyNTZ4R2JLQlJ0?=
 =?utf-8?B?cURIZnR5SUkwRktiNXNRekQzWSt1ZjAzMFBZU0NtNlVabXpEWUxIZ3RzSEhG?=
 =?utf-8?B?RGNpb1BraDhESWhTNExuNnNJRFVpQklhNjY1eWhSdS85ejNSNjJ0VDRLdUFG?=
 =?utf-8?B?R3BJL1BnWnAxa0s0bG5xanpiUDdzQ1oyTUVCdEYzalZFNmpvaXNpSWtjK01x?=
 =?utf-8?B?ZGFBVmRqdWRGT0JMdy9CT1ZVdlBTbGk1cnlpMm5GeEUzYVh0R2VnZjdoWWxR?=
 =?utf-8?B?bXpkbHBPRmYyaWhWc3ZXNk8wZXU0dXVSajFxbDZMMEFVSDZxNDRvcWdLYlMv?=
 =?utf-8?B?a2M0dkxDdGtnVms2SWxuMDFZN2ZFNkZyWStpd0NxaUJDYXVFUmNEOFlOcXNZ?=
 =?utf-8?B?MXc2RnhXa1lwdjVuR2FTRVBRcm9IczlzM29EbGZiWXEwUGVZN0l1OURkTzQx?=
 =?utf-8?B?cWQ5WUx0NlZYQ1czeGgyZEFvK1VKN2RpSVErdy9Wd2dkL0hnS2w0TXFNbWk2?=
 =?utf-8?B?ZC9JalllU1pwSjVUUUlNYlJaNmNtTzVHOWhRRE9nN0pZcjM3TW5EOGJtU1NO?=
 =?utf-8?B?S3Q2VnZOMkIwdmg4TVNqN2tKMFVyRmlzSDZRVHVZKzZzbzNkR2ltTDUrZkMz?=
 =?utf-8?B?TldpNHVZMHVyQ0NrWEQ2VXZ0RWQ1YVd4ODZSNjZEamJZYTJIYlBiaStOYUt3?=
 =?utf-8?B?RE1adDduTHpTaEYwWFNjTXQrWk8vTE8vVklIeUxocVZTRkNuQlY4NmVraU5x?=
 =?utf-8?B?SUF6NHJYN1JLVVRLVlNsOCt1OFVwZGl6bEhOOTAzV2hUNHl5QkNCWDVvZENi?=
 =?utf-8?B?MDFmV1FPYThrQkM4SDYyK0tHYVAxV2ZFU2ozVXloZnNxTHZZYnNLVnpjeVh1?=
 =?utf-8?B?SEZad2hxbUNoYkVGd3Eyb1pJS2Q4ZkJNTWEvUlJ3NmNqUm1BZFhFQnVwUEU3?=
 =?utf-8?B?VGVTVFJCaFl0bCtxSEwzQW9aSzNFVFlobThGUTJ0YTNDQmRVZUtuOGJTRHBm?=
 =?utf-8?B?NG5tMkpacStBRHh6c1FTV05sa3JZejkxcEwzdXFwK1V1NEtJVUFjeHc2REhy?=
 =?utf-8?Q?Z5+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEpMUkpNVHcwdENxT3MrbS8yMVpaNTRSWTZGWXA2elZSTUMyZFpKQVFXK0NW?=
 =?utf-8?B?L1NuLzg5VHJMTGVKaW9YLzRUaldYQTQxVEppcWdpSDJZbmJDK1ExODBnb0c4?=
 =?utf-8?B?SlI1dVlYWitKcUtUMS84RUFwYUozajBKVVpTQUIwMEZiQjhuK1lpc1BIU0s5?=
 =?utf-8?B?WG80V1BPWkp6WXZiRFZiN290OUpValMwM25hYkF0cm5yTi9Mb3J1bUF6ak1K?=
 =?utf-8?B?YkZtWXNFZEpPUGdTdm00M3NlSlljRS82YlB4aWZJQzE5V1lieFpTWDVLN0FT?=
 =?utf-8?B?YzBZQ2JodmVxUm1jd2hhWGc5emgxQVNLaW01bnQrMmQzc0w5ZExYRUpKWWJV?=
 =?utf-8?B?SG55RzB2WWdrU1dpTFA2U25DR1d1MENaRHN6bzFmL1V5ZldsTXlDWDVFd29p?=
 =?utf-8?B?c3pDOUM4RnVCNDdKK2JLdlZxR01lamVoZm1DUjd2UzNyR21ZQnM2WTBlVXhS?=
 =?utf-8?B?TzIvWGJHTTRiczFtT0Zvd2R6Z2IvdWQxaFNIZVZ5aW1XUjREVElBakxvaEsy?=
 =?utf-8?B?Y3RCc1pKd3FGak50bVVGQnJlVmowN0pZeSs4TDVITEVNVXE0WmRJTUlQTHJh?=
 =?utf-8?B?eUhXakR0TUdhVmZBZ2lqbnlwZkw5b3kyblZZYWhIWEt2WURDYjhkRUpjSEZ1?=
 =?utf-8?B?UGhnYjBldzRZU1hLSDRqWXVjK1hNVWVvclorQUg1VXptRHhHZEplK1pBRkh0?=
 =?utf-8?B?NlJYSkxzZUpuOUIzNWV5SThnRFBSemVWaUNSYlJzM3gvRzlLcW5OaXpQUEJr?=
 =?utf-8?B?eUFFb21HMy91NTNYbERFNmFIWUljbWpuV09tOEVEbUNuWEkweHpMcFZzU3ZF?=
 =?utf-8?B?Q1BkakU1UzgwTjA0aWtyTWNWaC80MUZvdmttQWZ4OEp6bm1sUkQ2QXF5aGFn?=
 =?utf-8?B?R3IvNG1pUTlXSnRkQlJkbUQ1WmRMRGFGZkVGMGZtL0RkYjlTNTlOOFA5MEZa?=
 =?utf-8?B?VURYU2ZaL3pycllzMU4wSy9HRnVoQVoxdHd3cVRFemFxWmJLQmhFV2xQK0dG?=
 =?utf-8?B?ZWE2YWE2NHJMRkwrZUNHdWdPT2tsdFI1WW9CV1BITDdrS3pKaU01VjBRNXQ2?=
 =?utf-8?B?Z1QrSVRZWVR1cmtZbDZMVVpnQi9WUGJlMjFYYTBUWUxjbmN1OU1abU1FektJ?=
 =?utf-8?B?N1dIZFgxMk9TendqaklXMlZHangyUWx4RXlKUGxOUUg1VU5TcEttTzU1Qzh6?=
 =?utf-8?B?Qm9yUUZPVE51RlU1bmhLYUVZZEpXMHhJb1J0QkNjSm1NYktiL2VwdTdnVTU5?=
 =?utf-8?B?b2RNb2VlWWd1M2NsUHMvK3ZreU4yRDEvcFhQNmtHcmpJRmY2akZ1Q3E0K0JD?=
 =?utf-8?B?T1c3SkQ4NjMxeldSem94cDJmTzl6OFRaL25GMWpIOHc2UVRxVmV2RmVrMUJn?=
 =?utf-8?B?NGJ4RmRoRE1ETTJZMU9nbkVwYjZHYkJidnd5cHhqd0dlbnlPSXlQVlFqUE1n?=
 =?utf-8?B?RFloQXJJT20yZTl4dzlCcDdZMXhad0RWZ2Y5cUpDS0ZsSG5NTnQyRXBJWWly?=
 =?utf-8?B?OXZwTDZ2U3dSRnIrQlAxVmpUeDBZek4xbTVRcU10KzdUUktFZWdFcmRocFp1?=
 =?utf-8?B?aW9WMGZrTm82MTlYemhwTjFpRlNtSCtsbTBlZXQ1TDk2ZTU1ZUNvQzJoMHJL?=
 =?utf-8?B?UXN5bUdUamdYT05Jc1pHSGpOOG95dGRKbnJtUnBiYXRaODAzaGtSSlE2NXJZ?=
 =?utf-8?B?UCthQ1N1TjVZZkxoMndDcDB0Y0FPQTVpTzcyK05mVUIzVTlWam1Xdmo1OWNx?=
 =?utf-8?B?VFNzL0pWWUkyWHgxWjBTK3VROWQyakJBU2NvVzEwbVZKMUxpNVdQK0kzMnFN?=
 =?utf-8?B?UnJXalp3WnRMVFdrQ3l2UWhEQjdOd3BOL3NzWStsaXlBQ0N5eHV3eXFkdmhm?=
 =?utf-8?B?Zk9yeDdXSmUvUnFWWU1VVFZUa2JRVi83dGFLT1kxdWxxQ2g2dFE5TU1rQUpL?=
 =?utf-8?B?ajZ2cnlNZHZLanJpQ2xMUy8yK3U0WEVDbC9HKy9CZ3JWV2RsNDRkZE5nQ1RU?=
 =?utf-8?B?VlhBc2lzdGw3R28wQUcrODc1ZUhjWjduNXdFSGQ0elZySXI1anhvZFBlbmNl?=
 =?utf-8?B?eFdmdk1OQ2Q2Nkd1enNienlsaHRyNnJtcmlYcHhzenNhNEM2cUVYRXJ4NFFW?=
 =?utf-8?B?NkUySjJYeHFpMVVUUnhMWHJCQ01GeStzWWxrK0dWUXBWbUZzNEZWNkN3MHFr?=
 =?utf-8?B?Tzdyc1ZYTGdPczh3Z0RicHlHYllpZTMyN0ZGOXdBZWUreGx0MnJ5cGY3RXZQ?=
 =?utf-8?B?ZWtiOXV4aXlza0RKWFFUZ0ZwL2ZublNwQ3ZWcVFnSWdQMWwyeW5hTitsS203?=
 =?utf-8?B?NWxyaDlRcGxCdEd6bDBnMmNBSW0yWTBKeklBOTBoTnE1Q2IvRDBIUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z4s+2aG0we+J8XmCzSofbadTnY/RA1YWIYJHPe3QiY0xdzj3AgbpCv0iMqQUUnujgqLOMj9Aj+/Cgtq3T+QIKT/OYNqoyFVM2f7RWpfa0bwuItP+puvIZPDzZnSXx12HJE2xBzbUrlGZ1EaleWMdflGynPu6Dr6mzPupZkQAxi7p4i+JWRRsHs0mOZDlYNACn7KBF4rPSlyf45xFbozW+66wNwj7K6onq1L0XW4Y7z/vxumfOxZnV/8rCChGMYfpG1peP4uXrMILlOYDRw8dehg9mAHntgIozq96sSDfEv2a1zYwve5OXySu4sqr51oPC2uuQHqTgGR5f+NQHIu5prfNL9TX7+ikBvm9YAosEfFMJSfsP13x7TL4lBFtMSMCELAQwSSzp5RKvTQ4/c8IIAZ4q+fg1TQAV70f7MTQt8VDUDuVNqAhVyN9vOZyBuZf6lDE3tWsHoy8Ts1u6h66PpR5ymY/5rX6Y5pJH14R00Mj2XwJ4M6EEWVgGm1Ifs899y74LkvRPKHAkNFuXKw85EGOuWmpoGnl13cbpoektFR0Jw8FLSOCXIbqw9USyrKomy38dCm1OUnLo4QTVGoYnKC6jiSeRlHDZg9EqvCDkw0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736885e0-bb51-4d3b-0217-08de6a631fa6
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:18:29.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rn2nrmegqYyBvtanM54+Ccetq2OT3ErcW1vSWQ/SHbcPGHuFEq7rFvD/xcF9QWHuY19AfZcoA2EqaleLHddMDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MSBTYWx0ZWRfXwvG2rsSwIQvk
 1ydY7dFm+hS+0lAF2jLIfp32kc3N+8o4CKMZNxzVE4LA+U/8v5Xo8mxci5EmtwlCKhaIOhoq0YF
 25KOa8G5rtNgROkhWtlPV3YQL6ZA+6Tju802686kU3gprX/c575jNXEMQGCDbwrMTVm79wS06QV
 cPViiGbjIsKq9qGEGVHHIejF6LLqYLHL1pnLhbXZhijUex0R5sP7GaAz32bo6CMABFZ83uDaLgI
 WT2rHilWF36a03/vqknTUQJKLTFEEU9CvgWostr4cgjLCbNHq0Y++yQjLKbjR/sgqS+ISfpad0c
 ZXUU1/V5Kj8EJEBTJKIyW/6dVfNSK5A1Yc4eQU1Ahy48cyjdsJDu5XBP4lqlx2Pg68D4mPX0/Kz
 ynuhYznSW81qbiTBVIfEe9KXPoK7r4TKTRtiTNH7D64qCeKezxCn6QnY3zpkR0/ClSiWxD0MlfO
 vOPl+pc+3cki/XeUGhLI5L74oBfj1wd0sfZdtsqc=
X-Proofpoint-GUID: 615UcZHUgJynTZeiTsdPN6auslFHLbZF
X-Authority-Analysis: v=2.4 cv=AqbjHe9P c=1 sm=1 tr=0 ts=698e197d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=RhiLXWsmbZLnVqDUpQAA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12149
X-Proofpoint-ORIG-GUID: 615UcZHUgJynTZeiTsdPN6auslFHLbZF

On 12 Feb 2026, Eugene Loh outgrape:

> I do not know what went wrong here.=C2=A0 I would have bet big money that=
 I
> tested this, but here is what I find now with this patch:

So did I!

> test/unittest/usdt/tst.enabled.sh: Running timeout --signal=3DTERM 41 tes=
t/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
> FAIL: expected results differ.
> 400000-401000:main:go
>
> Diff against expected:
> --- test/unittest/usdt/tst.enabled.r=C2=A0=C2=A0=C2=A0 2026-02-12 05:31:2=
4.000000000 +0000
> +++ /tmp/runtest.6196/test.out=C2=A0 2026-02-12 18:09:58.980466976 +0000
> @@ -1,2 +1,2 @@
> -test:main:go
> +400000-401000:main:go

This suggests that symbol lookup is failing, which it shouldn't be,
because that *too* uses /proc/$pid/map_files, or should.

I clearly need to debug this. Got a system on which it goes wrong?
