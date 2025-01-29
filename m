Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAF189916
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738134029; cv=fail; b=tjtEBDKnkR7SRzO1ulwn51oSnFmgI+TYSRx3r0xnhPcH3/2Rdzeu9JRbKHVQaFzp+Y0z3migquQBsCRQrNmY1pZhDwesBZFVHiLw09ZYuv3JDTpbQkNrsrj48sVVYy7pDUBMQMYfXFIdiV2Br0i3rntnb7NHcPhT2mcSPTgiWD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738134029; c=relaxed/simple;
	bh=zNxPUqmKuxaoeNJ0FSJIf6+4mraZhh2n4GOr9UydiH0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=M0Ng0x/lPmtmQYxCicUm29SYtVEfH+fx4AFeC8jpwFHzuRCpZJn504b7wVKmnU9ybaCAx8byZHAL2HCoXe1SD9q6z80F5GN6J5OtVaZVMCK582G2Q+SELtvfsapyxBHTC74fAAKODqLtQaXUNX/CIDoc8AM4oL8fAwItMr8pUuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QzZ5BY64; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ry7RdFvo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QzZ5BY64";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ry7RdFvo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T6bgxb015360
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 07:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=M7JAqLmslZ3NJZvP8aaNheqBD+DE1a+UzCQKmexMQMg=; b=
	QzZ5BY64/4HDDhv3xMSaHj69NQ/TlUSPshepPAS+oGPn00sx0orRCK68f9uj587q
	jm7IEqYEwpqI5EpUGbG9OGvdoV4RmUNIH35U10xLT3+IyO0khrsZHc8sW1lYDVMr
	IDobF6zepXpCWltSAqocKH0DD2LC7X/8Z4FOMM3LOZxL7jFXb2jXwd9uOPH5Atk5
	XBz8zVE5kkG75F0PK9EQFvXFVQVSEF02q6Bss7dlEfgSuQuNel7JvdKs2PHCehTx
	EXIHKi0LLYwtry301fwcLwWMnOz9F2WV6nZnEnr3Et+/1sGq99rRYYhlIDjL4NZH
	P6Wm3ZqxHokQqsBLojQOcg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ff7c81ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 07:00:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50T6YaE5005339
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 07:00:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9eaag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 07:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZjbSg2qk0YGWPzp1ps3D8OhkP/+nHY/xbCaCkmIJEJrro9O3d15kZ7joTaHH992Flo5Qibas/VrFFGf7Epbt8VRr8DV/cAm0h4PDp/VetkV1KlLt97qae1WHA9lYW3T0+ybjTjfJM9XICSjsAUFk7nOYelfleDmeG+0ToUOziUnOq3YmHlAVo1tXLG7J/naYwkBsxysuRvUXL7VeoTtHz7NffJa89M7GUwEgapQr+WJdfMC8wY2s4EPiwLi4DQP4QPdgSDfLH5u2BiEkdio61lDE/DTkR/9U2x2JSS/Ksjm5IkJvcwIVLKIbqk2lTKiyGXIqUbsk8FhM06VvSzVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7JAqLmslZ3NJZvP8aaNheqBD+DE1a+UzCQKmexMQMg=;
 b=o9Jz73jyKniwRhSgR1iBJIlZ9P6aKHtY4mEh0pqvWXK8wjr7FGr86rCIg9xUh4lk+Z0fEuySkHnpvLzx1xK/UTHINm2feEmA2uxtDFy/j9+DLkDuesbGFY82TatAKtwys2ZhU9M0v2Kyw0JsR1bLIYfbB1VO0/aY3Erb4zbzHWPVubItg7+nusC2VPpzjMDa7l9JwY3cPEMnRZ4SUfsAyfyIcY/4wEByMMc3adf81RiQ1OYkzUidGaG1m0bjjyonu0qdHb+APPhw9nm5dixCKo7CWwiraNjMDmExQZFHiLdf7F/5SWp6QMmji6d80OaxPJzX2NKmWjSZlavk8TIblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7JAqLmslZ3NJZvP8aaNheqBD+DE1a+UzCQKmexMQMg=;
 b=ry7RdFvoMSgt9ci7eHr4WTb42z99ZMog5cgWNv6E32/SLCO6KD8lJ0Nl9rJCKOU1UKhvlVhpidXG/KywV+tcQ73FYyF2owVGjq8Zua/35YNopxeEiel0sXEX1Crcir+jzrYXS5ZYnFYTYLaByrJz56MSKDpMEoLLbHSDYkoI5Ug=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA1PR10MB5993.namprd10.prod.outlook.com (2603:10b6:208:3ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 07:00:22 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 07:00:21 +0000
Date: Wed, 29 Jan 2025 02:00:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/6] procfs: implement d_execargs() for pr_psargs translator
 support
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA1PR10MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: f20dc6dc-080f-4486-66b7-08dd40329917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Go/XcExJe1V+S92OTP6qHmWDH7Sk1loyYxNJp6Yc2oOrHU+4TnVlQBZk6kiA?=
 =?us-ascii?Q?HR5KaWAf7mdc+fNc67iZlAi1DxLL1rQo/e7NrytWkXNfBIWEP3vNCKtKVOZf?=
 =?us-ascii?Q?G/ITxF0G9dSip3qDHtc+NewNsA+p0PQNi6vkhkxRrxFgowJUd9S6PM9dUPKJ?=
 =?us-ascii?Q?Af8Tv1OgMD+iRD2EMFYXDLzlLH/puuVTt+dqQOy6sjQ4zxBskLvn7GH95r1K?=
 =?us-ascii?Q?eNsJvDRoYlMzWAPAXxQp4o6bDQayQWDhpwhdOwWcoz+8nyAcf9BjgI6yAbGQ?=
 =?us-ascii?Q?pURjbdwh3kFUQfuUoJqazV23rR+VJFV+CPMvFKnWepOYd1iFGlLA49zPFmiE?=
 =?us-ascii?Q?Ev0HGRX/2AhejDHs4j/DSSTwYRPX9+3gvfgLiL9p5NjEx1UsJEIyDI0Q4a6I?=
 =?us-ascii?Q?X2RJGJAKeO3K4LPzektpv7gzgJYTRvxMTn8S0vuTYBcdy51w/dK0OWCKAP18?=
 =?us-ascii?Q?X8GVYMs4kb0T9Iz6/fbdrRZlCDRB8JBCw7qNZyZDIJwwQGGntv1mcqTw5at5?=
 =?us-ascii?Q?LIWmB1sghEziJ8Af8Y8Xch+GuO2UDkugBnKPuA4Cenr5GIatdslZK1SobmQO?=
 =?us-ascii?Q?C/chR4HW5R4LjM19aF8FhJPhC9Tio15K2xyjbn5oAV7BtcNALNJfJy1071Qq?=
 =?us-ascii?Q?AfuxzfFRmFN2gu7F8iYFYYpzmMAtjaJvpq6nHYWv/ITHN2gTAb3jbOvk0D9M?=
 =?us-ascii?Q?gw6xk80pKbBwHuuRGwBO2KlaiV86KBy2CSv2SwxfqT3WL9/Q5MoZQ1s3Apzd?=
 =?us-ascii?Q?kxDmml56Iw8f874j84o9pSCi/KV0Fr+AgdDs3m2h97UdDXjds9zS1Z+uxl8w?=
 =?us-ascii?Q?s498+UDEr6E61e9fhbucAbeI6iEPDzn9n8ikWDSAr2e/iMsU4zM2pthrFTOG?=
 =?us-ascii?Q?SATAyZT9BqEQi6bJlACZSgJihYrcmtsWieua/AjY7Xz3Xa6ZtbT6sbThaxvq?=
 =?us-ascii?Q?uO5MhHroA+7xztsV3hF+b/dJct+37CllgXgr2BosaBZCjVUCiWC1NNlnL6ep?=
 =?us-ascii?Q?jacEOeQv8c5ay8NPoMwqozDOGVMGbiJDz6vrqHGmzPuawNGhp5xYvW0HZQ7Q?=
 =?us-ascii?Q?NgzhcZgRFAREA+1MckvfovxWcGjhdXKcTYG69KyI03KOyMq3fsU8C7q9hG1b?=
 =?us-ascii?Q?QhB/gigLW9nZtmTPq0+v5YNeHgAYg3Wy3Rr0OOTJ8SfVPSyWQ0EqKyfvxjNi?=
 =?us-ascii?Q?iKBmds8VhIDzSVsr+Xqj7IgZmM8QUKXVei2Heue4hpqpxJF0H8ddm0ytOddY?=
 =?us-ascii?Q?JjSVeeXQSnoFY6YlGdxuZQOhnAAe//MM0IvB/FZIo4kaRpGNfmtsa9poxcfK?=
 =?us-ascii?Q?cNQi6SdIiE1ukAzZydIikDixV55U7A4B0eORDaBCslS8Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RbWFmejAQiWNkm1HE7NiQWpQV/i73iryp/4Tc4KqL8XyyW3NB0CN2/Uerhpe?=
 =?us-ascii?Q?M+r3yZbhC1p6sAScAhyySdqtYnnRFNmQxRIS5xmUrAzi8hqXMvbGv/p+SD5b?=
 =?us-ascii?Q?ObYWDkP80ZLmk6r4aaoeIpnmiw2qs4H6xu1TYtoRJZYQTUW4oZyHajrYWEXK?=
 =?us-ascii?Q?T9WysFu9nBU1f21BFD9tIUWUNCHrYRdjEQWkILvjpPO3b0wVhOF+E7TakmiJ?=
 =?us-ascii?Q?BcFbx2Oz1qXQyQVSXCAhL4x0r7SzL6s9OCegUKc2Ir+x1VNExuMqVWFExURr?=
 =?us-ascii?Q?dSp92U3n1jBJxnP/b7jSpYBWXRxKvUYRzEIatqT9rFpov2xw9ESnMePvCoZ0?=
 =?us-ascii?Q?SIjIuFCVCpQsu6MN2txxAZipPGx1aWjZcC1RZXyhbjQ4//ux+8H4a6eM6pV9?=
 =?us-ascii?Q?SF4x05GBBgvAjX0HWDCObADxINjByizQ7PO5nGhKdef6oai8CLY3r7qU9Z7k?=
 =?us-ascii?Q?1bBbqhLOf4fRU6XCsF7vwqvLeaSb6kFYdyGoBQlw8xDt1HJDzECluz4vT7gw?=
 =?us-ascii?Q?jO4YKXSuwbUaGD9/v3MaADUixqGhV33jK5fwC+2FYSgiMLFxqmFefwDwkPro?=
 =?us-ascii?Q?TCjUnrMfYf3QVTNcRMhHJnZSjjkI4j0XbsC+aTuDK8VLX1aonwlvDPDS+DML?=
 =?us-ascii?Q?CAXOcZsEB/s4c/e32wcuXZDuYg7aODCltWWp1YXmRN1Jq5fRqw77b6pAXID6?=
 =?us-ascii?Q?G9Mp+2hq/I/RmCJJyQBXdY9ISVECSFKl+kOj1BgteOIOBSH9KJ26ONQzpu14?=
 =?us-ascii?Q?BIngLktcUgr5FAoq1rLT/bAkdHtAizD9Xbh5cbzruY/M86gWFxpafRKWdRcg?=
 =?us-ascii?Q?iR8YIFmuokhrAO7OYSseiI84r+/pJsMbVa+Y2Ahsy6poVZxf6y755LSYwSs6?=
 =?us-ascii?Q?SbiWDnbnbxwdrZn2YmNnO5dWEyZHEQT2bzUETH8JfsiuT2NfUHkGJHMqWfGQ?=
 =?us-ascii?Q?gAAcIeL/1fFy0XUmTpBqSk9iF9Ht6GmwGkL9MHSo+05gQg9H+wuAbpJHcLt/?=
 =?us-ascii?Q?HAdAXcbDMO+VzL9UAHWccuVtxu21o8IBYFT1UqklRdxVt93cMnJIaP0ndBiv?=
 =?us-ascii?Q?2iLLUVVgDnQOlE0NUrnoT+TFOu0ilE18Ib/DJkYTWGKAlo35swm9uMR0ZV1Q?=
 =?us-ascii?Q?Y4fLR+JZLdVVz2C+qqrW90e6/SY9IIewX9SNrrErPbh9xlCUuOLbLA2WXsFI?=
 =?us-ascii?Q?yPqy/S7cECIpNuwCdsEWjLvaLEGxcUVG1Pg3vPJfWWBHDO6R8b15ZLl+145A?=
 =?us-ascii?Q?+3wja8cJjjYQVeN/0uC4QaD4Ee0cfEPYr+F4JE1v92cv+wcuzdCieiHrQ+rE?=
 =?us-ascii?Q?j3FHq0Ze0nF09ixZbEFmrJn8Rppw1T9cEs8jekmVSKQJrv5MKeBFayOpJ3GU?=
 =?us-ascii?Q?H1lECD7DJxNNRqVYAHw07KFLKgh2moV1vCsjJgTUP+qhMRF16fIur3YjHRdx?=
 =?us-ascii?Q?c0qBZh6rehbuuWvmAoRJA4iLucZgDmKodITXRnDVlmZBlGoTuDjhlua9ibCr?=
 =?us-ascii?Q?3GkNtzAeY8eguZPCPw/cN4MY1oRlxoFtGu99NQ1QfSL4uCTC1vEJmfp31RRL?=
 =?us-ascii?Q?1cw7ysdO2OKWzNrHvHQRj1gt7sp1C6fdDJhlr8dq76qrC7cOl1BxzNzk02Sd?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DXLyNG5QlkcI8LvuEBgacZFq1fvG/kxjZ1IStzlZy6d3RirDAJlnWlPGaPmZ9L3zW6aCkwRYz3ei4FAadhCa5e78o6Rj1NsgM/2GPI34by/B4PHBBSAfWNg/fgfaoQPqk7eHUAPy6q+fc+c5CKnB42wcyiKubwfNXij6ICT2unHr1R2Xqayw5YmPAlZ7IBcF8eOf01uvkKGtPsQ+DeAyotshC9xpg9cwuYpJ4KTFwVtJ2nVttLZWhzyAjZUE+UqcFly43p7YGegEQwibZXGW51KtrO9Zw2qVVlLdAkJmEraz3WjNAwGgmukyfDlk/ninqxrT7aCtYvwKw1GbqlLfopFTwSOS+zUXeqLPTlwoiDEAMJAK9L6eQdgVOjM4N9K6XLR+g0QHQ++EqFoogcACPfTqTW6Wflb85smNRcu29SU6e5GdfID9JT+SyOWawD8/e1HNI+CcjnQMwgOSVy0AXlpQlDUy1E+v5Mrr7njns1pUulczQYNOglaNCCtG7asSGkYzfM+H7vPPsu7o7159lwOfyDD36IlGX8T1wOCn5zWMl2u35AU6okxv7EzK3tQ53K1uHPF1Q6B/NAjWVYlm8gD3+5XZoo89y/jlv+t4zqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20dc6dc-080f-4486-66b7-08dd40329917
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 07:00:21.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u0I2S6pUac6HHVQ6VQ8hFmRN3OoIgcPeqmABVe7USNL0tlMpSS6ZWfqSEtbMjC/cIr8NpoIvxPm163KRwEDHA/LoSIWyersT1O9QO1AtlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5993
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290056
X-Proofpoint-GUID: ffgAJtN9IIYNbjIERt53LvtVOd5wqV8f
X-Proofpoint-ORIG-GUID: ffgAJtN9IIYNbjIERt53LvtVOd5wqV8f

