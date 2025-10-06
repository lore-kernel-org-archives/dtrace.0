Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64F299927
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764533; cv=fail; b=ALVA6fhUCQHkpjCRYjLC2xP9j+Y43zxOl7hL1FlYzcSKzoYOA5aLjEpdkDl3h7TX3yOQ1r/hqK9fFQY+85X6u5YjRvtonhy9WjvjpLStSRj3iEFt8hjc599X7x1fsmDvjswI4xTsHAraFt2mJJfPBpWszB+zv3yKSWJrxY5U9LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764533; c=relaxed/simple;
	bh=9ieSZvLX6eXYZ052LbxIz1SYO2WmKodAdqQGYc9UZyc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=POWgHUj7tuZkJZ+DoFAVjAOrU+lsTZqsyOFpnzFfPJQdq+VZ5SAwmlJnlafad5LFc9My81VubOOm3loyxANNoNTlcSzhfe0G4o7M+mat30jYC1zH3K8vE9z3gH/roH1uje1x2oj84P5kNGacga3bXYYdqjaTJG4nXa1Dtt52TTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rCwPuXkv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YKHVFoY3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rCwPuXkv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YKHVFoY3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596DxRS2030245
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gbMhTs7thKExp0EK5DozuhgupLA30Wbs3nBqjrsGkqU=; b=
	rCwPuXkvfYrWqa4iPmRXYyEyLIOJvZCPvMFSYDI6zKmh0k+pY1nxp5OIx/scfdHO
	zQMoUZDjY/InaInSt8niU7jArZSohp0YfUSAry6SP8eBd93j1x8hDACzQXx74e+u
	8pmNXph+ILUajpSjxi/S2go6CPxGHm4/Vdx7fzNx3v1bb9eEdeMGVDG7NfCtUyfb
	vL7YvkRP050nNLh8lJZODrUo2+IJ4kFI3zZ6nuxRS7SpWFdgqKorM3ItrSPIYW1V
	Px86kto1zOwUyaRFOQxm93MTV7Ac1zSFiGhPw8E0+fdZIVvxQAHkNEpDoU3sJ+DJ
	tsZxK9FPFk1h+YzKvGyhkQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mdyb8efb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596F4hFC005676
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:48 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt177wh3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMpbZ+sqNHqJsMEdY02Lxu2Ptw/wQJTqeVxHbZ9YK3VrogE8tNWUiZHRQ1cWofODfg/8NoRuLHe5p81od21lwagDVLNacGixpuedJy9ewTFNIRB9l9LJY2lCeJxsEfbJJ0YpmW4DAzSI7YB5NBdbmOXWeY3NdwkJN6bEZG1A0GnUvCKZH4NpTB/AHbzFqeuxwL84kxNOjBlvp+91YqkFz5EKl9dWM3Zizv4h1Na/sTsfji+qW//iKq7thuNWIci/hQXV4D53mCZ6m3Qs3h95fuVehuM8oCc5/pVrmcWf4tqd4z63e3K1p9vwQQ9tPpItIfiojUWbxtWc/docg2Fekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbMhTs7thKExp0EK5DozuhgupLA30Wbs3nBqjrsGkqU=;
 b=JmJ58jPSymjekjBkiFwON70MBPFBrMvkK7jbq517JwwBKYyHOkVU9o9mZRfmtgkQzxBbidCt1qkh2Xu03DouxkVjpG/d5X1XhrKDIzzH8/7oTDnDBieAw5JVFYY5WRNtoYziKTEm/+BphouHSepC2/62U4nLToAuQp5fW5UwDv3PCX5pciKgwfix3YvIgJSDIJ3IHXNE7y8Gu/HLdsbsZxNoel58PQr7W9HcqAZl/nPtqTSKzvQeU/B3QIy1eQH/MGuRSYGkZcXtgOVsre+DB9D9sWtrE/2AGSvkGu7R8G9MoXI9E7ItYLCcBmTLS1Z1asoXMUWe4ztpgbxA7YQWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbMhTs7thKExp0EK5DozuhgupLA30Wbs3nBqjrsGkqU=;
 b=YKHVFoY3y/LBhYm4Q5m9ZPeSD665qWqH716k1ews7hb/3D3odoj8pGioB+W9dQBFRWToNGZoQAcVZVOkBLmiClIiFHAAqyJQ02dwDahaJ9IW/g/rgzeSBVzm3UkcqmcAS7ou8VJ6cp0mLvUznRIUg00KQ/IS5RvlFtXGRP3qyig=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA4PR10MB8253.namprd10.prod.outlook.com
 (2603:10b6:208:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 6 Oct
 2025 15:28:42 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 15:28:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/5] test: preprocessor: work on GCC 16
