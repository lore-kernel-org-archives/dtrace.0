Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6654F95
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094512; cv=fail; b=QfNVFohRc2v9vdnoU9h5dbIbl/1zpa/AporaqjuZLcvVmixkOTkDSGhST+49Qr9/QESfuHfMGrJZ9D2UhO8eDxkfKjlVH35qIiE0+muNeLRICwNA2ByXkfp1ONu41EpUGfXe7OiySNfRMlAh53GUET73VlsfSQEqAukc45jc8kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094512; c=relaxed/simple;
	bh=OUoDvY0iFxBNYQLfPQQWFnmrmCMnP3VTg+Xt8BibtUE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=euPmLzX0+dJPeiKImPnqRBrPizHJBUuX6fSxDeYWnPFFOadsXZNQGErdn/CZcxxrGH6UIFNcJ9paqZ3ia4cIQbJK4Xq6J4PA9W1mHwmIHA11LQRtsQYoudqzrJhZhKDoS0LUKoJQQXJMMS8Xd3NcYP8QBjwbELHdj8lngtu/34I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ddPwPv3m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uLHpQs5U; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ddPwPv3m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uLHpQs5U"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfkLf028997
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8cdeOy6KTMp84SpatT
	4++qQtDAWg0z/xCcuasgHsRs8=; b=ddPwPv3mxjjev+RPeVXj1hOEpj5P9F2YPa
	qoSN12woalJ1/Z2YQkAwL21ZL+jb9heW1MG0FPqGgv4+MaeiCoArl8gvOi9IhE+x
	t8a3Km62KKQmMjjrju5lX4slLBNCLm+gvXS56m8zmd+K7aFIRVQVFFpD7VzSqj/k
	qR8hbUlv6EA9w74BlAhjbixs+DhfWGsji0LK3vmvR/k+QmF8rIrKzGJ8FmsuWUUS
	aNLGUL7xjk14Si46adshhWjtKfWGaXu52/rSYDqMmoXJ0wlgwZUxiXg8+fVRboHP
	sWU5JZ2hURk4+yf54NnqJ6wp8P2fhf8MwvXQ1iapFTOETzt/hdBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5cmga8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GG1Mj9010363
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfbbj5-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlG2pjzaassyk9ngrM4EQUhXTRrhgQiLQ0qXF1zOMKeKkSvHHBfCeD8cqadBmc9YgIVxrWHEGniJidl0AhC2/iFVOpGcYUtUeUnDuX1UV0qJi40cANmLrl5NTTzf5G6ojGPfxDAeAzZnmGgZlSDomnCVvCa26ME5nnLVCsbhTMtkIhkL0SDid102n6Fi7dy6zz7qd71bRl0hLuQtQbFE6H5pV/mb6elZXtkba7XYTe5yr4uAVWl8pBofhigXUe68oXdh/PRSFRBPtjQPklmnHoMy+W9hLmh0PtR4PpQqS+cdi9YBQFVP9dEqOFahrOx7DfflwlAA3JN+PuhHDtxpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cdeOy6KTMp84SpatT4++qQtDAWg0z/xCcuasgHsRs8=;
 b=HC1H+kJZM9ET0erhi4Htsu4g+QMScIZwNBcmMD/G9TtS5urMP6AzQpf/qRaD8X5FNhrflaqAs78nEl3vy2ULf0EeNJAawwYxl80VDulrqP46/53XzD7ed7Iyot0s2e346ZZXVZRJeuBrogq3BSAVKKDXmSJIlIL+deWZQztgbAp43yti0tCb9paZ4mks+vsD9NFCyFgCyI4+sAdbL7iMUZySLGK3yOJso+Cz9k+YzW6vKuB9Yfg8BxTL2IexfwSUgfHaxy7GXYNU8kzmcV69fGk7+ZuPDH8WfITfLcWumyNKPnAuyANaVemHO8M7lFPiA3ZLs8OpMPQJ4zd89A4Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cdeOy6KTMp84SpatT4++qQtDAWg0z/xCcuasgHsRs8=;
 b=uLHpQs5UKiQdOcwJCiuTTIBDGEu6JahPNBLIODjYLEOLP5HevQaZNRa3MaDONxArFVpdyaHfZbMZY47RUr2YLl0sMfuJ8AyCOs09Vn67jmdm71mUt56clZQfLKlDvPqeaB2+3aFkKgRWCzQAm3cy0ix7CHmV34EWweCALmms6Lk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 16:01:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 16:01:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 09/19] Use usdt_prids map to call clauses conditionally for USDT probes
