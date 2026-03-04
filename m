Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471933F5A4
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658618; cv=fail; b=LYS+EHQQ2SZDxuxhvbW5HZCEdZCYS9vK6QNh7xFPE6eSiBENbCvHl+wdQ+kd9IYmt/ZnnJMX8nWdgaW6zVhBmydPy72BZ4pdxpxR3zt0L7wnSH52AreFOuZVgl5/ubOj21yTnZ2VUQgCtaOD5ZHr+Sh3uMiaLBXtLTcZleoOJ2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658618; c=relaxed/simple;
	bh=nJTA4bP8YC4b0mp9CsPqCEzWFoFEUDj91ZMY/uiRL4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ism55UuI3FCXSf//dC0MUiQRlA4ZCpBjcluf4TIS7ew2uFIVy7ue1AnsQ2zRgdcDkEHrQKQ2wSntXvotuHqRaOB/dBe5g6Ujfrv0xUs7UuxLnvXIYnP7JHkRsxFVjH9MD63coabc8qu/GPo06OW0vRr+4D+gF1ZyJyo32egnuZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k+r32LEA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VYBwtlmp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k+r32LEA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VYBwtlmp"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KqNpS3368311
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 21:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zU55OiwpeyKQfZe1vm
	a9lFu5Ls7ZMzlqAmnpA0GszlQ=; b=k+r32LEAFxa3tjdQ3vv/Unds7Vc94p1yTi
	AH8e8hFbf9ZX8SYaaEGZEYamszgerxxpp0gVaicqfrBKRXnS01odUTNSKnyOeeDN
	0J9iH0hZvpqZV8Nm8KVHQs7x1/7PwN7wg+CFvf0R03siti6Wc08pCCl/77nQpm+j
	+o05TwIfG4XXp8rF/QFT69UC3L6Bq3j1ieOhxKSSTFg4A3UJ/pVYOy5Apikh+psL
	Or418g1wjvQ3/WkDQCHemhCRvBjJauyhDfNsogRtLTU6WosQq4KlZyvIy3a9t2Us
	uLL5KWnFGrH7EwIeamy9KAFxE9Jaxl3PjnseVo/khpQn0jzBcMMQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpv5cg0xx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 21:10:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624JKGLZ027513
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:51:29 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptc2snm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG4wC6Dm/RX2bYPtLDsZ3VWCDgW2NCuumBxOBFr/exok1PPwYKfcQTxqTMoL4Qu3dvmGFnAucz9usxF8pCyu4E5lh763JzOOOMZJQsy48HcskVIJoVT6t+PjHqGy+XxvbxQ8dpe1F6tCCW1y1ue2NXUCrRYP1J5CXkIGiLotGdLZuSzChjmAD46b0U/432NQVL7YHDcj6lbcQRVrs9l1i5TjJ///Q5cj9DhTr+kqNWYPuUIUK4moTGI+crNmqM/B/SrveAgqeZE6+qNq1kOP9HJhxVKu850dxz2A7VcfFNBc4km0mTNZT3JGgA01YcI4psGSFSJbD+IWdw43bbOPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU55OiwpeyKQfZe1vma9lFu5Ls7ZMzlqAmnpA0GszlQ=;
 b=GUM5pbrT7oev/7tDpbgImpHGFaqtrwHleNxL+WdxTA/yoapfx3OeEp2O/Xm5C8CVQv6ErYMBRjbWkVJx5/P9SNymW+777fv0O0izeeTJMt0941wnh0PrufUiylcvX4MTLBIyyEeZ9bTvOwNhxjqRU9RER2zG5bA3E3kuz7BN5et94eyFKHQMNgGfeAylVIEvDxk5BXsXBKwklklIzFX5mbOHZ2hiT4cdIw5k6aRCHWkw2VFbXqWTr0EUXa2zjSk1j1HQLharK+v46zy172YLQhH6wg6q8Fat4Pg+1vdUhvJKu1rxyx0/gKWaynaoy7rXqQjrEIsv+romvBu5Z9o8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU55OiwpeyKQfZe1vma9lFu5Ls7ZMzlqAmnpA0GszlQ=;
 b=VYBwtlmpOXDdhH0WNuSPpIw3TXz06rvlx9LeXZkw4bFcvFxLR6BXZZYtW0dGmPx+cENO8EIDYeXAHWcGEOMtmmiFyxWmn4JywLhpBqOmmYJWqkdNlcPyHxQBbPLstpxm9lEqg6ylxooV7m2DJNGupO2acDRV79j+xR0xfPnDm40=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA3PR10MB8322.namprd10.prod.outlook.com (2603:10b6:208:576::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 20:51:23 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 20:51:22 +0000
Date: Wed, 4 Mar 2026 15:51:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] configure: accept standard installation
 directory options
