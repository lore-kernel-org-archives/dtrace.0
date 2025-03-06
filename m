Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4FC142659
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792114; cv=fail; b=Xxz+aOnbN+fN7EffkwEgHy+uxdDyowseumseNN2CIGXwOwcS3dC36XoSHpGbx0s2+jKtfgj7epSC5cEeOmAJgBty3NkbNQS0tJu9FgiaqZSV5iKCgc9HeuolHSnKe6fyZQYg/cKmLRYE8l2xwvANuNiuLEch7ZkDzcft1T0ibt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792114; c=relaxed/simple;
	bh=JAvrIZpElqnjzA5nceyoRU52jWXO+fM0rbJ1Zbt5VdI=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=dgDD9khaEDzTw8mWuudQlE1lRZoYeB3ZzpDuZymEdG5Ld60WEDDYbPrXxZA6eF1QvTsFpIUX3KFeeHY79USISE1OTxaxhXNXGsoePGaZMz/V67gEkrKmOirh/GzyKIq2lxamXxpszRhNtO2B3D4dEaf3T+mO6rVE0gwAsExpmFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TLuyQcyu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IfqrDdjU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TLuyQcyu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IfqrDdjU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CCK2oc026128
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=OWVgSDuFdrznNAmFPyQz4w6rOJQ3pRplOGFnRW49AMw=; b=
	TLuyQcyurxAwGXCbGsruR2ZRWeoHiHFyXagVqsw4wzl25SS/mVHY9rlGo9sUH2Vt
	KSbGW88RPBB8TGgFCgJcNSP3dMjUKlC9Uz/H3O0T0Tp0OOZctemJvH6ShjinepiG
	KUOcdWHUVQFkLyKwoLiRzVnqAfSOdTkBtGxnEgu/6THOAl9gTwc0uxZ63W49hhS6
	EmMu0X7mYrgcQfv9qBer4AlFhgjadbR/ZwlJJSiqIs8/uN72xRZXj8aVr/pOc1PZ
	OMaWGbaGB8TC96gnq+nNMU6aYdGFhl7OXNJ1etRibxiOacJedC/jQxXANpvECcRa
	t5oCfN1MdU7THvOnSTPU5A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4dt0hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52CEWTU4002143
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:30 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45atn7dmp3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtSMle0zyozaA+yVEwDzGJLD7Azg2lwp6q5vqeHG3w32LnRQbMJQT8npPOyof0D8d7VOvNQ5M9LeY/0+XuEB88OPStXadwCUm+oSsW3haOM/sCsfoQAWoiBiIl8rmntos3XltAA+PLkfoId95QPvm3vu15KYZdI+v5rLYK6qxxxHQWwbwAwiMR4ovsL0KLZ8pJaDCIOwR0/uU0QliW+u8+f531G4L9cogbdmrGEMEhOiS8DInBwTlA69uZAEafRwmMd+wH6v3kHvHyFep/8ZIuP+OaOh0F/GRgRuI16pfNg+tJw303MLHOljvp2XyNmfH+wfvOQNy1ZEtTAhqMsXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWVgSDuFdrznNAmFPyQz4w6rOJQ3pRplOGFnRW49AMw=;
 b=AV50u9FeVpK6KUeTeO9ET43PjkGvyUZzkQeezBozxeT6KF0739YxloLFfvVHRV3N5zgvO1ySvFkUVL5TBatzpObs9pqyxUc1F32zGdLqXuaU3WV1MWWCHXFL8PoPGApPge7yqbrrsRsXfuOr8AK/d0rQJuOp6XnE7Mfq08X/HUXu3YBtUtJGvQUbwNZy4V1pVGIx2Fg+03NPPmxieH07GJj9LOwfSl0ebAGif0gH/HanbgoDxhKOXclE54X11v0LM5N5JChIwkhZE3WQxbWXMDkWBfDN83gkGHH7OfXp37fFK7R7VX/g5SrGrRuD5cBRGL0rvrc5gkxI0588jI48Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWVgSDuFdrznNAmFPyQz4w6rOJQ3pRplOGFnRW49AMw=;
 b=IfqrDdjU3tpYoIqiZixJ0ZkGixdN2NDW5ZZbLCWvrYU2lrIY8kDwucL8fMGm4SOzgSrEsb/j7hUvEmvWiEdWDLbCUwUbCmLAmFinGbHnWktpJTn/hQGMwKQPCR6w0Q+d2JIFunzMsClSn9KetRCxNn3MFXIC5qSoJZ1zHL3Xk5U=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4492.namprd10.prod.outlook.com (2603:10b6:806:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:08:23 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:08:23 +0000
Message-ID: <206f9d172e4bfcb53acf6cae86ddc77f.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Thu, 6 Mar 2025 14:03:47 -0500
Subject: [PATCH v2 8/8] fbt, rawfbt: consolidate code to avoid duplication
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c131365-2f28-4e40-7a32-08dd6177bb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4PyHTZzGbj9fxGsXt5vN/G8eNencnyfTn+fchU5x+n+rSWjQF8+nXzAfYBtD?=
 =?us-ascii?Q?S6u4iiOZh19X5f4nHM4n0+KyXiP80UjToQsjcBmPJmLmE0gv6fD3yzpfSLWi?=
 =?us-ascii?Q?NS3YMsAzVlEtoFwAFqFzwryk97enHnhni0UetDnjQH/UcIs8DVCl7dO76Z0E?=
 =?us-ascii?Q?2VfGEYgyLNxrAvCzQ1Z3DdqW9enyBi4WzK7D/XWDnMhXjuVUzNTYqHC095pz?=
 =?us-ascii?Q?Ua2cFy7YOLSLbMe0UgKBAWBgRE5Gl3JbaTkoPkkGdVxR5OkYv8QeORynNdOb?=
 =?us-ascii?Q?0G8bsnj0RaGUNzmBXBZTDlfddWo2z64A4rmHrM2B0/1jA8rxwUwShaR3/Eim?=
 =?us-ascii?Q?a7LxMvJ7/GfqMrBjTSNOrWXT4RtKgGptN2nOr8pg7VlOnaT8gBoF0n5mlm2N?=
 =?us-ascii?Q?h90Bea4h0jFVYWd0XRBoXpBamMokDaP4FWdeXXUHN+fC6VTdhUtm/oXrLB7m?=
 =?us-ascii?Q?Yj5u+H/YHKQbj/FxeEACVL2suiWzNK3SbunF+Pls/uloFp2dX0hK5KRmeHHM?=
 =?us-ascii?Q?G0P2gR2O+WuHIahOTtOTs2+cP1wLX3Cw/WCbfrQLZBjARZ44ZkOgthYJrU3S?=
 =?us-ascii?Q?QkmT8A8uVo53BW/p4N5QYf/U67qVrbYRGfBG29iOwFUI713RgIwtnH4CnYfl?=
 =?us-ascii?Q?RtoVWFTalHjzCh6lo7n9u61+0c11KEnlg5AM6q1KSotScU4L4SaaoYR62KmH?=
 =?us-ascii?Q?9h8gYCqQxXo3WmJNsQyqrNJ+6LUZ6YLnFpIdID52f0O7K4wz3kI6tt9dR+jK?=
 =?us-ascii?Q?umVMaCw57qSJR+0ISjWszs5bmI2M0YmY+W6ojnZ1/2tYzChdi8bHbah8KH/f?=
 =?us-ascii?Q?I3JZjC42HXwoezDF7/OVii+jf/EMqkCgjZI733XwEXQlGaqpXZSw2AacQfvr?=
 =?us-ascii?Q?NVNR5z3h8/hdaEkus8Y2JhuhZHTG/FwyLdV4gU9JGXzKAQ/f4XnWnXbZN+rL?=
 =?us-ascii?Q?XEujdEmz8xiD9/1P+nhOo9uig60VA+32M4NSvGb3zC88bh9P1DD7Kp5PJ2Ah?=
 =?us-ascii?Q?vdlC50oZRbi0aPmT8Sf0n5ybVzPTTkR4j4gqAS0OSQVoWlfXH38o+Aqo9A22?=
 =?us-ascii?Q?QblGsm4dYuePWnq/wlC7dK8OmEqocme/pjDDy59Md/bSFtyg5CY+iU9D9rHG?=
 =?us-ascii?Q?X1yVNogqXq4WYumgchEs315odRQZWWEUKEhcZRlmTSRRmvhU9F7mHsowCB6F?=
 =?us-ascii?Q?7dk8gWuzsnUReFXrGMs24Gf+EaQEizmJL0LJFK+Xnrhm5g86JbiVP2ttNlHO?=
 =?us-ascii?Q?B230QgGK6s1mNejxwdneowRm+MIjjBE2/VYzwuC2hsOsZ7uR5wmVT6cZV/nr?=
 =?us-ascii?Q?+NCWHHxaXXBGNYh2hxGKQJGaOfMx1omtbl+JC4KOfUYni/1lLHOZfb2u7j3l?=
 =?us-ascii?Q?bUflsQUVorw9Es7RDyvG0pHnMHDs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JX35CUNX2O7DJGyO17J9f8nNMIooL/t4ONEWfUI2U/p06+uuAfuOiSzgdpnf?=
 =?us-ascii?Q?x7M+FePA4tOkvHPvSzSnMkYyDXeXLcMGHNDvX/q6o/5LN6UWl8Yl6ytMShNd?=
 =?us-ascii?Q?nSUEzHC21CJ9NuvauHhHIHH6r854saGM4HW1Dj8GrzgZYfyHoypDLnxObqgr?=
 =?us-ascii?Q?fxLjkxmvPwAGEF/SiEa+hUSMcjttF6PC6qFuD15SER+5KovWzzetAPB6+xO5?=
 =?us-ascii?Q?YhFut1bdMhoE3wRNxVoc0Rb14U61xQNhCa8Ld45/ZK1FdWnlkhpY/GFbMC/w?=
 =?us-ascii?Q?7VLCK5aMne/FpyHma9kqaqfU50p1u2acBfOwSmiseFgRedEwNF4LB2+Pw+20?=
 =?us-ascii?Q?LFOUXohXudDRaznij+/xfxYrZQog0MF8q7XIPf0qlMB9yS+YMoak2cDBWDBm?=
 =?us-ascii?Q?/MX9uRGLXGfzyRCBG6sHmLFgmDj1LjICeUL+2lGnhxgNX3rii4+HCUUgMZg+?=
 =?us-ascii?Q?kBWnm79K8FQ6olS3TsDlj0juvAJBTUEI9lKegLr+WzrQFMzY/oexNaTK8Q3S?=
 =?us-ascii?Q?K5WwDm6I7+g1IFtlFHK5aG6TGtix+N1XTIFtJWrfAS3Kqx9ioZYHTvtPknea?=
 =?us-ascii?Q?kUjUixEQKMngYjXngpu0+kby1e8Ro+lqRb/nJ+g8ypGiutlnk2Yzmkz2Npf+?=
 =?us-ascii?Q?OhL+MRKk+BIUpeyswRw3SIVRyZ9aO5r5qbUhHvkNSNY/igQRsZQJ9fgyn4/Y?=
 =?us-ascii?Q?woONd4aHQLGSn8gl+ifgUfAoS129I/3Kn86KrzITvwZRM+udDKpKLLQBgHeX?=
 =?us-ascii?Q?DaQoo/kfX44uc/F5ktWHCwmH6ityaHmeP3hDc4J1unJJmOFcTaQRgbh3DzYW?=
 =?us-ascii?Q?lMGUnctWIGQa14TSVxH8IlZd7tCZJ3sWOOlDrfUUr8sMg1vNVmlJsHWNl6dz?=
 =?us-ascii?Q?nXUq1lA842+OdPPWLnhmkuv6y3yblGZSY7/2ua+VWDXSsR5Dr5zRhcvPf55K?=
 =?us-ascii?Q?adQ7nNCnSUMSddTec/HALWRP7I2NoBZTrY90y8aU4brodsZ0BPh7yZ5VkSCe?=
 =?us-ascii?Q?NRcl8IDnSH5jLi18r/kzqYyM8RmAFxDyE8W3okojEsvcxtK46tUcOAZsKfed?=
 =?us-ascii?Q?77iFWBFXRZzjH4tUUDuytDPMUZlTZ+FspvzMh6c8OHHtOIT4jHBYZoz4HJQP?=
 =?us-ascii?Q?cl8hcBrmfgQWDv/cppmGRrr3bL1i2Wx1Z7NTNgQPSZETqXr8SBa7HHuMU0j1?=
 =?us-ascii?Q?riJCH7b+7C3uNnDoCrsvWY/h2uvNDNGP16IQpuXWrWtkUFpyCJiRKM4fJg/K?=
 =?us-ascii?Q?8QktT+xEgOusqcafV5HkYjAEWppe4kdjOKuWHV6zrUF/316xrDwrh9ncDkD/?=
 =?us-ascii?Q?5kq7RRMXLQYnmwMRVzrT7YZ4y4Vkav7YHAWUWj8JI9RIUcCApTEtKxDMnpgH?=
 =?us-ascii?Q?AUoWQTU7yUanqgBX/uwCufLw/Q7qcjVixsCFCCjYwh++/Y+BJRZbh7swF4z8?=
 =?us-ascii?Q?do6h/tQekNBFmAhGbDOK5W8PX9NfuirDCnIZOcdXY1jy3UxQhAsJK+O7foUQ?=
 =?us-ascii?Q?UUM2Qxz/4KvvyBPLfsB8QpxG8F7i50Aejd0GuceUMDupTEkqPRezFjwRLjUv?=
 =?us-ascii?Q?TFnDT64YVPAcKKT/t/58SwGgoiTFSXDK4pU3YkjFDFFTzdTbz/78agG7ThJ3?=
 =?us-ascii?Q?yMjVmonjUIk2pKCn0QJLXBo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7JphTwHFxIX8KlZVoPu1YoX5+G9LN7JkuuRUPp5hEUwFF/xcDT/ixPjIp/gE6ZlNdw0ZhNDTZV8s2DA7FEMzHYzb2QUssEX7STrCWYx/wjoNyaZ/evKs2LAQ2yNvGgwPAA3H2peWXRl0e6ZLoFHPkOO4Sdpci33SdKTZzbZRjkxpYc9VNZARsygyzQL+b+fbg3ZYA8b+vxW9ajDsfSdNSIhX1ISfPEUT6dZqv19NhyR8zlURpIQTUxkl1rW0rjCjZW38oGj9En2UvkbRyF6uZ75JNXB64tY9ddRit9vTEn0K+xncac3opZlJOFNYX1mTYYd6F1Wg4ysrGoUiNj1QuvTs0ZCkBSGZYQTKmJMsN2nQLCMNG37U1TUT3W/Njr8Fu/Bf2wK9OBtKbxO7NVyn4trUJfeHTuH1x4RhuXDPfLsUMNVn5iTvu8hvu78ij6wDkm7f3GRr70Zrp/xCNz0bG1z7BNMPsp/Y6KeB7bficYGqzfnay+ckILTR8QSrFF+KSXEyPCkYjSVfZgSOZVbhzxK9HJv1258Jdko349U/iz3s6TjFy4onqU7o0HQr75tyB1cmm/u6gLGDahzZLDFmpn5J3I03htghwnurzw0cWj8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c131365-2f28-4e40-7a32-08dd6177bb55
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:08:22.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MK/BI1erH+GQdJpYRXcQi8Hmd4o+s4lW3pWAhoRugJRBPQGkVTHmR+3N+SZzLZcq/UNgrSeRS7Xcd8EI1c/UjGonFHJOu6koZjyJtGlI1K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503120103
X-Proofpoint-GUID: ArWzvHY2EvYW6n1qDbTjfivgEGgZvbno
X-Proofpoint-ORIG-GUID: ArWzvHY2EvYW6n1qDbTjfivgEGgZvbno

After optimizing both fbt and rawfbt providers, the resulting code has
a significant amount of duplication.  The rawfbt provider can now be
defined in terms of the kprobe-based fbt provider functions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build            |   1 -
 libdtrace/dt_prov_fbt.c    | 139 +++++++++----
 libdtrace/dt_prov_rawfbt.c | 386 -------------------------------------
 3 files changed, 102 insertions(+), 424 deletions(-)
 delete mode 100644 libdtrace/dt_prov_rawfbt.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 51e0f078..7e6e8a38 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -55,7 +55,6 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_lockstat.c \
 			  dt_prov_proc.c \
 			  dt_prov_profile.c \
-			  dt_prov_rawfbt.c \
 			  dt_prov_rawtp.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 827156cc..1489275a 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -6,17 +6,26 @@
  *
  * The Function Boundary Tracing (FBT) provider for DTrace.
  *
- * FBT probes are exposed by the kernel as kprobes.  They are listed in the
- * TRACEFS/available_filter_functions file.  Some kprobes are associated with
- * a specific kernel module, while most are in the core kernel.
+ * Kernnel functions can be traced through fentry/fexit probes (when available)
+ * and kprobes.  The FBT provider supports both implementations and will use
+ * fentry/fexit probes if the kernel supports them, and fallback to kprobes
+ * otherwise.  The FBT provider does not support tracing synthetic functions
+ * (i.e. compiler-generated functions with a . in their name).
+ *
+ * The rawfbt provider implements a variant of the FBT provider and always uses
+ * kprobes.  This provider allow tracing of synthetic function.
  *
  * Mapping from event name to DTrace probe name:
  *
  *	<name>					fbt:vmlinux:<name>:entry
  *						fbt:vmlinux:<name>:return
+ *						rawfbt:vmlinux:<name>:entry
+ *						rawfbt:vmlinux:<name>:return
  *   or
  *	<name> [<modname>]			fbt:<modname>:<name>:entry
  *						fbt:<modname>:<name>:return
+ *						rawfbt:<modname>:<name>:entry
+ *						rawfbt:<modname>:<name>:return
  */
 #include <assert.h>
 #include <errno.h>
@@ -57,18 +66,19 @@ static const dtrace_pattr_t	pattr = {
 
 dt_provimpl_t			dt_fbt_fprobe;
 dt_provimpl_t			dt_fbt_kprobe;
+dt_provimpl_t			dt_rawfbt;
 
 /*
- * Create the fbt provider.
+ * Create the fbt and rawfbt providers.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
-	dt_provider_t		*prv;
-
 	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
-	if (prv == NULL)
+	if (dt_provider_create(dtp, dt_fbt.name, &dt_fbt, &pattr,
+			       NULL) == NULL ||
+	    dt_provider_create(dtp, dt_rawfbt.name, &dt_rawfbt, &pattr,
+			       NULL) == NULL)
 		return -1;			/* errno already set */
 
 	return 0;
@@ -102,13 +112,12 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 {
 	int			n = 0;
 	int			prb = 0;
+	int			rawfbt = 0;
 	dt_module_t		*dmp = NULL;
 	dt_symbol_t		*sym = NULL;
 	dt_htab_next_t		*it = NULL;
 	dtrace_probedesc_t	pd;
 
-	dt_modsym_mark_traceable(dtp);
-
 	/*
 	 * Nothing to do if a probe name is specified and cannot match 'entry'
 	 * or 'return'.
@@ -120,9 +129,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	if (prb == 0)
 		return 0;
 
-	/* Synthetic function names are not supported for FBT. */
-	if (strchr(pdp->fun, '.'))
-		return 0;
+	/*
+	 * Unless we are dealing with a rawfbt probe, synthetic functions are
+	 * not supported.
+	 */
+	if (strcmp(pdp->prv, dt_rawfbt.name) != 0) {
+		if (strchr(pdp->fun, '.'))
+			return 0;
+	} else
+		rawfbt = 1;
 
 	/*
 	 * If we have an explicit module name, check it.  If not found, we can
@@ -134,6 +149,14 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 			return 0;
 	}
 
+	/*
+	 * Ensure that kernel symbols that are FBT-traceable are marked as
+	 * such.  We don't do this earlier in this function so that the
+	 * preceding tests have the greatest opportunity to avoid doing this
+	 * unnecessarily.
+	 */
+	dt_modsym_mark_traceable(dtp);
+
 	/*
 	 * If we have an explicit function name, we start with a basic symbol
 	 * name lookup.
@@ -205,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 		/* Function name cannot be synthetic and must match. */
 		fun = dt_symbol_name(sym);
-		if (strchr(fun, '.') || !dt_gmatch(fun, pdp->fun))
+		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
 			continue;
 
 		/* Validate the module name. */
@@ -396,12 +419,12 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 \*******************************/
 
 /*
- * Generate a BPF trampoline for a FBT probe.
+ * Generate a BPF trampoline for a FBT (or rawfbt) probe.
  *
  * The trampoline function is called when a FBT probe triggers, and it must
  * satisfy the following prototype:
  *
- *	int dt_fbt(dt_pt_regs *regs)
+ *	int dt_(raw)fbt(dt_pt_regs *regs)
  *
  * The trampoline will populate a dt_dctx_t struct and then call the function
  * that implements the compiled D clause.  It returns 0 to the caller.
@@ -422,7 +445,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		dt_cg_tramp_copy_rval_from_regs(pcb);
 
 		/*
-		 * fbt:::return arg0 should be the function offset for
+		 * (raw)fbt:::return arg0 should be the function offset for
 		 * return instruction.  Since we use kretprobes, however,
 		 * which do not fire until the function has returned to
 		 * its caller, information about the returning instruction
@@ -441,11 +464,28 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
+	const char	*fun = prp->desc->fun;
+	char		*tpn = (char *)fun;
+	int		rc = -1;
+
 	if (!dt_tp_probe_has_info(prp)) {
 		char	*fn;
 		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		int	fd;
+
+		/*
+		 * For rawfbt probes, we need to apply a . -> _ conversion to
+		 * ensure the tracepoint name is valid.
+		 */
+		if (strcmp(prp->desc->prv, dt_rawfbt.name) == 0) {
+			char	*p;
+
+			tpn = strdup(fun);
+			for (p = tpn; *p; p++) {
+				if (*p == '.')
+					*p = '_';
+			}
+		}
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
@@ -453,41 +493,42 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		 */
 		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd == -1)
-			return -ENOENT;
+			goto out;
 
 		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
+			     FBT_GROUP_DATA, tpn, fun);
 		close(fd);
 		if (rc == -1)
-			return -ENOENT;
+			goto out;
 
 		/* create format file name */
-		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
-			return -ENOENT;
-
-		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
+		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+			     FBT_GROUP_DATA, tpn) == -1)
+			goto out;
 
 		/* open format file */
 		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		free(fn);
 		if (f == NULL)