Date: Wed, 16 Oct 2024 12:01:38 -0400
Message-Id: <20241016160139.29589-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241016160139.29589-1-eugene.loh@oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: f81ab3f5-c92d-475d-c95b-08dcedfbd51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UzwHiJ83QtnpTezMHercWsIzm9lVyvTlMsisLfvQuflVYK9yXrRGasXH3BB4?=
 =?us-ascii?Q?rSUxtNaYvbh1E1VgVZb8tuk63fRMGOtSCly+/kG8bBrQPgT2akjidU41gA5p?=
 =?us-ascii?Q?RrDObPtVXhLXkZLnfYa6iiy6jfEmwqiuuPDis4xLwYDm/eiN7AXkcw2UXTgG?=
 =?us-ascii?Q?C9AId+0EkYMOv9wOYvYN1MVaafweLZS3z1ypK88KHoR6Ak+iWR0Lpz/+JrRX?=
 =?us-ascii?Q?t/qCuHS7UY9Ek1MHT3VdSu6PRUHFgFX0VRGND44kYobZo4NEoTKmJqofPt28?=
 =?us-ascii?Q?YFcApHDw3Wvf3Vfw9AYdOOsl1Yo8uxmXIa3QWZ2yb0GkGiG6Rv33kiE0Wz79?=
 =?us-ascii?Q?eEmTfQ95sJr9+unqK+qQoy+7TvYrmIUBJkb/lwhwgax6pBEAA3+ysjxBljlk?=
 =?us-ascii?Q?+nYTJB9ExM5azWhyvD9lT72YxOqPOW7XeSfVZ8dfmGrwoViKLyAeLJM7o2Yx?=
 =?us-ascii?Q?dlJvqPzsBLZyeqk1OsJOg+ovjf6PC9msFGx4tPzRP/qMXCEBZgwMaVa9GoL3?=
 =?us-ascii?Q?STz+hM6nZGRZ/0Xw8DS6eZKQ0uZwkSgo/COMi7BgiBvrEye7fn9LIybK1vBT?=
 =?us-ascii?Q?um/sGEtHeaNiSmV4GODdF1/lBR3JdgosxfZQXzcpbVXfB11d4pVVxkph3tpZ?=
 =?us-ascii?Q?3UKLfX+DkO8L3sIefoDm/Z513nQUyB0voTLSH9IPE3SnZLwSnWQ3Qw71Z/D3?=
 =?us-ascii?Q?dzEeheyqbKcGOYlgMiCZ3zTbuVAw5BvFaFckI1m7ekAjHO51NhGnKi/QgjRr?=
 =?us-ascii?Q?mEZDyY+QrX4OUKzHKjrDQ7BoBDgx5hxmXDfczFRAonLOQeW6XlpCPRAWsPWF?=
 =?us-ascii?Q?/9OVzJ+b2Ug2Zq97ki8jX17hjohlfFFRCm9QN8jO8BbJT+9Hyxt1qhTeTHF4?=
 =?us-ascii?Q?eKzo+IjNGEelSCQ1fO8bnJZ4lq3/aD5DFfb5K/dvN+Ajq/PFH44wWwteiREU?=
 =?us-ascii?Q?ODODyN5bEYrONmsO2qaA/KmpgSwEqFVopz7WsHJieydPz+6lVBRKmgD2E8Yj?=
 =?us-ascii?Q?srj4sMH3aYB9/OhKs/zqQ3WXyzjBXwGM/j2q5X0FH3FuP1QLtIVKzgQ9+SCU?=
 =?us-ascii?Q?U3xIPVEwdYPhCRLAGKwJSx5SZxttWILc6ffiICmTXKwY7JrWDSP8kEG4uUWL?=
 =?us-ascii?Q?LIveIgVnYBFz1U/MbfWNBzLuFlYsywj90+mIhXMGF7x+Mv/MQHvfi7bznY+T?=
 =?us-ascii?Q?p00eHFFuHnnZTonkGtWNd7Wd/x5C+h70CDxIDc8xSoS1N+h0znUhdUiBSaAv?=
 =?us-ascii?Q?f08z6NEopeSTS/o4ursu7Eo8VdsDYQdOK6uinPagWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DLP5iKUS/PKHpdKMB7bf1k82KabEQ0ZS+aJVQp6vFsE3pSByLxeCBTI2MCDn?=
 =?us-ascii?Q?vf0/BijYRaOlecXtJqhNmUPPnsGpY5S4SWvZlF8eKyT9jOE/pQhOs6LaHGkS?=
 =?us-ascii?Q?sp9C/c4tCIA/mpyk9qVvqe/c8TkEjQHpM+jzMyjZsvmR3VkxfYJJRl4Blz2I?=
 =?us-ascii?Q?epOsXB7q2HZ/+vNJ+ZIGNMHX7bUBXBOaLiKwLum4KtK+cb2bIUakFcEoGlF1?=
 =?us-ascii?Q?2iK1VMoBWQus8hDWMfpc1rVJ5LNNiqSN8kGbxfXmliNQDGxCBcwv0hmA6BcV?=
 =?us-ascii?Q?KF856EPd7gg0MqsaJ0DvLW4NvMNKIlomHj9WqQV8mR04AgDjPRV8pdPX2OF9?=
 =?us-ascii?Q?e7YUm30aTvyglyeR3ocN6qWpqCwR7VGmQD4GRFGKzQLHuFYPVKzw40a31w5B?=
 =?us-ascii?Q?4m9zVNCIw6odmrs82CMnY2MY950sQgp7Hi1zdaSsVzLcltkUg9jrdWKG0SO4?=
 =?us-ascii?Q?gEGCA8YHjPaXaS+woXO4/fHdb2iTQ6f12lCvK5t4ATQ09NCrC1CkXgWcuCYJ?=
 =?us-ascii?Q?GU1dlWqLp7QrrS2Cz7xjjxDUvQfikXkEIs0oUtGtrxiLtp4a5nb2NBOMfQUd?=
 =?us-ascii?Q?rVpzWm+oyJr94ZqO0pSWM0jtXVrpCRg84dsP/riCzMPYIOMEQTeXkAoFmmTK?=
 =?us-ascii?Q?05hhR4E4ovsqAUWOvb1ehW+N72CHPlmTbc4UaWtWG+v1+c4VMWOyEbNoh2mw?=
 =?us-ascii?Q?V0HOgomCCBRX8ZyF4Bm0nvYMGxXsEYwCIsuw0D+Ukv2vkCLWTe6iNw36OiUl?=
 =?us-ascii?Q?mLnRa4r7Ghk8KVH3jZlpvp0al2/QbRianuxs369CeDHfSlCE2uxxFieOlPwE?=
 =?us-ascii?Q?DLEFfRUaQQ8d0jmYUiXB3jRZba+srrrPDYkUf8b5iPGQu/zzzLXX+9aUvV0Q?=
 =?us-ascii?Q?Vc2VHb7nfHTo35huaab5V5YOuduNzgpMDjJqgEqf7PFiKED8SQkDllpfeLfw?=
 =?us-ascii?Q?ekwje2ChXK+RRLYK/Fk1xEKqxYqHqpjMfpIMuasP8XTxwkwAAwCfGqyd+X/6?=
 =?us-ascii?Q?KTYWRsvmarbsG5jbe4tAJaeAqpMbcwiqJ1ntOBxP+t+FuotK7i3lQWfR4+Bx?=
 =?us-ascii?Q?iSbCYEJilNY7bPjWQ8TxLHg1tPvpyjo5MwdTIDLYPF71yC25L8afkVfL2O6m?=
 =?us-ascii?Q?vyxFulvqdFK5Ht+kHA/6GvAkvpv9WbdNkqGBZdLyK2LUw29IJ3zxJr/ahXd6?=
 =?us-ascii?Q?8P2vtzUYVsIiA3Pld/k8DUTDtfAwPiafe9Pgj/ACu8fcE2vOS9TCQAVgOgAr?=
 =?us-ascii?Q?nc6/BcM4u/amAdfs6GKhstxLpbWc9nGdl0hQRPsc4iZj7Kz8QM/sQbL9baR2?=
 =?us-ascii?Q?hPQ2qTICnfjcGswAL0nYTPSf1VLAR8CZA6ZzvOXCSt3s1d069ajx7OeHOsO4?=
 =?us-ascii?Q?dFFNXS/KiASZAt/KPToVo5lycwKA+87BlLZ5IJ5RWvSSpYj1n5Q/jCWFJcTW?=
 =?us-ascii?Q?aqqBNt7FinHnhMiZ1cO12AOnd7TP79UVKMYyH1cTmK5cvyhEqjVEG7Mubj+M?=
 =?us-ascii?Q?PX029pa5S7fDNVk+ERR4gYYtE8p/ZmCDmF9IMAJWxMJcbGMfRim9B3bmG5Ic?=
 =?us-ascii?Q?V0k128CRaT9xl8M8s/1nYGToK25MYRIX7eigJ0Zp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fg4LLzf589yAK2/1+VLm7xvsXkfcMe2iKI1yf0aMyd6nhedzNnRU7VCC2pQGD7niJiwN68dUJZs4KAIzsBfRuKd4F63lHlExhVLeLYnBJUmsJ4WzTZMJPfWx+aq6U0zw6KB6INHrg1T2Nez9slhnMJwWIZKULdt/CAaev02JFZuqeoIWjQrh/Ot6cqSkqfI/YRfvxz1YrIyhf2O+jxq2WwjjoOUg2IQExQ6Fs2JxKNX25ffMWSXl7R9jAzVDuM0kblLhMAwT5jwXBJkv3LKb1nux0X2SOkNjPTmd6aWNSvqORTClMIe6kkHW1TGhsIfFOkePIMnLmkXf+Cme2UZ4kYUo54pxKUYlvm8r6kbX7mO5nx7Mlg87ei9V0aUy8XnQ9hgZGJs04cXdYnCQHsQk9vx0r1hvUace5flzU5Vh1G0BsOQ5izMYVaI9TtNgXuZUX289xfFuXYLXaCZ7DU3xQyAczA20d8mBF9/SRtVqUrRtbFCxcR4nb2I/VSq9SQE1VyMst4MHsY7VZk21n49bJ0pfULBSYmsnxIzvwaxsX3IpNpfffI84qLb9+yK9SzI4hcorZp+uOG+jOitnkI7cFRFjZjh/DWgbtAY4byux6go=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81ab3f5-c92d-475d-c95b-08dcedfbd51e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 16:01:44.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCalACxb4UaQ47kyV8AqKkpIeMwDoPj4F1iXiKe04OAtUlRTniE7BM6rrPiKK0cks15VDmMk+2NaTAgd5Q4Rsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160101