Implement d_execargs() to provide task argument string (pr_psargs)
for the psinfo translator.  It takes a task (struct task_struct) as
argument and returns a string.

psinfo->pr_psargs now simply calls d_execargs(T).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/Build                                     |  1 +
 bpf/d_execargs.S                              | 91 +++++++++++++++++++
 dlibs/aarch64/5.11/procfs.d                   |  4 +-
 dlibs/aarch64/5.12/procfs.d                   |  4 +-
 dlibs/aarch64/5.14/procfs.d                   |  4 +-
 dlibs/aarch64/5.16/procfs.d                   |  4 +-
 dlibs/aarch64/5.2/procfs.d                    |  4 +-
 dlibs/aarch64/5.6/procfs.d                    |  4 +-
 dlibs/aarch64/6.1/procfs.d                    |  4 +-
 dlibs/aarch64/6.10/procfs.d                   |  4 +-
 dlibs/x86_64/5.11/procfs.d                    |  4 +-
 dlibs/x86_64/5.12/procfs.d                    |  4 +-
 dlibs/x86_64/5.14/procfs.d                    |  4 +-
 dlibs/x86_64/5.16/procfs.d                    |  4 +-
 dlibs/x86_64/5.2/procfs.d                     |  4 +-
 dlibs/x86_64/5.6/procfs.d                     |  4 +-
 dlibs/x86_64/6.1/procfs.d                     |  4 +-
 dlibs/x86_64/6.10/procfs.d                    |  4 +-
 include/dtrace/dif_defines.h                  |  7 +-
 libdtrace/dt_bpf.h                            | 21 +++--
 libdtrace/dt_cc.c                             | 33 ++++++-
 libdtrace/dt_cg.c                             |  9 +-
 libdtrace/dt_dlibs.c                          |  3 +
 libdtrace/dt_open.c                           |  2 +
 libdtrace/procfs.d.in                         |  4 +-
 .../d_execargs/err.D_PROTO_ARG.scalar_arg.d   | 16 ++++
 .../d_execargs/err.D_PROTO_ARG.scalar_arg.r   |  4 +
 .../d_execargs/err.D_PROTO_ARG.string_arg.d   | 16 ++++
 .../d_execargs/err.D_PROTO_ARG.string_arg.r   |  4 +
 .../d_execargs/err.D_PROTO_ARG.wrong_ptr.d    | 16 ++++
 .../d_execargs/err.D_PROTO_ARG.wrong_ptr.r    |  4 +
 .../d_execargs/err.D_PROTO_LEN.missing_arg.d  | 16 ++++
 .../d_execargs/err.D_PROTO_LEN.missing_arg.r  |  2 +
 .../err.D_PROTO_LEN.too_many_args.d           | 16 ++++
 .../err.D_PROTO_LEN.too_many_args.r           |  2 +
 .../funcs/d_execargs/tst.d_execargs.d         | 31 +++++++
 .../funcs/d_execargs/tst.d_execargs.r         |  2 +
 test/unittest/proc/tst.pr_psargs.d            | 31 +++++++
 test/unittest/proc/tst.pr_psargs.r            |  9 ++
 39 files changed, 339 insertions(+), 65 deletions(-)
 create mode 100644 bpf/d_execargs.S
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
 create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
 create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.d
 create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.r
 create mode 100644 test/unittest/proc/tst.pr_psargs.d
 create mode 100644 test/unittest/proc/tst.pr_psargs.r