Date: Mon,  6 Oct 2025 16:28:26 +0100
Message-ID: <20251006152829.239100-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <20251006152829.239100-1-nick.alcock@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: f5399d24-b6a8-471f-aede-08de04ed07e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnF6SGtDVjJ0dU9oaGZ5dWxZRTZSQk1PS3NXZ2xBSkVZL2N1cmdTb0lEMEQ1?=
 =?utf-8?B?dWVqK1RvdEp2b1g0T3dMSXFGdzMyNk5DZkhmYUcrMVVDK1hzNGJQTGR1RUpT?=
 =?utf-8?B?UllrdXlwWVNUUjloMHM3WVl4WWV1NE5XTXpXUFpkZXRIY2FobjFwbXhHa3pv?=
 =?utf-8?B?c25MRHVmM2dMS1RjYXpxVXgyYTQ1VmQwNGpaM2FESjJxaDVxaVl5N3VEZjBZ?=
 =?utf-8?B?OFlZQldZSHVFVmNKdDMvbnJBWUFVQ3cxTk4wak0zNHBZa3p6amRkQTk4cXNK?=
 =?utf-8?B?Z1BVVDJKeE1kdnBBUWZTL0hHRC85ZHkwd3ZDSDRrcXcwZGc2ZnhERUhZY2tS?=
 =?utf-8?B?ZGJrMlgweTNzS08vUnd3NG9EYmxyaTlWR0RDRkdGU3pYclY2R2NXUzk5Wm9m?=
 =?utf-8?B?NmlRZVI3S0ZsanlRVldUUDNhaWNKM1h1cS9TamxhQjBoS0cycjBXelE0ak9I?=
 =?utf-8?B?Q0wrcm1QRlFDUlVodnFWRkhhOVFjZzBzUlRGTlhseWZFNVBrVlQxL0czMnp4?=
 =?utf-8?B?R002bldwcXFNT1AwcDFmQnpmT2g0K0FaTk1SZ00wUmx1bXRLLytIYXJpVmkv?=
 =?utf-8?B?Y1oxdUprSGtyZ1kvNUdud2RtYS9NcFY2N1A0Y0pEU3BnanFWK3JlM3RKVHZP?=
 =?utf-8?B?V1VRMS9zQWlEZU1aZW5oOHZTZEpqREMvRHBUSGNqeUszWjlvY0d0d2ZydjFE?=
 =?utf-8?B?VXNodnFJbXNWc0RUclF0K2U1Y01KUDVWeERJMjNnQko4Q21za0MwcHRTdnFE?=
 =?utf-8?B?U2MzNG85ZFFiSTJlUEpGcG1WMXowMHdORlhWUTZVdHVTZy93ZUdCQ3d3ZFE3?=
 =?utf-8?B?RnRJUDFDODhsQ20rRlpON1A1b2JlaGRXZENEWk4wNmpzcmhiMW9PRWRiV1RX?=
 =?utf-8?B?bW9Dbmprbkc4SmYzWkEydCt1ZXVvNHdQM2hLMTRBNExUTUQzdlNHSUFCMm4w?=
 =?utf-8?B?YlJIbnU1aVVUTExUaXJudzVXcUJwWmsrc1RPQ3hBQkVHL1l3U2YxU3N1anZ6?=
 =?utf-8?B?djFFTVFDcTdpdm9ZZVUyUU8xZjVyT3pZN00yRXByL3NDTmpwLzY0UXJROVNM?=
 =?utf-8?B?ejc5QkFpc3NXZEpLRG5XZkpDTlM5TTAvUm83RVVNTjVkUUk3ZEgxL0RsMHdY?=
 =?utf-8?B?VWhjbmJkSW5FMHZqYTlIcWlpUVA4aUJZUTkybkprQy85bVU4VDNwbmJzTkF2?=
 =?utf-8?B?eWhMZHhCRnhPTUN1dS85bERaV3VZc0FrNE9EZG1nc3B3ZWlCTVdKc3ZSZmJ4?=
 =?utf-8?B?Z0VVSmNVMmNoRHVwUG1IbitpanY4cndJQTVDcU1FWmtUZ2o5NS9DcUhLVTk5?=
 =?utf-8?B?dDBpRFBFaVdhZGpscE9ELy84Mnd5NS9uSUQxL0V3V21hUHh1Q05DWnptUzZz?=
 =?utf-8?B?aHRYYUZHVjFmaWhkaDM3U1V3Rk1URG5tZXZRajJ6S214YkluR3dOaUZEK1RU?=
 =?utf-8?B?K05JTkRQODdwRzBJMzRUeGp4TjNHZ2hEeDhrd3d5VkswN3NCQWkzZWhIUThS?=
 =?utf-8?B?dld1T0RRMjJZa1kvQTVzQUxudzVRZE5qWUNjTVVTN0hyb3FMcnFXQWNkeHd0?=
 =?utf-8?B?NXhmYlJUL1lWR2U3VFJFb2tPaGtLam1kRUVhWmNRUXFvQktodlkrZTVuY3po?=
 =?utf-8?B?eFh3aDNoK25oZlpBWHN6dS95NEVlL0pUeFVIcW1NZ1BCSzVWMEN0Z1BpQXJ5?=
 =?utf-8?B?S3lyU2dKRHdITjJXUzVtN0RmN2JhU3JzOXdhbEJIQTJnanBzRFU0YVhxTzlJ?=
 =?utf-8?B?NUdjemNCTEZkMlZBaVk4MWVOQzNETS84Q1BqQWo5U1NhbUYrY0dETG5tTzF3?=
 =?utf-8?B?d1NRSVR5WUhPdGVDaU9oQU1NWkpmZE9BdTczN2N0c2ZoQ0FIRzJ3VnBhbWti?=
 =?utf-8?B?U3h5UnJycEVJZUhoNWY3YW1MT2lVcUNZQys5MlVDMjF6cG13NjV6UWlvSTRq?=
 =?utf-8?Q?caxBhkoxSZIytKJDw6RKSZfL3oZbGkXu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdBTit6M1kxR2RGUHYwVE56S0w3Zm0vUVhWUy9oTFNweDU2ZTVUYy9tS29S?=
 =?utf-8?B?RGZrb0FBaDFBbW5Dc2gvNUNXR0ZiSHhrdERKOWtSb3pCdTlRdGYzN2hlNGVH?=
 =?utf-8?B?TWo0WXB3MS9tVTJGOEFHRlZhei9OK2JROFEwV2VXc1hBNTV4R29hOWRSQ0l6?=
 =?utf-8?B?NVgrS2lSTTR0ZzBNWlczdlN3UlBYYnZPOERtTEFyWXl5eHdKdk9NZG84cThl?=
 =?utf-8?B?eUUvYVlCMWFWKzNQZVdkWHgvd2JFbCtMai9Kb09DbVk1Ny9vV1BnS09VUy91?=
 =?utf-8?B?UXBvZGdXK2N5dnNjU1pZdVk1a25BWFFrT1FXNHhvaGwwWUpvYnV0WmV2ajlJ?=
 =?utf-8?B?Wk4wcTNaNXY4aE9ETCtTdDFtMURML2EySEpzV256WThMZkN2ZWMwWVhnc0dp?=
 =?utf-8?B?UFpNcU4wZWMzNnA0RSs2RmFKdE13QmIzdGpEWTRZOFlxSkxsbjkxaDB3WFQ1?=
 =?utf-8?B?djZoMlBKdjgzN1RnOGVudFVHVGEyLzhhMVAxZ1lqamxTY0JXWFVQTWlwZDlM?=
 =?utf-8?B?UGhDZjRLVmQzSEFuYTkyV2tWczhjWDVidGVLeXAwcUZaeHNZQTlFV3lvckU0?=
 =?utf-8?B?NVBScGFWVVhaRW9NRGtkMy8vd2tWK0sybGZzY294ZHlkQTByT0lVOGZVbU9p?=
 =?utf-8?B?T0tZdWo1TWU4Q2w3RkhQUzc1dmt2cWNQaHRIeDZPS0tPYktqNC9NbEV3QWFO?=
 =?utf-8?B?dnpFT3phLytTMVZLUDA2WUdyVTA2VmNQdldaTitTNnJaZTYrN0NmcWVyeXN4?=
 =?utf-8?B?MU90SXgrQmVDV0oySjFzTDFHNXZNaFhtbkpZd1hOME1YTTFjbzEvdlp6bDdi?=
 =?utf-8?B?dFAyWUNwMVA0U2tNOUN1d1lHaDZiMHQ4QVhKdDR2WEFGUmhvaFhOSzd0MGNq?=
 =?utf-8?B?cy9tNWNwMWt3S1pPbTZtT200UUMyaEV3UEpVd1JHOHJmM2RHa09GdW5wMXNq?=
 =?utf-8?B?U0JRNE9xN2JheHFyaHJuZ1M2RjFrQllsYy82cVJGemtBTHFrLy9EekM3R0NP?=
 =?utf-8?B?b3pWQktoYkU1cllIN2I4akNWN0gycEM0RlJPdXRHaTUrNjZBMXVMVkE1NWs3?=
 =?utf-8?B?U21TUU9PTkNFLzNKUklFa3RkMDQxRDR3ZjR1djZQb1MxWTlIUHpjYXRLUkZk?=
 =?utf-8?B?QnZKdXc5SVlBOG1oeVFNNFRhVlVSZUdBS2VrdmxzbjlWQi9sNDFNSXVQdXV5?=
 =?utf-8?B?N051MkpUWEFJMEZMUUl0WXA1VHhMMkNIRGoxbHY4eTJ6UGFiOE5SSlFML0Rv?=
 =?utf-8?B?bDFWWHBNWkpEd2x5RXdGblNPZkRsUHRzUmZFb0RZcTJOTWpzbkRQOVhTUEsr?=
 =?utf-8?B?aXM0VTE1djB5RUF3M0p4SkU5UGZEemE4Rk9EN2Q4b0M5WmZ1OWljSzU0NUNC?=
 =?utf-8?B?cnFES2Nlc3NZWVlIcU5zQmxZSERHNlFNaXlPcVk3T0ExVU5RT0EwMGQxQXhh?=
 =?utf-8?B?UnA4aDB5T2V5bkRJb2htbFlibTByS3JBdVBuWFBWakIrZUI5VE5YUG1GNjFm?=
 =?utf-8?B?NDlpbEZRRnpIMmpqSWs0elZpUUxCVDM2elp4RFk5VzhsdjJ3bkM3Z1NBYk0y?=
 =?utf-8?B?dlNYU1YvNXc1R3BLZm52b3RObXptTnVjek84M3FDOE1PRndrYlNlMllYVE5I?=
 =?utf-8?B?cFhXMUh4dVdnTWFUenhFcjBCNmJQV0NyVDJEd1E4L1VMTmk4ZTBKVUV4eHpj?=
 =?utf-8?B?OUJQYkphNnRUVG9NSC9nWVI0Zkg3MDBuWDEwYVcrNTAycVBrdnRFZHhEUk5j?=
 =?utf-8?B?ZmpYbGdtazU4eVlDZVREVURxSDNUU05ESUQ1djUydlFrdExhM1M3V3g1TXd3?=
 =?utf-8?B?dUhld2R2TVVieUFnajJUMW0wUE9SZ0tFTVM0ZGI0enkzc1FjL1Y3MktKUk5z?=
 =?utf-8?B?NE91VEZwMDZqWVF0dnhsMmhtUUxsd3ZLOVVGbkk5SVY3ODBtMTVhQWJ6cjEw?=
 =?utf-8?B?RjNYalZQK2xSY0YwUmNYNTVyalR1cDB6K3JpamV5cU1hU0hpT2tpaWxpVENG?=
 =?utf-8?B?Q1BBdnQwTGZSdG1vZG5iY2s5ZkxJN0QvRm5sYUM0V1BsZ1hVd2xsbEV2SUFH?=
 =?utf-8?B?cDB5VGlRMkx0a0R2S3B1NU1FR1lEOW9GZkVrcXdKL2JreWhzeWhTeGJVOXpi?=
 =?utf-8?B?bDBPT0lrYnczUktudnloMUxUNE1iMUtPdEJ2Z20zWDRzMlJtVml0T0hGWHpx?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L5NrgRPZltTHd7LqWmu/BOy1D4DWCb9hssZM/XrrHeyWVfGrrE+HrXcZJqrfxRgbMRNmmbQhS3fDqyrD/iPyVNTGZKVjKdtnFCq3k9+4TNQf5zsX5eZEOvOiraPWv+rPXUcV2vZ7nmSQjotP8irUfj8/OK40D+tJ+zdPMnGLzFDdfN5M0HpkNfv8DPu0ajVetaoFkXzcLBMBgwzeU3nHA0PGVFmsyRGgvgSns7sDtNE3Io72qOQe2v2nq2u0vygZG+hwmO13F08YJIUaDuvpo7PC+j7D4N5k5FTRUM+sJo6T5tdVKuh6VGxHa2YNeYsozb6rkRd9L6n6RdznpdOxqBNdACvz4A7ZTr6rOVurz82wQ1AT3DinthXgi9dwSPstMpsFTZJpvSUne3vQPscaBKZ4a8Q5rLSUdIBPBEI87JEL/97hlglOgk8Mpu3vqztWvOqdeKEjjv5BujVdKqqorTzZxqJDWd2BzpkmZ/0+8zc5yZcyOEyFCBeZJKqVWmsLLZ5fVy5mJgAIztFI8CUwOWjJSjkus+X/XC2g5cwVfD7g8otfzTyT1KrApSnWvemVUv7U7Vf9VNYxpJT+pXJS+5au2KBzyk8cnogdG5sQWZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5399d24-b6a8-471f-aede-08de04ed07e8
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:28:42.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O1FIFfDtZPOy//ANAkPEjEfZdWxnf9cgTYNf+7uJgyKawsYJw4CAKwtg86YmrxEwRHscedwBPp3bmRqBeFEAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510060124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEwMiBTYWx0ZWRfXxo25LK4QN2Eq
 gxvfk5VB/qPZceZw5zXJuVzasvNJTzxLOSugZfnohrZvYm7N2ppYclpjJPCtw1dpuaU2uJzN1Ln
 qSFqdC3605+Ymqv2xx7TUvs1R1JdLhbXnlzwWzGme9fpObXMRRcaUuLMaYxOboOgX4KnzGrbYoE
 QF3UFizxwAnMxQYPQDGsOcR/wOIKHgdpIAZb0b17o21zX3IjBxxTUMZjD5q+gsJ7RsrL6+djdqb
 B8LDQIYc5guZLaywz9hMIDdslRtsFkITEpRSFB1OIX2vvX+bWb3NzWF8sXrin2jFB0IeN1uLJDD
 b/3TuA0itILQLAbmdVM73TLbTpvNhQC6+YZo+J9js+STnSVmZcHYCehJZ+wK6HYqC77TZPS3eEe
 fI3eb2I5VXT/2V1fT2cTtUv0wVdpag==