X-Proofpoint-ORIG-GUID: tBH3VS5243yQotvVbaouTPGgxLQE39bt
X-Proofpoint-GUID: tBH3VS5243yQotvVbaouTPGgxLQE39bt

From: Eugene Loh <eugene.loh@oracle.com>

This version supports only up to 64 clauses for an underlying
probe, but it can be extended to more clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c            | 166 ++++++++++++++++++-------
 test/unittest/usdt/tst.nusdtprobes.r  |   5 +
 test/unittest/usdt/tst.nusdtprobes.sh | 172 ++++++++++++++++++++++++++
 3 files changed, 300 insertions(+), 43 deletions(-)
 create mode 100644 test/unittest/usdt/tst.nusdtprobes.r
 create mode 100755 test/unittest/usdt/tst.nusdtprobes.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index b010d8687..268708179 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -739,11 +739,16 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
+	int			n;
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
 
@@ -755,14 +760,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Loop over overlying probes, calling clauses for those that match:
+	 * pid probes.
+	 *
+	 * Loop over overlying pid probes, calling clauses for those that match:
 	 *
-	 *	for overlying probes (that match except possibly for pid)
+	 *	for overlying pid probes (that match except possibly for pid)
 	 *		if (pid matches) {
 	 *			dctx->mst->prid = PRID1;
 	 *			< any number of clause calls >
 	 *		}
 	 */
