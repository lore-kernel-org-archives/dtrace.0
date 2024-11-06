Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AA15383D
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911631; cv=fail; b=ViJFzzEZ9e1/2XljrtMD4tzkKamaJKJWQEG+uLwX8r8dGc0kAbQ7ZL7a7QvKPXILN90qP1GRwGipA8Rxkm4DJYfIh4RE562FiCmXM+qGmj6O0Z/6tlkfkODtGE5bl94RrHFfFWwQmS4R7XGeqLwRjfMhe7kZXEaVCRi/ZcBdrug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911631; c=relaxed/simple;
	bh=e9FA73A+LBAhhsSnIi8f6dYLjaoha+OIVSZ4GBRF9yM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KuZgWeAL8bDgwalSWwik8adP/velKacNqgzdapWSfJ3UyR0XB+1z1Ey5sOeNmTrh+DnQIlYxn6bsqzjDB4a+5iXzOkeswvzY72sW4ec9MdLaoSzLNYo3JsG1xyzSapBQxXGWguKopa+Hqm/Q9zJdGyUNqPlVLVKInouWNiKaE/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bAbsDrNR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZhtvceU1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bAbsDrNR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZhtvceU1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Ci6c9005770
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 16:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=4DcTG8oLKMc8NSxL
	aAXXmuJreR97j1AGYqYoL1Vy7UU=; b=bAbsDrNRUFbbdqmy7RIOALkTG4Kc72C9
	CRDYQHfTjulge+/1MY3F4uswOYCwDmTSAA/kvb9DJWDrzNNV8V7Ws4KsrAFonXkr
	raK7fMQNCy18B2tyOm3Hbur0l/o226Y9uRuTDIta5hsogfpm/hmcBQ72RVPKMAWV
	jT8+cMdJzEp3OQXWy0JAS/Muo0ti5r8+SZh3q4Iw2t747eJ9O9pA5UT+uFT+hjwU
	tEbUFa1jhd8FCO6A9epVQr+pgnZOdZEnwVO8dRPlSaKY5uMdNp3Ug0S/gEMtNsQj
	FXT7zw52bUKJWBzMDbm6gBLbxrqNiECx1QGkj7doGro4Petu1eFo5A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03bdju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 16:47:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6FRgCS035612
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 16:47:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahf34fq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 16:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5K7uTTJg8FuTp4esmKrgmytEGxP/OEkKdabptzNndWjOHBkOO/X9nOMQeQ0bYPNAL15o5BW+w+XuhBCEE1qSE8d6YFOy7cSOtS0zUmqYJtbTRgnoJNJww3n+ovQrylrutf2Kesits5DK9sgy/SNcmoIRK40zZdjNzkY4TjiH5QkC2kVWsB4NKEQa0prygjT2qwV0P9Jg6l3RpbB9W4LJs4yRm2gA2V1at+TXQCUuvbx+4zZtDU7U1agCWaXvjoQB+cMINyfdJ0x8SdSVn90gw/KhhIhusgOMxdfiPSYluHq9knAPB86Qvi96LgfuxZsUhSFdGLLaCSZq7AKvQJBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DcTG8oLKMc8NSxLaAXXmuJreR97j1AGYqYoL1Vy7UU=;
 b=JUMyH4AFN9jE1YpbAcVF6DMGwLWdX0H4fcGiqyqQn/sHZ7WJK7xBb7IC3+9p9EU0ksNKFEy5JfZIJs42Hvay45bpdPyU0s0qqKpxov/M+G5roDvnR3kFe5ufXiBMXI3SY8e/cI6m0iOs7IkLYU7ZywaVQFxzpSfnWWFYvO0rhp/1GDYSPEtz9pGn/tWFloT/RxRZk1SrGQktEyd4pQt130N23vYHuI6pgJmZOQLbszDZhXVEXff0ms3qr+kU25yEhBPFYZ6HpuWgH/bbI9uKYgN9Yte5NVGk5XAmndlMQEZCKOX7nImgFvqxDoFIlCu4GCLjUNs+Xxt7sliA+8lvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DcTG8oLKMc8NSxLaAXXmuJreR97j1AGYqYoL1Vy7UU=;
 b=ZhtvceU1JbuXEw2sCfVT++iLIlGD6HVNgR0PaAbYAmxsksV5F4VB7LRsw4+EANpiUAeRZc6852wg40ljBfMFt1RrB8XVoh6ju3bFPd3ZpvY+F+cr/hADheSraYWXirwHPMKsd9KIXlP8Qk5d3Y2Fehbg5CjFEpuyvxt25JIySBE=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BN0PR10MB4935.namprd10.prod.outlook.com (2603:10b6:408:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.32; Wed, 6 Nov
 2024 16:47:01 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 16:47:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Allow arbitrary tracefs mount points
Date: Wed,  6 Nov 2024 16:46:56 +0000
Message-ID: <20241106164656.421931-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BN0PR10MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: ce678933-18cf-4ecf-8689-08dcfe82a30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JCLeWSJJbmdQTA/huvFKWwGZAq/8zbNGF+v/08ev60RuB5qJfWY8xTpcL76o?=
 =?us-ascii?Q?e1vpjpstpNUE1TxYcQtY/KbwHtfHz8ikH/kh+rOleUwH0aolAPu/ylL3XMnq?=
 =?us-ascii?Q?zK5tIzDOOFWzXfmNYhxW2T1MSe/WEWr+gMmZjqWJimAqsutc+KQGLMUTMQf4?=
 =?us-ascii?Q?V+dAkIWdxrzNjBv8Ek//jhrogOqsplS7bVLWPFzbtA7agrRX2RsrwMlFlJxK?=
 =?us-ascii?Q?HMxkopBvr+qgq9HrK2zDuO9T5TQpN9LtjtT6p2Fl1kdAbt7m/p5nvrCa+p19?=
 =?us-ascii?Q?kdB2LUihHrfTG9VHWqUN8Z0oo4w8HpnbPy0NX/akwvzu/udvtNZt3+iV+HSa?=
 =?us-ascii?Q?9yzL8XQ0OUVLu816uWZExTpz5eCoYBb2WE6Mqi0KxThKrBYu34Yzcf/CW15k?=
 =?us-ascii?Q?euCZE1xUm5hIG/Mq6+lvH27lG4MM3fI3+VgVv1tW36c/Mbq65A2h8BmvTFsd?=
 =?us-ascii?Q?V5sWXR1zZ9rnFSkDGLRoQ5odVVIZSVq/S20t74CtxYoYaEgNfcqQhInfVhNf?=
 =?us-ascii?Q?yRmrbKGpfib84Lu63oyeSusvz9i6p/QFVoT4CDeu5W6bSzqkYtVvrGSRrf2N?=
 =?us-ascii?Q?XU2A/3KyJ8TtzNPBaF+C2S+Sec/cYf496rll7OYR8+2IUWqUUfT+XW1Pb4nE?=
 =?us-ascii?Q?+rFbeWraRswSPXaHvtqhQoJwchDIcnvHymoj4nu1P1Kvcl+9UsfJcU3TfeD/?=
 =?us-ascii?Q?h1zyd0ZhTTordsvtjTq5FXC0KMNRzyPOk+Yz5vIOCdkcKt1we2GaYt0UxxGP?=
 =?us-ascii?Q?9SYDA/7MHuqEE1cUqthoels2AzCQzrSr9uOmLf5FRh62Mk1nSrwl3LqmK4VB?=
 =?us-ascii?Q?sabaU7n53OUGwthNQV7RHWtDuatVNQZf6sT5U1lEELHG+Hm3Stmagvc7YUD4?=
 =?us-ascii?Q?HJmDBlWbS/9+8V1OJWpk3CAWmxbkvZ7shW9dMV3jqlva+MfAHiKaY+85bu2V?=
 =?us-ascii?Q?hWrHtWPoM463KAHNlwD9TLaYzgrLOPT7oLlz6QyZy7CfxypqlJ0LKEOJwpo0?=
 =?us-ascii?Q?VZjFc96wO+PS0sTN4+KrM9zaBNPSKm3NCmJyHNH+o1O8vM10YEA85JUxAf7y?=
 =?us-ascii?Q?BMFbFK42M4QQqgZ+m/mi3MQkC/VdECuYsU88NF5475cETQ2k46G5a680ucDe?=
 =?us-ascii?Q?MO/sfvIY+NXpMDIWh7jYhrl8IJHNUMgWpDzrbo0Gu/ML5RE7RmA9DqvWGKHw?=
 =?us-ascii?Q?OkuFDm+vfmFrT88JW7JSYFpeH3ShO9wWkadULu1z+lJ2ylCrdPwq+zMtG+sE?=
 =?us-ascii?Q?KcQMlwzU8OaQGvh9dBRtcS91W2UMzwsxonLHJAwm1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcfPVF3FB6Jba+KusW85TS1H+5R8VgHBcAw1wf2M9kJkkAP1kWLmE3Qw2y1z?=
 =?us-ascii?Q?bQv2/8/Yk8pFm2Xch6Gu0SiESYf+c7YkuyysdfKzDts4byEp89NlPgq/o6c4?=
 =?us-ascii?Q?TofmZ1srjXQ0RiqLlO8oKAOgyi3uj8GDcU0VBHjBJzx9yDB3bNg+5r/UzJ2M?=
 =?us-ascii?Q?eTYssXaRKEMjDwkzjBN79GSOdCusTGOi2BxSofnlq4hI4RWEEb+zO+4OOyt/?=
 =?us-ascii?Q?EdIOsl9ANV22f/l91YYHMZ7wbQ5dS9iVfUFr6fA4LM8h79bo824pQTzdUsvH?=
 =?us-ascii?Q?VQ5ZG/COvNXHb522OBTmca5VKxK/1o6E3yCvIzKFaCXfiBxFqeN+xGaO6K6R?=
 =?us-ascii?Q?oF6QgBQ8UicpS4yRR94dvQAy1YIoxC0B4XuSIh5yvi9kqRh6TvQszzIMeZKk?=
 =?us-ascii?Q?E0FNICVYHyqpraCZqwsdHsWak5C4QJNIFFtLjzooENHy0M9fEX/TDQyX73sl?=
 =?us-ascii?Q?jPgqB4uRuxKang0CQgzP3CP/eVZk0yD4+tAfISr0xUJa4/dI8kIinqpyUekY?=
 =?us-ascii?Q?F4tEvyyFzVo90N2at0tcznNlGwiv4VpjquIeX2hSa5UGpqpeIkHlWxFyRxGP?=
 =?us-ascii?Q?LByZ9Njtt1E096nMDNNQ6iVJsdSBDwSvqwSQCrF4iav/ye+eA0CbakSofik+?=
 =?us-ascii?Q?XaOR2bcsJOayGWoTfsBDTDr1Y0rN1Jvols49eY4G+V8RcvodEI+NzlQqP3aT?=
 =?us-ascii?Q?UIBQ/HaAX9yalGFllC5ze7kyYAaG8AEr+vXRuFkcCeEQ0kMh2Lc7RK2SiB6k?=
 =?us-ascii?Q?MAktmPJwM1FLqMb13ltDUp46p0ya9t31zs+xts2RJ8a6AfN7I3KX+85DvcjK?=
 =?us-ascii?Q?R8yqIGu4kubuYy3vbnczUM/Ps7n74I/T9S1bcYPjnuNq6vtHncki/xw7A9Gx?=
 =?us-ascii?Q?Guq62V0NsmWjOYW5eVzUACNzafguNc5kV4jut2foVzl3a0D5OwXSjG+RL1lm?=
 =?us-ascii?Q?ABlzciCXW4smiaROfeDwGc2qLM6ZFBZGoq6sWqfrBE/FuNgDTmxFn8+vFayC?=
 =?us-ascii?Q?zXAoFsOtHD7pnz7kkn29B/bnZqDd66atXWven7hf0j/2sOVbrBsR2s7zi4h+?=
 =?us-ascii?Q?hPrkqW3OnHgpSd0zWbDEH3V3ZTZH9JF8djzDDfAGMqMzlrvPSXkOX0kBEDIr?=
 =?us-ascii?Q?5lJ21wfEmmEJS4HDm8CgcinTL/OBDgtxxHNVft6z86lchAcejI1o2mEd2350?=
 =?us-ascii?Q?vkRgFYvpjInDQPJ588COXD+IsH0CKrqCJSRonUIOTrqOa5Uhlta1H7u+72DJ?=
 =?us-ascii?Q?vMqxAfAZyTT9KZT76MN6seZ7em56n0msTVLDxbwE60Z9W4pbEk/SFM1VMLOq?=
 =?us-ascii?Q?GeWYl8ZSDQLP/UZYjBYueMdLI+FUeLFjUvmtjqAYUuDy0JFGVOBKjv8SkfTq?=
 =?us-ascii?Q?H8EYOyBYESfQGJNRzYgWBgsnOMVMeF5wk6SzYI6Zeng3y5LgD6gAb5uPv62v?=
 =?us-ascii?Q?9BguLlaU5d+JJQsYQYwn9Xz39ryl1xtgvSw8J9PKvVhavxSmOmpnhb9DcPB5?=
 =?us-ascii?Q?6ormvbHqBnP66910RWQs5VLqK65QSFzNrI7JYjW1g1UzNbD2Wtd0/4bLBo8c?=
 =?us-ascii?Q?zPVio+4OvYNdxz7G1CRPKzTBjfVMYzxMFjrnhf754Qzpzsb0uHp3oT+NgFY1?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q7SQUEqEWcD6LWpUGo+jFgLvcz9iIulgXytGL2uhldfBY4/CuBtI1gxJMB+PiFg4QZWXOHYM3Ohk2D54eb5DwC1J4M6Zkr+Fa6yU4y6cmLPcemZAvAuVCKrz0YXxIhGk1pRBJEoiPKq8B1ibV8eAip8seDZI4jc0edFGIHMRoRpcReCxUhfTRjiZu88FI2G8wweTj0nwqsD6FWE6F0iDAu5Rp7Ox0v3dD2RlHCbyZEkqRJhlqZGXntcbb77z1XDOyCGrE3VxPKUlmtfFbGTZJpL7ca91zRBOpzAwino3tEq0kFqS7YsaHqE3JEHZYTnQUq39ql0ILCdGgSdgjjCT3EpLEmeJF+Da5BRxtVb9bEme04QY6FxCZQa1Pm8K+zqulZQMsZQtRponYz7HXL2c0VBWolL3ECcGrlKKNWcZBTVEOovhxbISiAKAP71zYYvTurUuWQfLn6dPe7F1arjm/u4HKdDAQj6dxNkRhFbnHizKV1wVljI01qAXqFY80S73vN7M2uSEFirW11UYRYSvmxf+qoPfVEakvMrjf3RthwKOswdmq5lXbobkzSMsEUa0aKfZ40IR+6q+Kt7iPGIAnvYMRUvVjdU2BTRHZpH811w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce678933-18cf-4ecf-8689-08dcfe82a30b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:47:01.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6pFyFPr7VAFrypSSnr63GafVIUe0eT9XX9YxwzXFTlER750rSZaZIeJreKq+8Xb+Dq+a/oM/Rv9CF7ErCyH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_10,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411060131
X-Proofpoint-GUID: UelTcYh6Ipxsgg0OD89cOtH9KQ3SLh-i
X-Proofpoint-ORIG-GUID: UelTcYh6Ipxsgg0OD89cOtH9KQ3SLh-i

So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
this requires an explicit mount, and a great many installations have not
done this and perhaps never will.  So if the debugfs is mounted on
/sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
as it used to, as another tracefs mount. And of course there's nothing
special about the "canonical location": it's up to the admin, who might
choose to remount the thing anywhere at all.

To make this even more fun, it's quite possible to end up with the tracefs
on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
(I got that during testing with no effort at all).

All this means that the existing DTrace hardwiring for tracefs/eventsfs
locations isn't good enough. Instead, hunt for a suitable tracefs mount with
getmntent(), and add a function to return an arbitrary path under that
directory (mimicking the things we used to do with EVENTSFS defines and the
like).  Return a pointer to static (per-dtrace_hdl) storage so that we don't
need to clog up all the callers with dynamic allocation: only one path is
ever needed at any one time anyway.

Tested with both in-practice-observed locations of debugfs.

Bug: https://github.com/oracle/dtrace-utils/issues/111
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/tracefs.h                             | 14 -----
 libdtrace/dt_error.c                          |  3 +-
 libdtrace/dt_impl.h                           |  4 ++
 libdtrace/dt_open.c                           |  2 +
 libdtrace/dt_prov_dtrace.c                    | 31 ++++++-----
 libdtrace/dt_prov_fbt.c                       | 40 ++++++++------
 libdtrace/dt_prov_rawtp.c                     | 10 ++--
 libdtrace/dt_prov_sdt.c                       | 23 +++++---
 libdtrace/dt_prov_syscall.c                   | 18 ++++---
 libdtrace/dt_prov_uprobe.c                    | 52 +++++++++++--------
 libdtrace/dt_provider.h                       |  1 -
 libdtrace/dt_subr.c                           | 52 +++++++++++++++++++
 test/unittest/funcs/tst.rw_.x                 |  7 ++-
 test/unittest/providers/tst.dtrace_cleanup.sh |  9 +++-
 test/utils/clean_probes.sh                    |  6 ++-
 15 files changed, 187 insertions(+), 85 deletions(-)
 delete mode 100644 include/tracefs.h

diff --git a/include/tracefs.h b/include/tracefs.h
deleted file mode 100644
index d671f51adefc..000000000000
--- a/include/tracefs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * Oracle Linux DTrace; simple uprobe helper functions
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#ifndef	_TRACEFS_H
-#define	_TRACEFS_H
-
-#define TRACEFS		"/sys/kernel/debug/tracing/"
-#define EVENTSFS	TRACEFS "events/"
-
-#endif /* _TRACEFS_H */
diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 213f0d9e1385..f6b41bf72b9f 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -98,7 +98,8 @@ static const struct {
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
 	{ EDT_PCAP, "Missing or corrupt pcap() record" },
-	{ EDT_PRINT, "Missing or corrupt print() record" }
+	{ EDT_PRINT, "Missing or corrupt print() record" },
+	{ EDT_TRACEFS_MNT, "Cannot find tracefs mount point" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec53c06..9d246cef2e7f 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -354,6 +354,8 @@ struct dtrace_hdl {
 	char *dt_module_path;	/* pathname of kernel module root */
 	dt_version_t dt_kernver;/* kernel version, used in the libpath */
 	char *dt_dofstash_path;	/* Path to the DOF stash.  */
+	char *dt_tracefs_path;	/* Path to tracefs.  */
+	char *dt_tracefs_file;	/* See tracefs_file().  */
 	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
 	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
 	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
@@ -643,6 +645,7 @@ enum {
 	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
 	EDT_PCAP,		/* missing or corrupt pcap() record */
 	EDT_PRINT,		/* missing or corrupt print() record */
+	EDT_TRACEFS_MNT,	/* cannot find tracefs mount point */
 };
 
 /*
@@ -713,6 +716,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
 
 extern int dt_gmatch(const char *, const char *);
 extern char *dt_basename(char *);
+extern const char *tracefs_file(dtrace_hdl_t *, const char *);
 
 extern ulong_t dt_popc(ulong_t);
 extern ulong_t dt_popcb(const ulong_t *, ulong_t);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index e1972aa821e7..e74b11244a35 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1317,6 +1317,8 @@ dtrace_close(dtrace_hdl_t *dtp)
 	free(dtp->dt_cpp_argv);
 	free(dtp->dt_cpp_path);
 	free(dtp->dt_ld_path);
+	free(dtp->dt_tracefs_path);
+	free(dtp->dt_tracefs_file);
 	free(dtp->dt_sysslice);
 	free(dtp->dt_dofstash_path);
 
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2467f..221a46bd50b8 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -23,8 +23,6 @@ static const char		funname[] = "";
 
 #define PROBE_FUNC_SUFFIX	"_probe"
 
-#define UPROBE_EVENTS		TRACEFS "uprobe_events"
-
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -229,11 +227,12 @@ out:
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*spec;
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		char		*spec;
+		const char	*uprobe_events;
+		char		*fn;
+		FILE		*f;
+		size_t		len;
+		int		fd = -1, rc = -1;
 
 		/* get a uprobe specification for this probe */
 		spec = uprobe_spec(getpid(), prp->desc->prb);
@@ -241,7 +240,9 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* add a uprobe */
-		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+		if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
+			fd = open(uprobe_events, O_WRONLY | O_APPEND);
+
 		if (fd != -1) {
 			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
 				     GROUP_DATA, prp->desc->prb, spec);
@@ -252,14 +253,18 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
+
+		if ((uprobe_events = tracefs_file(dtp, "events/")) == NULL)
+			return -ENOENT;
+
 		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
-			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
+			       uprobe_events, GROUP_DATA, prp->desc->prb) + 1;
 		fn = dt_alloc(dtp, len);
 		if (fn == NULL)
 			return -ENOENT;
 
 		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
-			 EVENTSFS, GROUP_DATA, prp->desc->prb);
+			 uprobe_events, GROUP_DATA, prp->desc->prb);
 		f = fopen(fn, "r");
 		dt_free(dtp, fn);
 		if (f == NULL)
@@ -289,14 +294,16 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
  */
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
-	int		fd;
+	int		fd = -1;
+	const char	*uprobe_events;
 
 	if (!dt_tp_probe_has_info(prp))
 		return;
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
+		fd = open(uprobe_events, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddffc73..7d81b0f3e87d 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -7,7 +7,7 @@
  * The Function Boundary Tracing (FBT) provider for DTrace.
  *
  * FBT probes are exposed by the kernel as kprobes.  They are listed in the
- * TRACEFS/available_filter_functions file.  Some kprobes are associated with
+ * tracefs available_filter_functions file.  Some kprobes are associated with
  * a specific kernel module, while most are in the core kernel.
  *
  * Mapping from event name to DTrace probe name:
@@ -43,8 +43,8 @@
 static const char		prvname[] = "fbt";
 static const char		modname[] = "vmlinux";
 
-#define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
+#define KPROBE_EVENTS		"kprobe_events"
+#define PROBE_LIST		"available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -58,14 +58,15 @@ static const dtrace_pattr_t	pattr = {
 };
 
 /*
- * Scan the PROBE_LIST file and add entry and return probes for every function
+ * Scan the available_filter_functions file and add entry and return probes for every function
  * that is listed.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
 	dt_provimpl_t		*impl;
-	FILE			*f;
+	const char		*probe_list;
+	FILE			*f = NULL;
 	char			*buf = NULL;
 	char			*p;
 	const char		*mod = modname;
@@ -79,7 +80,8 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
+		f = fopen(probe_list, "r");
 	if (f == NULL)
 		return 0;
 
@@ -363,16 +365,18 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		const char	*kprobe_events;
+		char		*fn;
+		FILE		*f;
+		size_t		len;
+		int		fd = -1, rc = -1;
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
 		 * create a tracepoint event.
 		 */
-		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		if ((kprobe_events = tracefs_file(dtp, KPROBE_EVENTS)) != NULL)
+			fd = open(kprobe_events, O_WRONLY | O_APPEND);
 		if (fd == -1)
 			return -ENOENT;
 
@@ -384,13 +388,17 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* create format file name */
+
+		if ((kprobe_events = tracefs_file(dtp, "events/")) == NULL)
+			return -ENOENT;
+
 		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
+			       kprobe_events, FBT_GROUP_DATA, prp->desc->fun) + 1;
 		fn = dt_alloc(dtp, len);
 		if (fn == NULL)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", kprobe_events,
 			 FBT_GROUP_DATA, prp->desc->fun);
 
 		/* open format file */