X-Proofpoint-ORIG-GUID: h71Ij-eLuhXCR-U6fBc_cSMO51llVoSO
X-Proofpoint-GUID: h71Ij-eLuhXCR-U6fBc_cSMO51llVoSO
X-Authority-Analysis: v=2.4 cv=Cb4FJbrl c=1 sm=1 tr=0 ts=68e3e032 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9y8Gjn5OlH79kh9BYDkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

GCC commit c397a8c12296b75a91ae51e4889debf023e6c338 ("libcpp, genmatch:
Use gcc_diag instead of printf for libcpp diagnostics") made libcpp
quote identifiers and tokens in diagnostics like the rest of GCC does.
We have several tests that rely on the old error formatting: sed away
quotes and smartquotes into quotes or nothing (as appropriate to match
older GCCs), until such time as GCC 15 is obsolete (a long long time
away).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/preprocessor/err.defincomp.r.p   | 1 +
 test/unittest/preprocessor/err.ifdefincomp.r.p | 4 ++++
 test/unittest/preprocessor/err.incompelse.r.p  | 4 ++++
 test/unittest/preprocessor/err.mulelse.r.p     | 1 +
 4 files changed, 10 insertions(+)
 create mode 120000 test/unittest/preprocessor/err.defincomp.r.p
 create mode 100755 test/unittest/preprocessor/err.ifdefincomp.r.p
 create mode 100755 test/unittest/preprocessor/err.incompelse.r.p
 create mode 120000 test/unittest/preprocessor/err.mulelse.r.p

diff --git a/test/unittest/preprocessor/err.defincomp.r.p b/test/unittest/preprocessor/err.defincomp.r.p
new file mode 120000
index 0000000000000..62577fe0b6bbd
--- /dev/null
+++ b/test/unittest/preprocessor/err.defincomp.r.p
@@ -0,0 +1 @@
+err.incompelse.r.p
\ No newline at end of file
diff --git a/test/unittest/preprocessor/err.ifdefincomp.r.p b/test/unittest/preprocessor/err.ifdefincomp.r.p
new file mode 100755
index 0000000000000..7629ac5973957
--- /dev/null
+++ b/test/unittest/preprocessor/err.ifdefincomp.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/sed -f
+# GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+# supported, we have to sed it back again.
+s,[‘’],",g
diff --git a/test/unittest/preprocessor/err.incompelse.r.p b/test/unittest/preprocessor/err.incompelse.r.p
new file mode 100755
index 0000000000000..ae9a6833d106d
--- /dev/null
+++ b/test/unittest/preprocessor/err.incompelse.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/sed -f
+# GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+# supported, we have to sed it back again.
+s,[‘’],,g
diff --git a/test/unittest/preprocessor/err.mulelse.r.p b/test/unittest/preprocessor/err.mulelse.r.p
new file mode 120000
index 0000000000000..62577fe0b6bbd
--- /dev/null
+++ b/test/unittest/preprocessor/err.mulelse.r.p
@@ -0,0 +1 @@
+err.incompelse.r.p
\ No newline at end of file
-- 
2.51.0.284.g117bcb8de7