Message-ID: <aaibSJGG6WDcAWHq@oracle.com>
References: <DS0PR10MB7522D6733324ACDB8A52D983C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <87eclz73fl.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eclz73fl.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA3PR10MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: a52a6ac6-bf2f-4fef-5c73-08de7a2fcb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	lFF8Vz9lS5Hdzt+GHVDR9ZeNUzHJz78sgWsmkJZ2p8Dw8DKcuhhyoPZPq5ObiFnEI81VGIzoB0TLxp2fxEtTmK26jv/6+cg05wNVRSr8f9kpKzeHuF4hVklcBmZBV2SFisUaXAluf0LOMZXh8feA5sAgJmZ8Ra4bas7PdBekM2lsr34UO2QiUDqoMdALZ4t/J2BoqRXzUGm8mDOP6MpyaNgcX/+f1lvaXVbckaG9Ajqkvo3WBkIfmDs7EMYZNahVO4HiXwyyHr5tdGz/tURZIDRMBmY/G9aH402VzYppnDDXQai1So4N58z+s6ZWqH9aCmpHi0kcvQbYTvLjWEOui4agOmHSxCTpyxLdpTwpz9Db6KOdWPTu2oHqUXj7FTSXDs86/PIUkUu5/HVNf35+2XuDZDyU2mX0okzhSNZ97A9HbeZkUkJLxkIC+op7g9t8oqEP77wNG3fd7lQmwwZFsprvcfxUFGnJFz6GuzgpOFXacfJn/ZCpUvCuGF4YwlALvbGP4lok09kvc3X/wFKcUzEbS7LENErQx49yvhuTBDpdqKcDGmExJhrGs8vtPTSiXbj9vw5B6zsnwTwXV+i1rUsZsTajgQSX/BG9n4iFSGoLRIGzf2e4maQtIFg2zsj4PxgLX7OAePbD6vFP+PNQgfcAzkbX0nHbwSPAHNbpklK1XgNTy3124ugxO0wsZdZhWjWGYH8IEVjAIWxe0q/Sm/NJgs92MINJ3z9He8/+9rM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cBE215TfVBT2J+uGQ8LxrDyc4wGnmlKDien80cunwAxD/v0voBD1r8mH1ZNa?=
 =?us-ascii?Q?0j4qE64tgdmDT6CJvgmBzpGY4hxsLQhDY/7UUN9c+aSzFWf/qP28PB+361UF?=
 =?us-ascii?Q?XrJBmu0A1PU++ykZ4UmSekxAzUW1QL2VaAwbeqj6uV6E7xIUyasToj35Hp/X?=
 =?us-ascii?Q?x0kiUOnKy+L+zH2MKk66X1RrUf+gyiH8DRlSA6+1Y+1DbN2hyDmskRpMo6Fr?=
 =?us-ascii?Q?PypC55WNiRMWyh3P7Zs0d7OZLPW7KsyfCx6oM4u/kNbdAkYQR5oRE8qef8Ai?=
 =?us-ascii?Q?VD4/0cfvDrGpYBu4tI93HCZb/w0E7aNMWuF5FChd7LJEfNPN+yxy5WkSWuw6?=
 =?us-ascii?Q?w/9DdOr/O6xW8Rtq0VbRGF5ecF6oJt4rPya6xD745DGp7AvQ8vaeVfIQXnku?=
 =?us-ascii?Q?3lXHdg3CVpfgvLrawPhkx2qYV8kFpOZDZ+pwCxNup7b/AUgY0P8maU41tm39?=
 =?us-ascii?Q?5foxD3HU9fFGbiFFyR97q+Zt1L3qpuUu+w+f9MX+HbQvzW/oSwfhGSgjdwIj?=
 =?us-ascii?Q?kbuwG27e/3KcdKn5C0E4qPbnNvFdng73sSXwTjc8BdF9Y+DOdH9l9nPGnjbS?=
 =?us-ascii?Q?q7aGgtpGkvAthBflaQcccGrXRg+saI6CUba9eni2dCGVuQx7kE55w/mOTT6z?=
 =?us-ascii?Q?4ZRgXTxoJjCX5yMSBzSQmz8raxDn5NiwbLS7g9NW6UZ4hiRhsapkuI7YxczF?=
 =?us-ascii?Q?fWDxAScVnYoBhV52L3eRZJa84pU2s5eCmIq5dCX/PRw4cdHISnYlB4LvuaCq?=
 =?us-ascii?Q?2blju/gVUeotXTGaT6aFp+lLjueKN+CXHUod0v5ojcnrpmowRBaFF116Iz8H?=
 =?us-ascii?Q?nfijFhN2W8TzkWtoB/aRSqU1gR2KS8zwxVdtTxlZ4tvAgPpoLuaD4d2nrMy5?=
 =?us-ascii?Q?p9csZniPpr8vJS6IIFwhk6cF+cO6gm+tb7LSj4re7zM6fSEAek50mEvKKFF9?=
 =?us-ascii?Q?p5+Zi1/tP0jaq2j4TM8zyGEdIL1zMeBjb8F0rRmdV/COavk0dZUp3o66fW1i?=
 =?us-ascii?Q?ekfKUMSVjGMdKk+fjIIGLz66kB8eS8b9gii0VmfaWQXw8Ns5psNfRxpMj4dA?=
 =?us-ascii?Q?2XoWjFout7VKouyhm2FS6S3I56+EOhUbgDOC7cHpNBrczdgJgBkebBazSDxg?=
 =?us-ascii?Q?mSve20E/agD4qV+nJ4QfbhigKxthJxjV2eNDe8FR/3IpLCndc50zxu4YBgEv?=
 =?us-ascii?Q?i/uu9oKJyjZ+8oM4vj7O/guHuIhILEDL9LUigD95f15ZWUT0zWykKoYGUPkQ?=
 =?us-ascii?Q?//2FC5aHygaZ0BqqG1g9VIGcXl27Mnxo8pVxL8ClwdKaa4RFf20wFn5uAIQb?=
 =?us-ascii?Q?GaWGBEYXlMyof6hMa3rumxtgSp3AghseTZbiO22ISgfKjzqJcvnGfNUv22Dy?=
 =?us-ascii?Q?yUh3rwZwz1oGmJzRzzY2/Qwt7HF60Pk8Mx0SJAVBLAhzqscRfXEPG4FV97gZ?=
 =?us-ascii?Q?0YhBEfL+FU2wUmSTyCQwzlHL+NtzhGqs/9CiFoT7+o9vCX3AE0ULlI6NuEQ9?=
 =?us-ascii?Q?pbJp0G8eojx10VZrrLqMLh5yh55cvsV1auXd/gWp4HB9Gd3ZzcHKxEIwE5DP?=
 =?us-ascii?Q?yNYdTyjTgjHwOaoOdfXX9NzTFwiI/+8OmTyFAS7FTbeVnyolPx+L8NnIYWpo?=
 =?us-ascii?Q?zSXmYHYDnv7CdxSf8Ll8NzVr1wbzDLytq69Ag4j7ogmJCE9NVQrMQ2x/bSAs?=
 =?us-ascii?Q?rijgdd1N/589i/KOV13fz+gXeBlmcRsM2Bl+wOoY1qEZPjkF1zcgYnq0PMfL?=
 =?us-ascii?Q?oEVq8coFGw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qdYRQsqQLluLZ+mRo09AVmbmrMvP+TKltvCZs/v7L7++yK9mlkC5clbL12UpWIe5KkQ6saMoKntmhs2hb2XW2PXiyE7rzJgi0kargXwUZdoehGZODcBxBMhAbPha+2eNHVitLqITrZU45SnNZT+LK5Y6rLNac9Js2B8SbFnVYffOiFKFyl4PO2GN5sBjVcSHaN8KW490dH+BjZ6WY03UoHwAYN3J43FUaBe7802f23NPCqnwBCxE4Sqe0BfSaIrGlraKaPJfAfN2tCam82Apwwz+uVQAueuRPv8X+6cWOaFhcBo4ODQlzoAqh2mRVe2JNqeWhpO0/73OQjgrb7RpRbakX2ixfPufsUbfD5MQOQmPnJ/42HiMPPOk4F4x9ekPeEDz82SLlzoq7Z43aePOV3jvrnUaI3B9zPvz5/qhf+JV+/1/cQuvPvtGoS8JLMB5/+Ssw7UuTSyjPgd/rL43utxJvyZ3XYtL7Olt+/ZKy1R1ihrzzg/Nr9KiCs4vJEnW+VYbNvPt1x568YcUJCUE8mGOy+RMNXrocZgVYLDtGORYIBypYAysiGi+otGtnLyEwympr5YFPi5ip31LBDaLq3UPaq6sqYF+f8UZ/ucx6Vk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52a6ac6-bf2f-4fef-5c73-08de7a2fcb3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:51:22.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9lzIbt08h1sKu1HHUKDc2qFjVc49yNmTOK6DBYDmfi2Rf7mEcT3KwD91V/QiErl/3xHZFNJbl5EM5XKtaKxHNWgzpJfsBziKsl9O1KyuOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8322
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040170
X-Proofpoint-GUID: uE_6R29JLX0p1LqFkrkxLt4cQ2ussGpn
X-Authority-Analysis: v=2.4 cv=XN89iAhE c=1 sm=1 tr=0 ts=69a89fb8 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=A79_60MDd-AGe9dQ5P0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uE_6R29JLX0p1LqFkrkxLt4cQ2ussGpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE3NCBTYWx0ZWRfX/uj+uGjhHyDJ
 P1f0Spx31EIFHlNo7qkJiZUVcEAm++iAuKGagfNaxPU6QCiyoCPABhEqjCY8EWJBTlzuYRykWsY
 rs3yFjy4On3o593Iu2NWVMjk0iBwacGq2ridS77HMurji/VRLqx00/8ztuHtdPXe3IJo4YjK/iL
 S8/56P1fp07NRRdLvSursKnKH/CKNwl9FmJFliHEVJPs6ZiPby/V+eS6ChyFTKOAibbmwXhhJSO
 gFN+J4nGzk87X2+mwgSjxuUN2DXvYIwnKvomk0io8WfJN8tXC70Hj2bsW6N6f8THkHsLmFMDsWw
 M14nl0BXKqWFSqmi/buVHv3kXdqlmiaTRq9/87Tsx3P/G0h1XO33WgsEhNVPKZEd4nwHMvzdBv2
 PO6ico8EYhTMEvwqBjG99uvlJlRVaut8tgtdV6bDF6TpNGwRzK3Xre57QmkrWq6TLcYqHrKRcjq
 Mb/lNuArYrn7aeTNPNQ==

