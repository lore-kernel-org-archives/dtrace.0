Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4D1E7C3A
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290396; cv=fail; b=CVtAJDXFO61HMHr4z0B0EK+Dxh+/mUi5yyJk+mvOF/TGn1QPoEXvPtJJ3mlJGqc249aLGLqeoKHu751pqmfO+ofpU+SOepJqdvK32hFa1gNzcDKlbyUzJydATmD/0S9GCUa1UzV/aZ91deO2gyhbzqbnxkMhMat8uEU+6dj07mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290396; c=relaxed/simple;
	bh=9/Ux+dj6Qyw11OIuy5tRHE2nrGoZ7d/DY0gItDodhVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k+sFkVMc9DE3ifu4nkhs3qHdZh1ukeOs3p6DMePqr7mSX725k2cm1qSfJ8DlOiPJOHCAJB+9IuXEs6xvWjaRwj6v61vyle9S6ZBinYypKds3XfnLsc3uV2EmP8vVKMCtjU3/b6YJON4ErZXiDyDr1FOvIxIMhnvzB3nhWZhCmKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gCKnwXWx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OtxsdKGZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gCKnwXWx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OtxsdKGZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fwIU002864
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9FKye2V9PRQ/HOOe0LIzONLGxfccLVPw9IS/7HPldW0=; b=
	gCKnwXWxD4tP5N4q2DmjqCrrOScX7ohDE/d0Kjou2BLRNWcRcjPVQEJ4eSt7A2Kz
	IpgfCd7c0RcaK3G7yf3Moe9EPZulWmYixPMW2UwvZJXpMuu37pSgBh0ixpT0m16u
	RiNY+me09Xd2qNCWksk+aFsq/T3sHHVps8p1phOtXjXKfKYc2ANOXNEY1LBCWzds
	I9G3eB1aa9VKVm2V6cvXu7yvpNXFTWA3QfvU3CdMA7muRLk6chkvyIE95X5hQm9P
	8Hhbsp8uKrxwlcrNYJibNGB1OYLYINT7bYsiPfXja/89lUsS1fqGCwBta8WfXpeC
	5lYcohPHXkqWhU4HaF97AQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmfwkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBUoCV040257
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnaqfjxq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAQVlD9ZLStOutm/pewEwC5cbbc9SaVFgwFeOdhvZxSOSc+RqNqP7B+/oYsEt/B2+NZWEIhC3WpI3vTlLRDOyKw+OfyUD7Jp0To6CNfy1JQ3wfJwkPQcukSa+Bib/fHNFHfrRHdzug8Qyp25HQkY+lUm5ZmUJc6V9cRP8sCur2nehnhiRqyzjrwxqdeDYMM+RPWKSBwRWaWq2cBNGaae+fgLYZrAJmLVm3R1jq325MwaRw8lgkS1MhSLvKy0i/EHnDY/RWeypphLTQVCl4NVoeyvms3YppL4AhPqBFSqwGCEHZt6G8h+fJSXBp+tM/Z8SBxEA7IDTkibOKRhOlWcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FKye2V9PRQ/HOOe0LIzONLGxfccLVPw9IS/7HPldW0=;
 b=jt8I/s9e8+7tCKym9H6AqH8QpZDPxmoGivs+wMzIRrKtS7FeL3MxMguRylG4/BIKFMM41gnNMXHW37QtaCXvOarPPSD+2mec0TdFDRwIbB0HqwnSkVNodjW+QNwQcA32SOYZk87g9RhZrQ/Uak9W7+jpETzGaQcKiJgWtKNpeo9d7ihGMe+1xWsSMu9TW6Sp8zibQPyl/PiEDe6H9yC5jvTOlYHYNqzeZh5TVfKzeg8s9iGm8YyXUIy3oUGtt5xY8uensx05f5yclNN16daJItnY4ZJMKfMXko7PgetrNPEABXofzPTeGkJvRjbeMpuC3QqvgPj1q7CvM+W9A/CJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FKye2V9PRQ/HOOe0LIzONLGxfccLVPw9IS/7HPldW0=;
 b=OtxsdKGZFzTg1lT/HpmAbyK9N/uUm/qLdMqjHr9BL+THlBQWD9/2UMf3t2MsR+bhhU660J2InRNH2aCj8VQWhdcT/l+DakuWNvDHkB+kYD+X4IWo5fAqkzpYVZi4RFrYYXvD9D4yItVrOq2DEUfnq/jXuW3WvNTkqpk5KTo6BA8=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:07 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 12/14] man: add manpage for dtprobed(8)