diff --git a/bpf/Build b/bpf/Build
index 3e43f4b6..9355326c 100644
--- a/bpf/Build
+++ b/bpf/Build
@@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
 	agg_lqbin.c agg_qbin.c \
 	basename.S \
 	cleanpath.S \
+	d_execargs.S \
 	dirname.S \
 	get_agg.c \
 	get_bvar.c \
diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
new file mode 100644
index 00000000..3a5b1270
--- /dev/null
+++ b/bpf/d_execargs.S
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Oracle and/or its affiliates.
+ */
+
+#include <bpf_asm_helpers.h>
+#include <dtrace/faults_defines.h>
+
+	.text
+	.align	4
+	.global	dt_d_execargs
+dt_d_execargs:
+	stxdw	[%fp+-8], %r1			/* save dctx to stack */
+	mov	%r9, %r3			/* %r9 = args */
+
+	mov	%r6, %r2			/* set %r6 in case of error */
+	jeq	%r6, 0, .Lerror
+
+	add	%r6, TASK_MM			/* ptr = &(T->mm) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
+	jeq	%r8, 0, .Lempty
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
+
+	mov	%r8, %r6
+	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
+	jslt	%r8, 2, .Lempty
+	mov	%r0, STRSZ
+	jslt	%r8, %r0, .Llen_ok
+	mov	%r8, %r0
+.Llen_ok:
+
+	/* read data from arg_start to arg_end */
+	mov	%r1, %r9
+	mov	%r2, %r8
+	mov	%r3, %r7
+	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
+	jne	%r0, 0, .Lerror
+
+	/* loop over args and replace '\0' with ' ' */
+	mov	%r1, %r8
+	sub	%r1, 2
+.Lloop:
+	mov	%r2, %r9
+	add	%r2, %r1
+	ldxb	%r0, [%r2+0]
+	jne	%r0, 0, .Lnot_nil
+	stb	[%r2+0], 32
+.Lnot_nil:
+	sub	%r1, 1
+	jsge	%r1, 0, .Lloop
+
+.Ldone:
+	mov	%r0, %r9
+	exit					/* return args */
+.Lerror:
+	ldxdw	%r1, [%fp+-8]
+	mov	%r2, PC
+	mov	%r3, DTRACEFLT_BADADDR
+	mov	%r4, %r6
+	call	dt_probe_error
+.Lempty:
+	mov	%r0, %r9
+	stb	[%r9+0], 0			/* args[0] = 0 */
+	exit					/* return args */
+	.size	dt_d_execargs, .-dt_d_execargs
diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index 584ac325..ef27bb70 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 683ff5a8..6b1b1b9c 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index d1cf90d3..28fada6d 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 35538862..08696cf7 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index c8c1d961..cd785723 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -207,10 +207,11 @@
 #define DIF_SUBR_INET_NTOP		41
 #define DIF_SUBR_INET_NTOA		42
 #define DIF_SUBR_INET_NTOA6		43