-			return -ENOENT;
+			goto out;
 
 		/* read event id from format file */
 		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
-			return -ENOENT;
+			goto out;
 	}
 
 	/* attach BPF program to the probe */
-	return dt_tp_probe_attach(dtp, prp, bpf_fd);
+	rc = dt_tp_probe_attach(dtp, prp, bpf_fd);
+
+out:
+	if (tpn != prp->desc->fun)
+		free(tpn);
+
+	return rc == -1 ? -ENOENT : rc;
 }
 
 /*
@@ -503,7 +544,8 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
  */
 static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
-	int		fd;
+	int	fd;
+	char	*tpn = (char *)prp->desc->fun;
 
 	if (!dt_tp_probe_has_info(prp))
 		return;
@@ -514,9 +556,20 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 	if (fd == -1)
 		return;
 
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
-		prp->desc->fun);
+	if (strcmp(prp->desc->prv, dt_rawfbt.name) == 0) {
+		char	*p;
+
+		for (p = tpn; *p; p++) {
+			if (*p == '.')
+				*p = '_';
+		}
+	}
+
+	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
 	close(fd);
+
+	if (tpn != prp->desc->fun)
+		free(tpn);
 }
 
 dt_provimpl_t	dt_fbt_fprobe = {
@@ -549,3 +602,15 @@ dt_provimpl_t	dt_fbt = {
 	.name		= prvname,
 	.populate	= &populate,
 };
+
+dt_provimpl_t	dt_rawfbt = {
+	.name		= "rawfbt",
+	.prog_type	= BPF_PROG_TYPE_KPROBE,
+	.populate	= &populate,
+	.provide	= &provide,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &kprobe_trampoline,
+	.attach		= &kprobe_attach,
+	.detach		= &kprobe_detach,
+	.probe_destroy	= &dt_tp_probe_destroy,
+};
diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
deleted file mode 100644
index ebcd1a16..00000000
--- a/libdtrace/dt_prov_rawfbt.c
+++ /dev/null
@@ -1,386 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- *
- * The Raw Function Boundary Tracing provider for DTrace.
- *
- * The kernel provides kprobes to trace specific symbols.  They are listed in
- * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
- * a symbol in the core kernel or with a symbol in a specific kernel module.
- * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
- * provider also provides access to synthetic symbols, i.e. symbols created by
- * compiler optimizations.
- *
- * Mapping from event name to DTrace probe name:
- *
- *	<name>					rawfbt:vmlinux:<name>:entry
- *						rawfbt:vmlinux:<name>:return
- *   or
- *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
- *						rawfbt:<modname>:<name>:return
- */
-#include <assert.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <linux/bpf.h>
-#include <linux/btf.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-
-#include <bpf_asm.h>
-
-#include "dt_btf.h"
-#include "dt_dctx.h"
-#include "dt_cg.h"
-#include "dt_module.h"
-#include "dt_provider_tp.h"
-#include "dt_probe.h"
-#include "dt_pt_regs.h"
-
-static const char		prvname[] = "rawfbt";
-
-#define KPROBE_EVENTS		TRACEFS "kprobe_events"
-
-#define FBT_GROUP_FMT		GROUP_FMT "_%s"
-#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
-
-static const dtrace_pattr_t	pattr = {
-{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
-{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
-};
-
-/*
- * Create the rawfbt provider.
- */
-static int populate(dtrace_hdl_t *dtp)
-{
-	dt_provider_t		*prv;
-
-	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
-	if (prv == NULL)
-		return -1;			/* errno already set */
-
-	return 0;
-}
-
-/* Create a probe (if it does not exist yet). */
-static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
-{
-	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
-
-	if (prv == NULL)
-		return 0;
-	if (dt_probe_lookup(dtp, pdp) != NULL)
-		return 0;
-	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
-		return 1;
-
-	return 0;
-}
-
-/*
- * Try to provide probes for the given probe description.  The caller ensures
- * that the provider name in probe desxcription (if any) is a match for this
- * provider.  When this is called, we already know that this provider matches
- * the provider component of the probe specification.
- */
-#define FBT_ENTRY	1
-#define FBT_RETURN	2
-
-static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
-{
-	int			n = 0;
-	int			prb = 0;
-	dt_module_t		*dmp = NULL;
-	dt_symbol_t		*sym = NULL;
-	dt_htab_next_t		*it = NULL;
-	dtrace_probedesc_t	pd;
-
-	dt_modsym_mark_traceable(dtp);
-
-	/*
-	 * Nothing to do if a probe name is specified and cannot match 'entry'
-	 * or 'return'.
-	 */
-	if (dt_gmatch("entry", pdp->prb))
-		prb |= FBT_ENTRY;
-	if (dt_gmatch("return", pdp->prb))
-		prb |= FBT_RETURN;
-	if (prb == 0)
-		return 0;
-
-	/*
-	 * If we have an explicit module name, check it.  If not found, we can
-	 * ignore this request.
-	 */
-	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
-		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
-		if (dmp == NULL)
-			return 0;
-	}
-
-	/*
-	 * If we have an explicit function name, we start with a basic symbol
-	 * name lookup.
-	 */
-	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
-		/* If we have a module, use it. */
-		if (dmp != NULL) {
-			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
-			if (sym == NULL)
-				return 0;
-			if (!dt_symbol_traceable(sym))
-				return 0;
-
-			pd.id = DTRACE_IDNONE;
-			pd.prv = pdp->prv;
-			pd.mod = dmp->dm_name;
-			pd.fun = pdp->fun;
-
-			if (prb & FBT_ENTRY) {
-				pd.prb = "entry";
-				n += provide_probe(dtp, &pd);
-			}
-			if (prb & FBT_RETURN) {
-				pd.prb = "return";
-				n += provide_probe(dtp, &pd);
-			}
-
-			return n;
-		}
-
-		sym = dt_symbol_by_name(dtp, pdp->fun);
-		while (sym != NULL) {
-			const char	*mod = dt_symbol_module(sym)->dm_name;
-
-			if (dt_symbol_traceable(sym) &&
-			    dt_gmatch(mod, pdp->mod)) {
-				pd.id = DTRACE_IDNONE;
-				pd.prv = pdp->prv;
-				pd.mod = mod;
-				pd.fun = pdp->fun;
-
-				if (prb & FBT_ENTRY) {
-					pd.prb = "entry";
-					n += provide_probe(dtp, &pd);
-				}
-				if (prb & FBT_RETURN) {
-					pd.prb = "return";
-					n += provide_probe(dtp, &pd);
-				}
-
-			}
-			sym = dt_symbol_by_name_next(sym);
-		}
-
-		return n;
-	}
-
-	/*
-	 * No explicit function name.  We need to go through all possible
-	 * symbol names and see if they match.
-	 */
-	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
-		dt_module_t	*smp;
-		const char	*fun;
-
-		/* Ensure the symbol can be traced. */
-		if (!dt_symbol_traceable(sym))
-			continue;
-
-		/* Match the function name. */
-		fun = dt_symbol_name(sym);
-		if (!dt_gmatch(fun, pdp->fun))
-			continue;
-
-		/* Validate the module name. */
-		smp = dt_symbol_module(sym);
-		if (dmp) {
-			if (smp != dmp)
-				continue;
-		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
-			continue;
-
-		pd.id = DTRACE_IDNONE;
-		pd.prv = pdp->prv;
-		pd.mod = smp->dm_name;
-		pd.fun = fun;
-
-		if (prb & FBT_ENTRY) {
-			pd.prb = "entry";
-			n += provide_probe(dtp, &pd);
-		}
-		if (prb & FBT_RETURN) {
-			pd.prb = "return";
-			n += provide_probe(dtp, &pd);
-		}
-	}
-
-	return n;
-}
-
-/*
- * Generate a BPF trampoline for a FBT probe.
- *
- * The trampoline function is called when a FBT probe triggers, and it must
- * satisfy the following prototype:
- *
- *	int dt_rawfbt(dt_pt_regs *regs)
- *
- * The trampoline will populate a dt_dctx_t struct and then call the function
- * that implements the compiled D clause.  It returns 0 to the caller.
- */
-static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
-{
-	dt_cg_tramp_prologue(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-	dt_cg_tramp_copy_regs(pcb);
-	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
-		dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-		dt_cg_tramp_copy_rval_from_regs(pcb);
-
-		/*
-		 * fbt:::return arg0 should be the function offset for
-		 * return instruction.  Since we use kretprobes, however,
-		 * which do not fire until the function has returned to
-		 * its caller, information about the returning instruction
-		 * in the callee has been lost.
-		 *
-		 * Set arg0=-1 to indicate that we do not know the value.
-		 */
-		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
-		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-	} else
-		dt_cg_tramp_copy_args_from_regs(pcb, 1);
-	dt_cg_tramp_epilogue(pcb);
-
-	return 0;
-}
-
-static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
-{
-	char	*prb = NULL;
-
-	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn, *p;
-		FILE	*f;
-		int	fd, rc = -1;
-
-		/*
-		 * The tracepoint event we will be creating needs to have a
-		 * valid name.  We use a copy of the probe name, with . -> _
-		 * conversion.
-		 */
-		prb = strdup(prp->desc->fun);
-		for (p = prb; *p; p++) {
-			if (*p == '.')
-				*p = '_';
-		}
-
-		/*
-		 * Register the kprobe with the tracing subsystem.  This will
-		 * create a tracepoint event.
-		 */
-		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
-		if (fd == -1)
-			goto fail;
-
-		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
-			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prb, prp->desc->fun);
-		close(fd);
-		if (rc == -1)
-			goto fail;
-
-		/* create format file name */
-		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			     FBT_GROUP_DATA, prb) == -1)
-			goto fail;
-
-		/* open format file */
-		f = fopen(fn, "r");
-		free(fn);
-		if (f == NULL)
-			goto fail;
-
-		/* read event id from format file */
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
-		fclose(f);
-
-		if (rc < 0)
-			goto fail;
-
-		free(prb);
-	}
-
-	/* attach BPF program to the probe */
-	return dt_tp_probe_attach(dtp, prp, bpf_fd);
-
-fail:
-	free(prb);
-	return -ENOENT;
-}
-
-/*
- * Try to clean up system resources that may have been allocated for this
- * probe.
- *
- * If there is an event FD, we close it.
- *
- * We also try to remove any kprobe that may have been created for the probe.
- * This is harmless for probes that didn't get created.  If the removal fails
- * for some reason we are out of luck - fortunately it is not harmful to the
- * system as a whole.
- */
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-{
-	int	fd;
-	char	*prb, *p;
-
-	if (!dt_tp_probe_has_info(prp))
-		return;
-
-	dt_tp_probe_detach(dtp, prp);
-
-	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
-	if (fd == -1)
-		return;
-
-	/* The tracepoint event is the probe nam, with . -> _ conversion. */
-	prb = strdup(prp->desc->fun);
-	for (p = prb; *p; p++) {
-		if (*p == '.')
-			*p = '_';
-	}
-
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, prb);
-	free(prb);
-	close(fd);
-}
-
-dt_provimpl_t	dt_rawfbt = {
-	.name		= prvname,
-	.prog_type	= BPF_PROG_TYPE_KPROBE,
-	.populate	= &populate,
-	.provide	= &provide,
-	.load_prog	= &dt_bpf_prog_load,
-	.trampoline	= &trampoline,
-	.attach		= &attach,
-	.detach		= &detach,
-	.probe_destroy	= &dt_tp_probe_destroy,
-};
-- 
2.45.2

