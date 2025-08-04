Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59301F4CBE
	for <dtrace@lists.linux.dev>; Mon,  4 Aug 2025 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754350973; cv=fail; b=YdHlykBCMwqTzf13A0Y7TuE+TCjcg90EMeof9E5W4M8uvBtg9X84oFyjWEqKSTcu5yjmQyjC0NRNBlBfV63Ln6s1lrH7v2smtNxifzHwRArkRD9lz5AIiMZabuxJGmymMTj83gjmTcDrBmSrK+VdjIepkj/fz0BvvtLVIYYg0Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754350973; c=relaxed/simple;
	bh=b9tmt747lMm2HuaVXDyl7Ijk5WpgFgOHMFazYz0mSFI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LI3ZMowd4qtQeyfZu3rW/vzcCCtV0iXAZVqWkanLetPkutatlnxvjjnuptjFVmX/BcGoeDRLNnu4h/DuQvHkss/TDdqj8pfU9V9KpGoWkq6ILmcjhUWGfFHfeDXFUOr94lwsdUD0dauEzVIlfTQMkAh8FIR1jiokmbJl5IJcXC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qKoXBXhy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NJ1LGEcW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qKoXBXhy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NJ1LGEcW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574NgBwU024898
	for <dtrace@lists.linux.dev>; Mon, 4 Aug 2025 23:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=h+9wnO3vT1Sp6n0dGxc6h/QTOzIIM+5p0uGVXosOWhs=; b=
	qKoXBXhymKZ45vt/Fwv5iDc/mzuYONdV4MniLo5VaMwwS/0kHivLUqBBI2SOoDbt
	GA+ZcCyvRrRQ3Ww3tcMC3BjmSuXDcAs2C/+nP+vI+YrnrsTNgtXPnhipijzRE4nJ
	TR9rTH36fmtFMKFoiC99D9THGKbYfVUgXCyW43Eko7AzmoVVwnnmT4LFKE8RIO9n
	YL57rsWOzUAl5S/gzd/PR6WkOM3RfPaBZA7hrzi0mDJ+js0qcNUBTgF5a4tME9C8
	YweKYMIr1fcd2dCjRI//aPdds/hvhxuB87cT1AkcIxCBurs2Hww7M9skda/7iPO3
	ILCubiERJGP5rgK4N1UkSg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4899kfbqy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Aug 2025 23:42:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 574MFmvh018081
	for <dtrace@lists.linux.dev>; Mon, 4 Aug 2025 23:42:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48a7jwhp2k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Aug 2025 23:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbJqzSAX5AP3YOEOxVJyBOSxPexpjNKvV4jJ90+RZp7KcGOwlRzF+wVY9V+0ScEw1WzEAvw1r5YY+6pk7VxKZ9dCaiewHjAedbA4ylKqrTRzSUhfnet1e8njMcMhHdkp279DtRqlG6pZsqs+y9JlR//w0LoBhUI0F03kDe0WT+5JoTPZklEmGV//8thsM8Qb/QX0Whg7AYo2kLKLLWL1LJykEFlOk2cA/O5eJa6JeKeDSqbdQsKSCDhTxVZPvDFYi2NK1COqaSZ6EHdu+d7K1lCb+MLKO5lbXVdoKxF3VB4+jVue8rs6q1FW8cxwx+/sXhakNG+R3y1eDu01EBkIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+9wnO3vT1Sp6n0dGxc6h/QTOzIIM+5p0uGVXosOWhs=;
 b=Vj6KzJ0aHg12XF2XL7ma/paOTM4/Z6irDJNbqRLnqhxxsP2cZKxHdJsh+8L+kUb7QlNYw3PbN9fiBlBB2SRTrIE3kyjb3kircDmPZN+owJ97qDCpV9LAfvnbhqNpzxQzgjC1jcyX2sBlaOaEFKBTaZVV1Z1oFBkUy2rQuirFRdfrDgS1v1KgSRD9FGnjXidI6qAtZKi9adfomPwfY+GzEi+sm5LOs7EJZ/JvL7Egnro/p6E2ymkfeY7xocr9uA28gh/+enSKetRdvDKKw5e+2W/WxPZRmzgcs+zKkzdd8rny2zT+psBScEEMp/neyCjgsBHkOnCuhivMz5DPAhvhGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+9wnO3vT1Sp6n0dGxc6h/QTOzIIM+5p0uGVXosOWhs=;
 b=NJ1LGEcWWN2iP1N7MEZugsqmgV8i/HVj8KaGpg+lTrQ2PX2P2Uy77SsTuUypshzOcav1eduSpBwcB/rDVc/3nH+hgCoYWR/v9v5IF/6TvZ8BBHGN2FWojJ4BY0jQeuXDj9yPxfwOpuqwVdcbpxefEKop5BhL7fsVT6bfpZE1Zv4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH3PPF517B7003F.namprd10.prod.outlook.com (2603:10b6:518:1::79d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 23:42:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Mon, 4 Aug 2025
 23:42:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] examples: add script fcalls.d