-#define DIF_SUBR_D_PATH			44
-#define DIF_SUBR_LINK_NTOP		45
+#define DIF_SUBR_LINK_NTOP		44
+#define DIF_SUBR_D_PATH			45
+#define DIF_SUBR_D_EXECARGS		46
 
-#define DIF_SUBR_MAX			45
+#define DIF_SUBR_MAX			46
 
 typedef uint32_t	dif_instr_t;
 
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 6518de66..85934d2d 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -47,15 +47,18 @@ extern "C" {
 #define DT_CONST_TASK_TGID		12
 #define DT_CONST_TASK_REAL_PARENT	13
 #define DT_CONST_TASK_COMM		14
-#define DT_CONST_MUTEX_OWNER		15
-#define DT_CONST_RWLOCK_CNTS		16
-#define DT_CONST_DCTX_RODATA		17
-#define DT_CONST_RODATA_OFF		18
-#define DT_CONST_RODATA_SIZE		19
-#define DT_CONST_ZERO_OFF		20
-#define DT_CONST_STACK_OFF		21
-#define DT_CONST_STACK_SKIP		22
-#define DT_CONST_NPROBES		23
+#define DT_CONST_TASK_MM		15
+#define DT_CONST_TASK_MM_ARG_START	16
+#define DT_CONST_TASK_MM_ARG_END	17
+#define DT_CONST_MUTEX_OWNER		18
+#define DT_CONST_RWLOCK_CNTS		19
+#define DT_CONST_DCTX_RODATA		20
+#define DT_CONST_RODATA_OFF		21
+#define DT_CONST_RODATA_SIZE		22
+#define DT_CONST_ZERO_OFF		23
+#define DT_CONST_STACK_OFF		24
+#define DT_CONST_STACK_SKIP		25
+#define DT_CONST_NPROBES		26
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 29cfbd84..1dc119ea 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_TASK_PID:
 			case DT_CONST_TASK_TGID:
 			case DT_CONST_TASK_REAL_PARENT:
-			case DT_CONST_TASK_COMM: {
+			case DT_CONST_TASK_COMM:
+			case DT_CONST_TASK_MM: {
 				ctf_file_t *cfp = dtp->dt_shared_ctf;
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
@@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				case DT_CONST_TASK_COMM:
 					rc = ctf_member_info(cfp, type, "comm", &ctm);
 					break;
+				case DT_CONST_TASK_MM:
+					rc = ctf_member_info(cfp, type, "mm", &ctm);
+					break;
+				}
+				if (rc == CTF_ERR)
+					goto err_ctf;
+				nrp->dofr_data = ctm.ctm_offset / NBBY;
+				continue;
+			}
+			case DT_CONST_TASK_MM_ARG_START:
+			case DT_CONST_TASK_MM_ARG_END: {
+				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_id_t type;
+				ctf_membinfo_t ctm;
+				int rc = 0;
+
+				if (!cfp)
+					return dt_set_errno(dtp, EDT_NOCTF);
+
+				type = ctf_lookup_by_name(cfp, "struct mm_struct");
+				if (type == CTF_ERR)
+					goto err_ctf;
+
+				switch (idp->di_id) {
+				case DT_CONST_TASK_MM_ARG_START:
+					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
+					break;
+				case DT_CONST_TASK_MM_ARG_END:
+					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
+					break;
 				}
 				if (rc == CTF_ERR)
 					goto err_ctf;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6e74b4b0..a1a39f3f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	}
 
 	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
-	/* Special case for arg0 through arg9; encode as args[n] */
 	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 		idx = idp->di_id - DIF_VAR_ARG0;
@@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	tnp->dn_tstring = NULL;
 }
 