Date: Wed, 30 Oct 2024 12:12:34 +0000
Message-ID: <20241030121236.257803-13-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: a51a9c5d-551c-4824-448b-08dcf8dc36b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NtgNwKV/15ZObPew4z/LgzMDI+/ED5R17R7tGT/ufGFzQq+NOCttRcKCV2rH?=
 =?us-ascii?Q?F3tj+3DBSAlx2exqUNtN8SUv/g1TZORRJDRkbt93LYR5mepY5m85rU4Xm4sW?=
 =?us-ascii?Q?dtFnaCsgFhS9Dp5tf4OARaGTe6cVBjMsKvEZOziBi7KiTtBdwDIshIivk2K0?=
 =?us-ascii?Q?Gd0qcrCqx+ejlQ2glKrLb0sV0GVqH2lVH3G09t8jiZfEaIJU3QtZQin4e6JN?=
 =?us-ascii?Q?kS84QvYSDmi4Ouh8LUDDV4DS7LWxsU3Ywcjt0MtdqTVxiZ/xqou8vouENJO7?=
 =?us-ascii?Q?HiclBbTwWrrpRsqS9OEnLPkSLnbxY0niqI4vLfYQED1l7kLyFDz1P+F3lFGc?=
 =?us-ascii?Q?m7uklm3ECbqdyFvsXmhgcqOLeFkyLCTxn3M4Wa3CI0R8vBnyu7rTWnCFHk3B?=
 =?us-ascii?Q?qT0yDC/tzh/CuEVKYFQXeMIZM85ZaO2gNOSKXz8N6qgz17vI+idjth56v8OC?=
 =?us-ascii?Q?c1iXVqfzYvkng+9M4i9Fv+kSu36jxmnCUthvFmjPc+v0pkcB5Hwssg5c4SgV?=
 =?us-ascii?Q?kMaPVh7DMKGHpaaJA5AtoayzvogvTrp94cSnnFauZkq6ICw4+sMfT1RA29ve?=
 =?us-ascii?Q?t2ReYZJAgEZtyn3rKwKWdkRKyR84BKHzMPRu1txodfCfFAGHPMbxxwUsAvAR?=
 =?us-ascii?Q?6cIE9BVvuPkuBESRGlFKNJk58r/u82txbGMLq1n0lETKCctqpeLgnXgBFxcy?=
 =?us-ascii?Q?crtDQGCR0QO4SkTO4+UShgZx6xdqSu7rFPVvgHoZ1j86xnsEEm5SrBIamo6h?=
 =?us-ascii?Q?uK+6kurH2vAXe02bM5v5lSVk3sUDU/xtQdN1UEKWW4NGoBv3JGTv8zl1x/7G?=
 =?us-ascii?Q?s1hkrJqUFi9LWvyn58w+C/dARC7DjUEgNkdryvVK9INCWTgMk9ZVbD619PRb?=
 =?us-ascii?Q?/C3eStQzFvfZl8RBwv7IxYZuqgmaWRaxkvSSQQ0hPqNYMTpZt6Q4usz0HmjU?=
 =?us-ascii?Q?S49QqLRz7YkIAE80mkm9bzs8fid3LsyDH2+kn20/anfckL23EAIBHWSNMwlg?=
 =?us-ascii?Q?+DFtB7w4wMJmIb7C1sXYRrE/0L7Cg9OKd8rwDdzqRLbOlZHcD/TVtYNRC8Vs?=
 =?us-ascii?Q?Gh1sFSTwyrMOrtw0tSJbsAlpetysbyzR9Ah8wK3x7NWARZCHct5z7jSLBtIh?=
 =?us-ascii?Q?NTFC2nSE2dUijnIZaSvrzF9ZFxkwt3iVw9+OyVUTcVAT/so1lFLcaTL+8lKt?=
 =?us-ascii?Q?V9ySrCF7Ycqh3H3jD8GdCmt5QaZFL3TVVdyHuaEG5kC2hDG7bL8/TI1g7njo?=
 =?us-ascii?Q?BqDLVmP7RvEmOMX04HrTTA4pxIH4NK9icE1GczU3+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TaThMIgtFJ/sZ4hqCdA6un/yVgha4GwGxE4RLzPEApNIK0QQISOlCNFAt4NM?=
 =?us-ascii?Q?NDQOR7VvwZh+vF23mcgAwMJxeE3Do9H8DeMklkuoAAEM79qIIZs+7K4KXFIU?=
 =?us-ascii?Q?MlTkoG/1IMVfW/8uAb/frWWr98SdOTU6JvG75hF3G+1EAjBqEyepiZh2RMNh?=
 =?us-ascii?Q?nZvMgKQNM7BXAa6E/JjfAwidtYHz++v55LQmVkCUS3FMYrzWilhcfNn94Dqc?=
 =?us-ascii?Q?o+C9KAcfVOXa++D2rdXA814wlhG4k5GkN4e50LkWi/MjsMg06Tah5ruO0sFd?=
 =?us-ascii?Q?eVWgAUzhN83xeYTlqUkWF7MPwfN3MnpWhT5kgvk120u+aJ+ZCxfyXVj3Y3Fx?=
 =?us-ascii?Q?v+nGCrR+FbKBm8AXO5RdJ3e6gVaDduUbln4rOKKhp0OAirpkpi1RH09hEEiL?=
 =?us-ascii?Q?dU+zw/BDZSqxUe+2rD+cr4PJulWBI94bzFU0bko9jOD9VCSyyTHb17ybw36k?=
 =?us-ascii?Q?vCiv29Dw3ZAPPyNXLTj8Thdw8PqMbuPYTWzS3MpDOsL2Lym4T8ty8XZKkwYw?=
 =?us-ascii?Q?3Z/RbVwCVAx8tMC2nPB2ojYCSU2+r4sq+HjrAE4sAg0wHraj1si2Dn1mIOzt?=
 =?us-ascii?Q?Eg2BUa2cRMjlu4EDjpuOeon2EqznkdjKWrGTFSBmH43i1X9AqV7Mtvt08QP+?=
 =?us-ascii?Q?tE+lU1dmLRMs8RcP94rGFGr3FppZyn/gSOLSi6DnSXvk2EurOe0qxvJZdj4P?=
 =?us-ascii?Q?17oEPXd5tnIFKN/+6A5zqJf7MYHE43r8P9fcrU24YWnC+n7yfXvfNiEFXPOJ?=
 =?us-ascii?Q?s3zou9RRcOpvXyJtXIa9kBapyRzAI/JWShDQ5EmweOolXcSTx/Muf6TLZvxY?=
 =?us-ascii?Q?Y+zpdJ6xR+eH1OO9IOPs11m3UJl65/aOPKvoy4uSomjMVkV0gEUn8i/aNHQ4?=
 =?us-ascii?Q?LRR6NTH/q1jH+nmthThVLJA1TH97uUOYTPabGzsQfacQ4RB2V8JBcVdx1B5n?=
 =?us-ascii?Q?02MA/1PKMEe3vKxJPub3eq3am+eEMYr0EN1HuG/TY5QB48RI8jADlpqYosC1?=
 =?us-ascii?Q?0om1Ou9diRVU8i/zFreIuVuo4yTBkR9gPctbCFBqidpLvlgeFeNLELeXLUIS?=
 =?us-ascii?Q?CYyW3DsU0t6oIqgnqh1KQyA8TVV7ZFZwl6/ULwApsGIj2zY3vUx+oT7o7da5?=
 =?us-ascii?Q?vJhfSqcN4f3yH4p0Uh1i86ID51a6WQqdT39aIQOPiJT5A6PsEmiTmTJHFAuR?=
 =?us-ascii?Q?pLHO9cTo0MqTBeikIdZ0EaRXwU6jE3qFRX8GjJjLjj6Ptv2NWtgtYIIiGXge?=
 =?us-ascii?Q?p1iIKSfxwMChoQHtWsUD1WkKIaBCyBFbul9P9z1N8uOu+bfuLhD5nDgVhsFu?=
 =?us-ascii?Q?XhANQfqTzHU18KaAd+LTzxgAkxqQQEaDVIAFP4mllzibJ2p0K+01BGH+tpzx?=
 =?us-ascii?Q?4iOtRZT79aNc6RwkqFR0yQKB+f/yOMiGmFQs15xJS9dJHjUV9V/GD+bHA6dO?=
 =?us-ascii?Q?WtY3/9DGPA/mL1aPAv5Qrk4emp7qzenSP+xf1DhwhoFx3L6W3Ks9dK8lcf/8?=
 =?us-ascii?Q?BITPk6AJ5mAekPV7Ykz+0NhGDNAYMkASq+O0GmPtuRsn7q28BZhSoamZZkz5?=
 =?us-ascii?Q?GNKqVMHKaS47F4qalhZSzZ1OdvD1GwdVQ2QyvZ10RVUAMY0aohmoAhaDBg4u?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jofakfJZgrcjbAi+jBmpZ3IHvDORG+p9cFq2+pjERJfEvKkBOhjvR7G7RFqdlRDyFcSSPCrLTf4HAMdvu5Zy+8V3YEje/9kSbxxIfun1hXq0ah5/jbjx5vMtdwHg6tXK3DmDPZMsIY2xc0/E7VZQR1Ginlr35qeIe4/Xhja1n/MZQBV4NwPF1SgZPDIJBuPLlNc/1f21YuB5ItXLgohx+xdD0+xk17SuWRyQxUeDeG+zUK9ovvG2dB2vwMMmBCRuKbHR4LYUaOsRZXtfKGozgseGc+oUqYMrT2xAU9W/em+r7IBopNbFYq4qoz3r3xPEVZI3ub98qf/U/l/uVnvz6Wkv5Q9D/yU3VLO8dgrvnDndfCOG3/HduGIhpGzpFjqqC2PGUGqVzJXP5ziKvA9KVC9JXb7RK3f2amFU8MJStBFU99iaOQcWI36WYyvOp3x4bn2FKhTOrZj4+f6qUzJ8zhgk898MzA1FteZt0DmLVcys6mF2Dtq0+wNhdEOH3TGYzqxaOImkRnbCF+u9QtHtvRQkYUH1IYl4kKGqdvckBYsGR6qp3XMj4FQdDtjg5xtVCElPf48sBZPdoQ5nFK0S/+UiAKvKIqDQV1Ol4NFKQ+U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51a9c5d-551c-4824-448b-08dcf8dc36b3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:07.5944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf9IQc0C0jRuI8Kc9NQ99O52k38f974iyPi/UuYLCLoFlPb18oTYPLtCh6I6bIMoWmH1YlwM2YftG8gLHDc67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: VYHKKxQahm1u03CFnEEnmQOkUNfQA4pA