Date: Mon,  4 Aug 2025 19:42:43 -0400
Message-Id: <20250804234243.6470-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH3PPF517B7003F:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea976ec-c0f4-47e2-fa3c-08ddd3b09d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J5fX80x/MhpbM8JIXksb9buxVmy/A6r9bimafP7a5vyduo1O6iem08DaBgmU?=
 =?us-ascii?Q?LDZu16ile0iGWw0ATgjgiBWOhJijpt0+Z4sd0KBdDlCvKnNoSMfIdggXLN1z?=
 =?us-ascii?Q?Szs5mzeEPn64m/nQZSwL6x9gsKJUiQOGD9mi5caE4OI0u7W11lF5Clh/Ac52?=
 =?us-ascii?Q?scwiM0GPA7ra96E8IlzzPoEFAHJPkVonMOZ+6dfInxwwMaSOeRD0hNtN1M8k?=
 =?us-ascii?Q?rEbRXxhPr+pCIWP3s4i3uHqRlSkO5CKC9HtgSXOLlMhFVqCoTBO8qfXhdFMg?=
 =?us-ascii?Q?jOp8lIcWWQ711vNkpcEisx+TzdYy95xIwQ9YnPZTwccS9q71aI1nhWj7dnLX?=
 =?us-ascii?Q?EOADrPrc8092gZOdCvIWdsfO98R22XKpbQsRUPV4ogU2+tfoB2LEv3Hp8Oyd?=
 =?us-ascii?Q?skkFqjDmUbnswaqJWLCH1+Cnxl+XYCgR2yfOYQSiZwM8dQUrNSo+55tGpEkG?=
 =?us-ascii?Q?GSLAi8fYlfGFi58eZaAXlwr4iTjbv6ZxSlyCtHiNuFh+d4VVNZig/ZHoHd74?=
 =?us-ascii?Q?XR0px66vZOni/14V5iPF2Gw7o2onZcXOXiWXnf/ErV1/jJR906KDarT41ohH?=
 =?us-ascii?Q?ykDXHC6cRtjBxysEmXQYbqmGRyxt9VBXivVZa5rc8qcQPBfcUhxuD2Do3oiQ?=
 =?us-ascii?Q?1icTvAotg1QRKa+gL87+Rb1C4+/hPnWRCFIHy9daLZUK6gQg+sHsHkXtHObx?=
 =?us-ascii?Q?s5PCg8CdkAr89tiVs6mLspHAclh/aC7tI5RebuuPjOuwpF1jKIxDWIEl9May?=
 =?us-ascii?Q?2hYMpqTc0xAmJ08jguExYjg2RehnQKlNGIbVrKvTThGEnOYPZNmOnJTabdGF?=
 =?us-ascii?Q?MUJlSw99uJ8AoV+6GMiW8Z5CQZQN+S+YP2XeJIwMQ/Bi5JzQtp1KvCBs9heE?=
 =?us-ascii?Q?mQbpBi8JK75zILVix8pQgQw2XnnNZOmelijy2+3wS9kY4lYJMGZVgr9BkrYl?=
 =?us-ascii?Q?41PRZuubQ772MLCoTfsiXkJyhTuYhgMry1s/Sf/VwwJuWCN59BLYE4tLx7Og?=
 =?us-ascii?Q?lu4HmFi4WNyjD7QAMcbAkh4+G+6h37ObGQC4vIxNaTn+E/pvNQbWVJcSL2Xb?=
 =?us-ascii?Q?fN7sdHNE0HI+wQimCU0qjvf8unk4pd3KgwKlV4qIRMsX7FPtHVAkpVeAvoEa?=
 =?us-ascii?Q?d80gm5NvFu7AK9BhaW0jfOHZhkwmad3SUvchAwyexGXCcod4LLC8jKSbr8rW?=
 =?us-ascii?Q?5dh+ZSOvydKaYGFPV9PWk/H6w5qES+EFegxDA/zLi2C34tom05aXqzXVl5CI?=
 =?us-ascii?Q?0Jqpf+XorXqmxGYdNV/31M/7TZN7H8nT5VcZ9J/kYftHnI76HRdNJhuALDbH?=
 =?us-ascii?Q?hKMg2MxJYOIXu+SKZKPEYKnsPNiKVQBNqlMNYESxyF/f7r+SAEV5zo1XdP6e?=
 =?us-ascii?Q?WCYL5KbxhD2tNGrMK4aW5b8h+nhNc2XqU3VELwgXUzDPc/TGWCNN6MtfqVic?=
 =?us-ascii?Q?r7lv/P+Sl7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dx8QZMqzOfVVJ8rZ1dFQzK2bRvk5pDDGj/g1nK7iWL7xkUPv9QurL+u0Iwbg?=
 =?us-ascii?Q?fTUljPTwLOpNnbvjK3z2eFKszpJbEq927hvFJTXlf/VQb3SLO90eLddm2N1t?=
 =?us-ascii?Q?risoQ+k9tpST+cRmpvwdsac7JT6nlfUMVYDPF5KXQOz79N70AsL2tICtjBaJ?=
 =?us-ascii?Q?FO5hrqK4vmeJOqL/5xT98/EIZx5ufohR34sDCQoFy9WOOX8U7Temf3JjwP3C?=
 =?us-ascii?Q?/dLy+h0OmhKLp+ToF2WgLGGOpzl35hlaMgiqpaY0YrDPlw9KGfuRAWJRGbLH?=
 =?us-ascii?Q?sUBMPz7bOfEUj+kikHH13QKunBAEFwmL8pYUfa6FFp/v8gXgj7vQsmM3wRRe?=
 =?us-ascii?Q?04ggqG3FKhKJ3zGtQov8SCPHuLFZv1vI/wodm6fQ7wPgmfuH8747Z17iB7Wn?=
 =?us-ascii?Q?tZ3BJl8hR5AJMTYklpBqQQTyW570f7WbPTp2fo18wie+rNdB1FdEfYSJVaN5?=
 =?us-ascii?Q?6s6lBpGuoStEngBC3BgO6Zu1AzYslUu/lk08VNFXNNhGnJTG7rMHne0/EWzl?=
 =?us-ascii?Q?MlL0e2cG8hsyVUqUTE7HAO2Gdai3j5MD4Gio4djRrrGMj9FlNmDFyZs7DafO?=
 =?us-ascii?Q?kZz/ZnTjKChp30xXM3shxal2TXGkeT6pmVfTo7i/BcLWJAruUntjbv+2jCqa?=
 =?us-ascii?Q?eBobvgUtbcrPwtK33+vIJGLuixSWEN6bJ2X24KI8LVsrc6BwYnTFx1cjKBZq?=
 =?us-ascii?Q?yGUqL1ro9453KPKqi+OJXXYdtR4Yjh5+sudaUjUUpiefUV2HQ56VqfcKla/1?=
 =?us-ascii?Q?g4nVBQ4LWsLruvvsw7ib1Y5TSau0V2H77df4yrnXGZIxV8BNoh9iLUfQ2PvM?=
 =?us-ascii?Q?2ds10//jObSzFsh+NQW71e8b/vFZRL5cWZevKt/P8KFMzDP5Y9rkpSimG4Q5?=
 =?us-ascii?Q?cLkgEsdKiN0zzlm0ZKBx8G1hYUmN5mGe5yZyFW4IIcnu/gaJupavRLym3H35?=
 =?us-ascii?Q?PMhLlWt5LrOl0NyhEE4otIkbCUFCXjzBWzLnI35ImCwkm0Nml9/8JrBw3xOu?=
 =?us-ascii?Q?sA/pYQ78KZpbmMNz1A1zAMK2SItaLXkFrjTkeCAcQxJ2wGQyxVGHhCyYDZVu?=
 =?us-ascii?Q?0xhbjX13b51UKeLm0mllBtMkJLvqL8LWAi9Cdcw+Cs2azAlNb696N65sydyM?=
 =?us-ascii?Q?uKXeYYshofPEVnf1Dr04y2c1aJ7UBRso1NWLdxNFaZSRoW029ulkz0e1G7pn?=
 =?us-ascii?Q?Vdzql1ziWRCCAuKWq/DFXZOOyJYCBWIpDVRnAbK0gt2M9dibn81IoG/l4Xo4?=
 =?us-ascii?Q?h6YDD2SQbab5aoewR7i2orXzizSf7DCbKi0SVOMDJSpHO6lnIh2gz4xq/G+F?=
 =?us-ascii?Q?aZe2Dz2X8LAh6YxF4tPJKLDHBqnX1BpAl3t6sZP0njRn+kNqENwARLcc+O8e?=
 =?us-ascii?Q?Lk+CgsvGcyYvuUeG8IO8Mk2x5iLwuWQjT37BKzh8vbcyJ6bQRZPeGAlz984o?=
 =?us-ascii?Q?Si+pTtseg45A2Ren2KCCbIeVNcRnPJIHgmlOTCh72qX5/wIM/HmWYmSvcTWp?=
 =?us-ascii?Q?pk3JGlhSVVEI138UQeaqxZaAjCu0+pis3wOLokZA4/HlAVBowj8Ry6yt3J4S?=
 =?us-ascii?Q?MDVrFEqdRL2HIgx1YckqX31rTNC/1owiGdHaoaU+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vgEYUj9cRBVzhog9a7vzDHRONpL+UGg+2c8y76L3yMOx051m6pwjW43Yek+i1+5WZSTWONO4Bz3chu1DU+r7OJXIUuP+YK8E/jX06V8V/y6+4o1moT+t91Fy92g3GpvPfbYrP/rq5w30jjeZwhJ19ClTP57WAX0RyHqdgMIUt8DI0bu+9gl0eEJjlbGO9RqKsIbYjGvrNGLHwlMIZE9/iYS7NOJaNn20+B17N72z7eBwITOO7UCETe4gl5+Ct+e7vwl9SJd4nOcLcKByCdlqsPUyHbWuGe056P05bZWB7gsPryCEa/dA5Cu6w7m7nlvHvNAgDo80bu2sz3ImoTMaWe4fHvAJwtSUwPfFrDtFbb9i93zN91hm1OZluMHudchxABMU80r/U3+RwA7pa9femnDRKoIX2wMJgjVjKzI/DMCN667eJtwxcKX1JgefUVs/6pBodg+trptc1psk/6x6gKxCAK7dnzfSM0BBlVhOoCmQoHaruD7A+qtHaxVSbab9SWY1LaWGmvtn+SrMYy+f/quaWbGJSQk3+u2JnO3FW43BTOHo+zB28dhsDUpu0/exhfV1WaVQlRAFM5IdQWJyDcP7ZLHb3j9NkCn9YDksQSU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea976ec-c0f4-47e2-fa3c-08ddd3b09d2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 23:42:46.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUjvDgOmWxEYfg5uFNVc/GETPDufjjoEauXKd4f+5Nzr+6Y9w4al35/BANdNZKU1ZRkgT+mg0HMeoJ4jRNGozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF517B7003F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508040144
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDE0NSBTYWx0ZWRfX6Eypw7vC2KM0
 5zSNzwWe2yG+wlX9c7XrXiWbh7YsM7uV/qt71DMmcN516bcMCaVsPx5ocxxea3RKMj7Pdimw8eL
 qAzzve6NZ1b5jDHj7Z3UyL7GIE9iyXR5ez5/S3cyQ2uDjCiYDdVjh78LeVTfzW5ZQE93LvVjHb5
 khS+XJGwnBYKAsm1blCZ6NIJJ8WZr7SXKrSjRzmGLXVUd8uuEmk4uuqYpEzuk/3jkcLjxZkChE4
 ljysnFcbD1p9XGPuxi/NBexVZUHn5+MoUPg1rQHisZSwbWtyi1S6qmLGqrpymAvXlwetN5siXXd
 u8VQedL/BAG0UwPNOiMD1iMWQ53gs210Ifff85ievOsd3b4jT9AB/zvffg5RhJSDeeLDNLUxIU0
 +bYfMib71hfaFtWPFo/4NStNWHJsgjpnpHLYXYAmtaU/01/7uZT74KzK8wB7MLibDyUk9WcX