On Wed, Mar 04, 2026 at 08:19:42PM +0000, Nick Alcock wrote:
> On 4 Mar 2026, Kris Van Hees via DTrace-devel verbalised:
> 
> > Even though we do not use them, the GNU Coding Standards expect configure
> > to accept the following installation directory options as well:
> >
> > 	--infodir=PREFIX/share/info	Info documentation directory
> > 	--sysconfdir=PREFIX/etc		System configuration directory
> > 	--localstatedir=PREFIX/var	Runtime system data directory
> > 	--runstatedir=PREFIX/var/run	Per-process data directory
> >
> > This patch also redefines some of the make variables in terms of one
> > another now that a larger set is supported.
> 
> Oh, excellent!
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Looks good, but...
> 
> > ---
> >  GNUmakefile | 13 ++++++++-----
> >  configure   | 42 +++++++++++++++++++++++++++++++++++-------
> >  2 files changed, 43 insertions(+), 12 deletions(-)
> >
> > diff --git a/GNUmakefile b/GNUmakefile
> > index 38ae5423..835bc9b5 100644
> > --- a/GNUmakefile
> > +++ b/GNUmakefile
> > @@ -90,15 +90,18 @@ SBINDIR = $(prefix)/sbin
> >  INSTSBINDIR = $(DESTDIR)$(SBINDIR)
> >  UDEVDIR = $(prefix)/lib/udev/rules.d
> >  INSTUDEVDIR = $(DESTDIR)$(UDEVDIR)
> > -SYSTEMDPRESETDIR = $(prefix)/lib/systemd/system-preset
> > -SYSTEMDUNITDIR = $(prefix)/lib/systemd/system
> > +SYSTEMDDIR = $(prefix)/lib/systemd
> > +SYSTEMDPRESETDIR = $(SYSTEMDDIR)/system-preset
> > +SYSTEMDUNITDIR = $(SYSTEMDDIR)/system
> >  INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
> >  INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
> > -DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
> > +DATAROOTDIR = $(prefix)/share
> > +DATADIR = $(DATAROOTDIR)
> > +DOCDIR = $(DATADIR)/doc/dtrace-$(VERSION)
> >  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
> > -MANDIR = $(prefix)/share/man
> > +MANDIR = $(DATADIR)/man
> >  INSTMANDIR = $(DESTDIR)$(MANDIR)
> > -PKGCONFIGDIR = $(prefix)/share/pkgconfig
> > +PKGCONFIGDIR = $(DATADIR)/pkgconfig
> >  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
> >  TESTDIR = $(LIBDIR)/dtrace/testsuite
> >  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> > diff --git a/configure b/configure
> > index cb2f585a..96a13137 100755
> > --- a/configure
> > +++ b/configure
> > @@ -53,16 +53,30 @@ help()
> >  Installation paths:
> >  
> >  --prefix=/usr					Prefix of all installed paths
> > +--exec-prefix=PREFIX				Prefix of arch-dependent paths
> >  --objdir=build					Build directory
> >  --libdir=PREFIX/lib64				Library directory
> >  --bindir=PREFIX/sbin				Binary directory
> >  --sbindir=PREFIX/sbin				Alias for --bindir
> > +--libexecdir=PREFIX/libexec			Program executables directory
> > +--sysconfdir=PREFIX/etc				System configuration directory
> > +--sharedstatedir=PREFIX/com			Arch-independent data directory
> > +--localstatedir=PREFIX/var			Runtime system data directory
> > +--runstatedir=PREFIX/var/run			Per-process data directory
> >  --includedir=PREFIX/include			#include directory
> > ---mandir=PREFIX/share/man			Manpage directory
> > ---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
> > ---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
> > ---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
> 
> Did you mean to entirely disappear this option? It would still have an
> effect if it was kept.