+static void
+dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
+				  DT_IGNOR, 0, DT_IGNOR, 0);
+}
+
 static void
 dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
@@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
 	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
 	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
 	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
+	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
 	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
 	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
 };
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 07d22afd..9ad4f5e7 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
 	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
 	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
+	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
 	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
 	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
 	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a0205887..c8208de6 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
 	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
 	&dt_idops_type, "vmlinux`struct task_struct *" },
+{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
+	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
 { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
 	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
 { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 038cf69b..e9d50349 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
new file mode 100644
index 00000000..c707184d
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The argument to d_execargs() should be a (struct task_struct *).
+ */
+
+BEGIN
+{
+	trace(d_execargs(1));
+	exit(0);
+}
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
new file mode 100644
index 00000000..0e9cda07
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
@@ -0,0 +1,4 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
+	prototype: struct task_struct *
+	 argument: int
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
new file mode 100644
index 00000000..ba419689
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
+ */
+
+BEGIN
+{
+	trace(d_execargs("a"));
+	exit(0);
+}
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
new file mode 100644
index 00000000..ac1c1401
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
@@ -0,0 +1,4 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
+	prototype: struct task_struct *
+	 argument: string
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
new file mode 100644
index 00000000..473e35e4
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
+ */
+
+BEGIN
+{
+	trace(d_execargs(curthread->mm));
+	exit(0);
+}
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
new file mode 100644
index 00000000..842371a3
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
@@ -0,0 +1,4 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
+	prototype: struct task_struct *
+	 argument: struct mm_struct *
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
new file mode 100644
index 00000000..86b1b237
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: d_execargs() requires an argument
+ */
+
+BEGIN
+{
+	trace(d_execargs());
+	exit(0);
+}
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
new file mode 100644
index 00000000..a4fcd162
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 0 args passed, 1 expected
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
new file mode 100644
index 00000000..3add63f6
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The d_execargs() subroutine accepts no more than one argument.
+ */
+
+BEGIN
+{
+	trace(d_execargs(curthread, 1));
+	exit(0);
+}
diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
new file mode 100644
index 00000000..f5a982ff
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 2 args passed, 1 expected
diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.d b/test/unittest/funcs/d_execargs/tst.d_execargs.d
new file mode 100644
index 00000000..b8b141aa
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/tst.d_execargs.d
@@ -0,0 +1,31 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: d_execargs() provides correct results.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	system("/bin/echo TEST");
+}
+
+proc:::exec-success
+/progenyof(mypid) && d_execargs(curthread) == "/bin/echo TEST"/
+{
+	trace(d_execargs(curthread));
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.r b/test/unittest/funcs/d_execargs/tst.d_execargs.r
new file mode 100644
index 00000000..d8ff6689
--- /dev/null
+++ b/test/unittest/funcs/d_execargs/tst.d_execargs.r
@@ -0,0 +1,2 @@
+TEST
+/bin/echo TEST
diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
new file mode 100644
index 00000000..902ac1a3
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.d
@@ -0,0 +1,31 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: psinfo->pr_psargs provides correct results.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	system("/bin/echo TEST");
+}
+
+proc:::exec-success
+/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST"/
+{
+	trace(curpsinfo->pr_psargs);
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
new file mode 100644
index 00000000..397c8717
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.r
@@ -0,0 +1,9 @@
+TEST
+
+             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+         0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 00  /bin/echo TEST..
+        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+
-- 
2.45.2