X-Proofpoint-GUID: vr-2FnWFkulsdC38d1ryU9Ja-BnicdP_
X-Proofpoint-ORIG-GUID: vr-2FnWFkulsdC38d1ryU9Ja-BnicdP_
X-Authority-Analysis: v=2.4 cv=VMvdn8PX c=1 sm=1 tr=0 ts=6891457a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=daUx7IgtWjzcNmsaqMsA:9 cc=ntf
 awl=host:12065

From: Ruud van der Pas <ruud.vanderpas@oracle.com>

This is a script to list and count function calls.

dtrace/ChangeLog
2025-08-01  Ruud van der Pas  <ruud.vanderpas@oracle.com>

	* examples/fcalls.d: List and count function calls.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/fcalls.d | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 examples/fcalls.d

diff --git a/examples/fcalls.d b/examples/fcalls.d
new file mode 100755
index 000000000..8116ecc6f
--- /dev/null
+++ b/examples/fcalls.d
@@ -0,0 +1,88 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    fcalls.d - list the functions executed by an application
+ *
+ *  SYNOPSIS
+ *    sudo ./fcalls.d -c "<name-of-application> [app options]"
+ *
+ *  DESCRIPTION
+ *    This program lists the functions executed by the target
+ *    application.  In addition to this, the number of calls to
+ *    each function is printed.  This information is given on a
+ *    per-thread basis, as well as aggregated over all threads.
+ *
+ *  NOTES
+ *    - Since a.out is used in the probe definitions, library calls
+ *    are excluded.  If a library like libc should be included,
+ *    duplicate the probe definitions and in the copied lines
+ *    replace a.out by libc.so.
+ *    For example:
+ *    pid$target:a.out::entry,pid$target:libc.so::entry
+ *      { ... }
+ *    - It is assumed that a function called main is executed.
+ *    If this is not the case, this is not a critical error.
+ *    The first probe is used to capture the name of the executable,
+ *    but this is not critical.  The probe and printf statement
+ *    can safely be removed, or replaced by a suitable alternative.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and
+ *  have printa() print the data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Store the name of the target application.  The probe
+ *  is restricted to main only, because the exec name needs
+ *  to be captured only once.
+ */
+pid$target:a.out:main:entry
+{
+  executable_name = execname;
+}
+/*
+ *  Use 4 aggregations to store the total number of function
+ *  calls, the counts per function and per thread, both
+ *  seperately and differentiated by thread and function.
+ */
+pid$target:a.out::entry
+{
+  @total_call_counts                          = count();
+  @call_counts_per_function[probefunc]        = count();
+  @call_counts_per_thr[tid]                   = count();
+  @counts_per_thr_and_function[tid,probefunc] = count();
+}
+/*
+ *  Print the results.  Use format strings to create a
+ *  table lay-out.
+ */
+END {
+  printf("===========================================\n");
+  printf("      Function Call Count Statistics\n");
+  printf("===========================================\n");
+  printf("Name of the executable: %s\n" ,executable_name);
+  printa("Total function calls  : %@d\n",@total_call_counts);
+
+  printf("\n===========================================\n");
+  printf("      Aggregated Function Call Counts\n");
+  printf("===========================================\n");
+  printf("%-25s %12s\n\n","Function name","Count");
+  printa("%-25s %@12d\n",@call_counts_per_function);
+
+  printf("\n===========================================\n");
+  printf("      Function Call Counts Per Thread\n");
+  printf("===========================================\n");
+  printf("%-7s %12s\n\n", "TID","Count");
+  printa("%-7d %@12d\n",@call_counts_per_thr);
+
+  printf("\n===========================================\n");
+  printf("      Thread Level Function Call Counts\n");
+  printf("===========================================\n");
+  printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
+  printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
+}
-- 
2.43.5