@@ -424,14 +432,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
  */
 static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
-	int		fd;
+	const char	*kprobe_events;
+	int		fd = -1;
 
 	if (!dt_tp_probe_has_info(prp))
 		return;
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	if ((kprobe_events = tracefs_file(dtp, KPROBE_EVENTS)) != NULL)
+		fd = open(kprobe_events, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9cde90..6e495afef092 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -8,7 +8,7 @@
  *
  * Raw tracepoints are exposed by the kernel tracing system to allow access to
  * untranslated arguments to their associated tracepoint events.  Each
- * tracepoint event listed in the TRACEFS/available_events file can be traced
+ * tracepoint event listed in the tracefs available_events file can be traced
  * as a raw tracepoint using the BPF program type BPF_PROG_TYPE_RAW_TRACEPOINT.
  *
  * Mapping from event name to DTrace probe name:
@@ -38,7 +38,7 @@
 static const char		prvname[] = "rawtp";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -64,7 +64,8 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
-	FILE		*f;
+	const char	*probe_list;
+	FILE		*f = NULL;
 	char		*buf = NULL;
 	char		*p;
 	size_t		n;
@@ -73,7 +74,8 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
+		f = fopen(probe_list, "r");
 	if (f == NULL)
 		return 0;
 
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458ca4c..717fd62f0c3a 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -7,7 +7,7 @@
  * The Statically Defined Tracepoint (SDT) provider for DTrace.
  *
  * SDT probes are exposed by the kernel as tracepoint events.  They are listed
- * in the TRACEFS/available_events file.
+ * in the tracefs available_events file.
  *
  * Mapping from event name to DTrace probe name:
  *
@@ -36,7 +36,7 @@
 static const char		prvname[] = "sdt";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -62,7 +62,8 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
-	FILE		*f;
+	const char	*probe_list;
+	FILE		*f = NULL;
 	char		*buf = NULL;
 	char		*p;
 	size_t		n;
@@ -71,7 +72,8 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
+		f = fopen(probe_list, "r");
 	if (f == NULL)
 		return 0;
 
@@ -192,12 +194,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 			      int *argcp, dt_argdesc_t **argvp)
 {
+	const char			*eventsfs;
 	FILE				*f;
 	char				*fn;
 	int				rc;
 	const dtrace_probedesc_t	*pdp = prp->desc;
 
-	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
+	if ((eventsfs = tracefs_file(dtp, "events")) == NULL)
+		return -ENOENT;
+
+	if (asprintf(&fn, "%s/%s/%s/format", eventsfs, pdp->mod, pdp->prb) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
 	f = fopen(fn, "r");
@@ -215,6 +221,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
 #ifdef HAVE_LIBCTF
+	const char		*eventsfs;
 	int			rc, i;
 	char			*str;
 	ctf_dict_t		*ctfp;
@@ -227,7 +234,11 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	uint32_t		id;
 
 	/* Retrieve the event id. */
-	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
+
+	if ((eventsfs = tracefs_file(dtp, "events")) == NULL)
+		return -1;			/* errno is set for us. */
+
+	if (asprintf(&str, "%s/%s/%s/id", eventsfs, prp->desc->mod, prp->desc->prb) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
 	f = fopen(str, "r");
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f538e..869e8e130c42 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -38,7 +38,7 @@
 static const char		prvname[] = "syscall";
 static const char		modname[] = "vmlinux";
 
-#define SYSCALLSFS		EVENTSFS "syscalls/"
+#define SYSCALLSFS		"events/syscalls/"
 
 /*
  * We need to skip over an extra field: __syscall_nr.
@@ -61,7 +61,7 @@ struct syscall_data {
 
 #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
 
-#define PROBE_LIST	TRACEFS "available_events"
+#define PROBE_LIST	"available_events"
 
 #define PROV_PREFIX	"syscalls:"
 #define ENTRY_PREFIX	"sys_enter_"
@@ -71,7 +71,8 @@ struct syscall_data {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
-	FILE		*f;
+	const char	*probe_list;
+	FILE		*f = NULL;
 	char		*buf = NULL;
 	size_t		n;
 
@@ -79,7 +80,8 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
+		f = fopen(probe_list, "r");
 	if (f == NULL)
 		return 0;
 
@@ -196,14 +198,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
 	FILE		*f;
-	char		fn[256];
+	const char	*syscallsfs;
+	char		fn[PATH_MAX];
 	int		rc;
 
 	/*
 	 * We know that the probe name is either "entry" or "return", so we can
 	 * just check the first character.
 	 */
-	strcpy(fn, SYSCALLSFS);
+	if ((syscallsfs = tracefs_file(dtp, SYSCALLSFS)) == NULL)
+		return -ENOENT;
+
+	strcpy(fn, syscallsfs);
 	if (prp->desc->prb[0] == 'e')
 		strcat(fn, "sys_enter_");
 	else
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 205014617586..f8752eaa3843 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1116,13 +1116,14 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
  * uprobe may be a uretprobe.  Return the probe's name as
  * a new dynamically-allocated string, or NULL on error.
  */
-static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
-			   uint64_t addr, int flags)
+static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
+			   const char *mapping_fn, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
-	char	*spec;
+	const char	*uprobe_events;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
+	char		*spec;
 
 	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
 		return NULL;
@@ -1132,7 +1133,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
 		goto out;
 
 	/* Add the uprobe. */
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
+	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
+		fd = open(uprobe_events, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		goto out;
 
@@ -1153,8 +1155,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
 	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
-	FILE		*f;
-	char		*fn;
+	const char	*eventsfs;
+	FILE		*f = NULL;
 	char		*prb = NULL;
 	int		rc = -1;
 
@@ -1163,7 +1165,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 
 	assert(upp->fn != NULL);
 
-	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
+	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
 			    upp->flags);
 
 	/*
@@ -1177,12 +1179,16 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 				  upp->flags);
 
 	/* open format file */
-	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
-	free(prb);
-	if (rc < 0)
-		return -ENOENT;
-	f = fopen(fn, "r");
-	free(fn);
+	if ((eventsfs = tracefs_file(dtp, "events")) != NULL) {
+		char	*fn;
+
+		rc = asprintf(&fn, "%s/%s/format", eventsfs, prb);
+		free(prb);
+		if (rc < 0)
+			return -ENOENT;
+		f = fopen(fn, "r");
+		free(fn);
+	}
 	if (f == NULL)
 		return -ENOENT;
 
@@ -1251,17 +1257,19 @@ done:
  * Destroy a uprobe for a given device and address.
  */
 static int
-uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
+uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
+	const char	*uprobe_events;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
 
 	name = uprobe_name(dev, ino, addr, flags);
 	if (!name)
 		goto out;
 
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
+	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
+		fd = open(uprobe_events, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		goto out;
 
@@ -1297,7 +1305,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 
 	dt_tp_detach(dtp, tpp);
 
-	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
+	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
 }
 
 /*
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 8f143dceaed7..4598a380b950 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -12,7 +12,6 @@
 #include <dt_impl.h>
 #include <dt_ident.h>
 #include <dt_list.h>
-#include <tracefs.h>
 
 #ifdef	__cplusplus
 extern "C" {
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d5dca164861e..6ec03b503a66 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -20,6 +20,7 @@
 #include <assert.h>
 #include <limits.h>
 #include <sys/ioctl.h>
+#include <mntent.h>
 #include <port.h>
 
 #include <dt_impl.h>
@@ -998,3 +999,54 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
 
 	return hval;
 }
+
+/*
+ * Find the tracefs and store it away in dtp.
+ */
+static int
+find_tracefs_path(dtrace_hdl_t *dtp)
+{
+	FILE *mounts;
+	struct mntent *mnt;
+
+	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
+		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
+		return dt_set_errno(dtp, EDT_TRACEFS_MNT);
+	}
+
+	while ((mnt = getmntent(mounts)) != NULL) {
+		if (strcmp(mnt->mnt_type, "tracefs") == 0) {
+			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
+			break;
+		}
+	}
+	endmntent(mounts);
+
+	if (!dtp->dt_tracefs_path)
+		return dt_set_errno(dtp, EDT_TRACEFS_MNT);
+
+	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
+
+	return 0;
+}
+
+/*
+ * Return the path to a tracefs file.  (Statically allocated,
+ * discarded on reuse.)
+ */
+const char *
+tracefs_file(dtrace_hdl_t *dtp, const char *fn)
+{
+	free(dtp->dt_tracefs_file);
+
+	if (!dtp->dt_tracefs_path)
+		if (find_tracefs_path(dtp) < 0)
+			return NULL;		/* errno is set for us. */
+
+	if (asprintf(&dtp->dt_tracefs_file, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
+		dtp->dt_tracefs_file = NULL;
+		dt_set_errno(dtp, EDT_NOMEM);
+		return NULL;
+	}
+	return dtp->dt_tracefs_file;
+}
diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
index 29c581116154..7e178778d900 100755
--- a/test/unittest/funcs/tst.rw_.x
+++ b/test/unittest/funcs/tst.rw_.x
@@ -1,6 +1,11 @@
 #!/bin/sh
 
-FUNCS=/sys/kernel/debug/tracing/available_filter_functions
+TRACEFS=/sys/kernel/tracing
+if [[ ! -e $TRACEFS/available_filter_functions ]]; then
+	TRACEFS=/sys/kernel/debug/tracing
+fi
+
+FUNCS=${TRACEFS}/available_filter_functions
 
 if ! grep -qw  _raw_read_lock $FUNCS; then
         echo no _raw_read_lock FBT probe due to kernel config
diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
index 4ac59ccb4315..08b47a057783 100755
--- a/test/unittest/providers/tst.dtrace_cleanup.sh
+++ b/test/unittest/providers/tst.dtrace_cleanup.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -14,7 +14,12 @@
 ##
 
 dtrace=$1
-UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
+TRACEFS=/sys/kernel/tracing
+if [[ ! -e $TRACEFS/uprobe_events ]]; then
+	TRACEFS=/sys/kernel/debug/tracing
+fi
+
+UPROBE_EVENTS=${TRACEFS}/uprobe_events
 
 out=/tmp/output.$$
 $dtrace $dt_flags -n BEGIN,END &>> $out &
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index 8292b3096424..16e98b29b275 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -1,6 +1,10 @@
 #!/usr/bin/bash
 
-TRACEFS=/sys/kernel/debug/tracing
+TRACEFS=/sys/kernel/tracing
+if [[ ! -e $TRACEFS/available_events ]]; then
+	TRACEFS=/sys/kernel/debug/tracing
+fi
+
 EVENTS=${TRACEFS}/available_events
 KPROBES=${TRACEFS}/kprobe_events
 UPROBES=${TRACEFS}/uprobe_events
-- 
2.46.0.278.g36e3a12567