Is it actually used in any way?  From what I have been able to see, the unit
directory is always SYSTEMDDIR/system, just like the presets always seem to
go in SYMTEMDDIR/system-preset (for which we never had a specific option
anyway), so it would seem that --systemd-dir is sufficient.

> > ---docdir=PREFIX/share/doc/dtrace		Documentation directory
> > +--oldincludedir=PREFIX/include			#include directory (non-gcc)
> > +--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
> > +--systemd-dir=PREFIX/lib/systemd		Systemd config directory
> > +--datarootdir=PREFIX/share			Arch-independent data root
> > +--datadir=DATAROOTDIR				Arch-independent data directory
> > +--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
> > +--infodir=DATARIR/info				Info documentation directory
> > +--localedir=DATADIR/locale			locale specific data directory
> > +--mandir=DATADIR/man				Manpage documentation directory
> > +--docdir=DATADIR/doc/dtrace			Documentation root directory
> > +--htmldir=DOCDIR				Html documentation directory
> > +--pdfdir=DOCDIR					PDF documentation directory
> > +--psdir=DOCDIR					PS documentation directory
> >  --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory
> 
> Nice!
> 
> ... really the number of these is quite overwhelming now. I think we
> need a little more structure. It might be worth indicating in the help
> output which options have no effect, though, since some of them do have
> an effect indirectly, like --datarootdir, but some have no effect at
> all, like --oldincludedir. I'm honestly shocked --oldincludedir still
> exists -- I've never seen anything at all that uses it. Maybe GCC
> pre-2.7.x?
> 
> Maybe these should be moved to separate --help sections, maybe titled
> 'Installation paths affecting other paths' and 'Unused paths accepted
> for compatibility only'?

The help already shows the way the different settings affect one another, so I
don't see what extra thing we can do here.  Moving them to a separete section
seems odd because that means they get separated from one another.

Also, while we could spell out unused paths that are accepted for
compatibility, none of the packages I looked at for reference seem to do that.
According to the coding standard it is also perfectly fine to ignore them
(i.e. silently accept them).

But if you feel strongly about this, we can definitely move them to their own
section.

> > +        --pdfdir=*) write_make_var PDFDIR "$option";;
> > +        --psdir=*) write_make_var PSDIR "$option";;
> 
> These don't exist in most Autoconf-using programs at all, though they
> are in the GNU Coding Standards. But, again, this would be fine with me
> if only they were moved into a separate --help section :)

In summary:

 - I think that using --systemd-dir and deprecating --systemd-unit-dir is a
   valid change, especially since we hve the inconsistency of having had that
   specific option for the unit file directory but not for the presets.

 - I don't think it makes sense to separate out the options for paths that have
   effects on other paths, since grouping them all together as they are in this
   patch actually documents how they relate to one another.

 - I will move the unsused options to their own sub-section in the help to show
   they exist for compatibility only.  If we ever end up using them, we can
   move them.

DOes that sound ok?