+
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
 		const dt_probe_t	*prp = pop->probe;
@@ -770,6 +778,9 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		pid_t			pid;
 		dt_ident_t		*idp;
 
+		if (prp->prov->impl != &dt_pid)
+			continue;
+
 		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
@@ -801,6 +812,93 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			   BPF_NOP());
 	}
 
+	/*
+	 * USDT
+	 */
+
+	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
+	if (upp->flags & PP_IS_RETURN)
+		goto out;
+
+	dt_cg_tramp_copy_args_from_regs(pcb, 0);
+
+	/*
+	 * Retrieve the PID of the process that caused the probe to fire.
+	 */
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+
+	/*
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
+	 *
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
+	 */
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+		dtrace_stmtdesc_t *stp;
+		dt_ident_t	*idp;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		stp = dtp->dt_stmts[n];
+		if (stp == NULL)
+			continue;
+
+		idp = stp->dtsd_clause;
+
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
+
+		/*
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
+		 */
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
+		emitl(dlp, lbl_next,
+			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+	}
+
+out:
 	dt_cg_tramp_return(pcb);
 
 	return 0;
@@ -846,10 +944,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -858,7 +955,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 
 	/*
@@ -876,46 +972,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
+	 *     offset                                       value
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
-
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);
 
 	dt_cg_tramp_return(pcb);
 
diff --git a/test/unittest/usdt/tst.nusdtprobes.r b/test/unittest/usdt/tst.nusdtprobes.r
new file mode 100644
index 000000000..d894af92e
--- /dev/null
+++ b/test/unittest/usdt/tst.nusdtprobes.r
@@ -0,0 +1,5 @@
+try ""
+try "-xnusdtprobes=40"
+try "-xnusdtprobes=39"
+Files check.txt.sorted and dtrace.out.sorted differ
+success
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
new file mode 100755
index 000000000..50f18a6ca
--- /dev/null
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -0,0 +1,172 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies the nusdtprobes option.
+# @@timeout: 100
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/nusdtprobes.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make the trigger.
+
+cat << EOF > prov.d
+provider testprov {
+	probe foo0();
+	probe foo1();
+	probe foo2();
+	probe foo3();
+	probe foo4();
+	probe foo5();
+	probe foo6();
+	probe foo7();
+	probe foo8();
+	probe foo9();
+};
+EOF
+
+cat << EOF > main.c
+#include <unistd.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	while (1) {
+		usleep(1000);
+
+		TESTPROV_FOO0();
+		TESTPROV_FOO1();
+		TESTPROV_FOO2();
+		TESTPROV_FOO3();
+		TESTPROV_FOO4();
+		TESTPROV_FOO5();
+		TESTPROV_FOO6();
+		TESTPROV_FOO7();
+		TESTPROV_FOO8();
+		TESTPROV_FOO9();
+	}
+
+	return 0;
+}
+EOF
+
+# Build the trigger.
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Test nusdtprobes settings.
+#
+# We will start teams of processes, each with 4 members, each in turn
+# with 10 USDT probes.  So, regardless of how many teams are run in
+# succession, at any one time DTrace needs room for at least 40 USDT
+# probes.  The default and -xnusdtprobes=40 settings should work, but
+# -xnusdtprobes=39 should not.
+nteams=2
+nmmbrs=4
+
+for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
+
+	echo try '"'$nusdt'"'
+
+	# Start DTrace.
+
+	rm -f dtrace.out
+	$dtrace $dt_flags $nusdt -Zq -o dtrace.out -n '
+	testprov*:::
+	{
+		@[probeprov, probemod, probefunc, probename] = count();
+	}' &
+	dtpid=$!
+	sleep 2
+	if [[ ! -d /proc/$dtpid ]]; then
+		echo ERROR dtrace died
+		cat dtrace.out
+		exit 1
+	fi
+
+	# Start teams of processes, only one team at a time.
+
+	rm -f check.txt
+	for (( iteam = 0; iteam < $nteams; iteam++ )); do
+		# Start the team, writing out expected output.
+		sleep 2
+		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
+			./main &
+			pids[$immbr]=$!
+			for j in `seq 0 9`; do
+				echo testprov${pids[$immbr]} main main foo$j >> check.txt
+			done
+		done
+
+		# Kill the team.
+		sleep 3
+		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
+			kill ${pids[$immbr]}
+		done
+	done
+
+	# Kill DTrace.
+
+	kill $dtpid
+	wait
+
+	# Strip the count() value out since we do not know its exact value.
+
+	awk 'NF == 5 { print $1, $2, $3, $4 }' dtrace.out | sort > dtrace.out.sorted
+
+	# Check.
+
+	sort check.txt > check.txt.sorted
+	if [ x$nusdt == x"-xnusdtprobes=39" ]; then
+		# Results should not agree with check.txt.
+		if diff -q check.txt.sorted dtrace.out.sorted; then
+			echo ERROR unexpected agreement
+			cat dtrace.out
+			exit 0
+		fi
+	else
+		# Results should agree with check.txt.
+		if ! diff -q check.txt.sorted dtrace.out.sorted; then
+			echo ERROR output disagrees
+			echo === expected ===
+			cat check.txt.sorted
+			echo === got ===
+			cat dtrace.out.sorted
+			echo === diff ===
+			diff check.txt.sorted dtrace.out.sorted
+			exit 1
+		fi
+	fi
+done
+
+echo success
+
+exit 0
-- 
2.43.5