X-Proofpoint-ORIG-GUID: VYHKKxQahm1u03CFnEEnmQOkUNfQA4pA

Cross-reference it from dtrace(8) and vice versa.

Bug: https://github.com/oracle/dtrace-utils/issues/94
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8        |  3 ++-
 dtprobed/Build      |  2 ++
 dtprobed/dtprobed.8 | 64 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 dtprobed/dtprobed.8

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index fb9392d29cb2..c299073239eb 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -184,7 +184,8 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH SEE ALSO
 .BR cpp (1),
-.BR ssh (1)
+.BR ssh (1),
+.BR dtprobed (1)
 .LP
 .I Oracle Linux DTrace Guide
 .
diff --git a/dtprobed/Build b/dtprobed/Build
index 346cd6aee190..7d98ddf836c3 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -57,6 +57,8 @@ install::
 	mkdir -p $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
 	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
+	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
 	mkdir -p $(INSTUDEVDIR)
 	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
 	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
new file mode 100644
index 000000000000..2ebe89ccc426
--- /dev/null
+++ b/dtprobed/dtprobed.8
@@ -0,0 +1,64 @@
+'\" te
+.\" Oracle Linux DTrace.
+.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
+.\" Licensed under the Universal Permissive License v 1.0 as shown at
+.\" http://oss.oracle.com/licenses/upl.
+.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
+.SH NAME
+dtprobed \- USDT-tracking daemon
+.SH SYNOPSIS
+.SY dtprobed
+.OP -Fd
+.OP \-d devname
+.OP \-t timeout
+.YS
+.
+.SH DESCRIPTION
+.LP
+\fBdtprobed\fP is a component of the DTrace system that keeps track of USDT probes within running processes, parsing and storing the DOF they provide for later consumption by \fBdtrace\fP proper.
+.LP
+\fBdtprobed\fP should be started as soon as possible after startup and should always be kept running: processes that start before it may not have usable USDT probes.  On systemd systems this is usually done automatically.  (Restarting on upgrade should also be done for you by the packaging system.)
+.LP
+The following options are supported:
+.TP
+\fB\-F\fP
+Put \fBdtprobed\fP into the foreground: log output to \fIstderr\fP instead of the syslog. (Routinely used by systemd.)
+.TP
+\fB\-d\fP
+Enable debugging: log extra output, and disable sandboxing of the DOF parser.
+.TP
+\fB-n\fP \fIdevname\fP
+Name the CUSE device something other than the default \fIdtrace/helper\fP. DOF-containing processes will not connect to this instance unless pointed at it via the \fIDTRACE_DOF_INIT_DEVNAME\fP environment variable.  Using this option is necessary if for some reason (perhaps debugging) you want to have two dtprobeds running at once.  (They will still share a state directory, so DTrace will know about all probes discovered by all running \fBdtprobed\fPs.)
+.TP
+\fB\-t\fP \fItimeout\fP
+Timeout, in seconds, for DOF reads from the parser child.  DOF that takes longer than this to parse will be discarded.  The default (5 seconds) is probably always reasonable. Setting this too low might cause legitimate DOF to be discarded: setting it too high might cause faulty DOF to block \fBdtprobed\fP, preventing registration of new probes.
+.
+.SH "ENVIRONMENT VARIABLES"
+.LP
+Ignoring internal testing-only variables, \fBdtprobed\fP itself does not accept any environment variables: but programs that talk to it (any program that contains USDT probes) do accept some.
+.TP
+\fIDTRACE_DOF_INIT_DEBUG\fP
+Output debugging messages to standard error if set (to anything).
+.TP
+\fIDTRACE_DOF_INIT_DEVNAME\fP
+The full name of the helper device to send registration requests on: by default, \fI/dev/dtrace/helper\fP. \fBdtprobed\fP is listening on the other end of this device.
+.TP
+\fIDTRACE_DOF_INIT_DISABLE\fP
+Disable DOF registration entirely.
+.
+.SH FILES
+.
+.TP
+\fI/run/dtrace/stash\fP
+Private stash of DOF.
+.TP
+\fI/run/dtrace/probes\fP
+Parsed representations of every probe.  The parsed representation is shared between
+.MR dtrace 8
+and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP should be restarted, and will regenerate any parsed DOF that is needed, so \fBdtrace\fPs started after the upgrade will still work.  (Still-running \fBdtrace\fPs from before the upgrade may become unable to see newly-added probes.)
+.
+.SH SEE ALSO
+.
+.BR dtrace (8)
+.LP
+.I Oracle Linux DTrace Guide
-- 
2.46.0.278.g36e3a12567

