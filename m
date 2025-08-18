Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E111990C7
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755555605; cv=fail; b=EUAFkahPelKmqEsN2sD8qpgU8MpfZ1WvNG1LKVFVsvLw6RbupsBdnZqLtVPWvmIBhAXs/tblcanfSI62RlZbbVBsp8STN68LyoZJdWci1eNUQWXX1BG/04Nlkuht0nONqk42LsajiZuSjI/QbmmXYAesIpq2GAqSIveNfMwTvZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755555605; c=relaxed/simple;
	bh=SDTVIP0siNpfHWfSEjuO+eUuUwzjI2CJmXyjHBBlVE0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=lVTsB83fF2iGyCO+dZD/q18v2f139mx88RKmQ76uCxWtp5xicXbZkMjTUYMl1KdPFG1oHoH1CwmnmN+0vf3l538AihWP7iT6as4C6UXQ7StJFLGMsRWrXPsnuxLiXiWsxo/cbc2qj6vmPLQeMKv5LpFDbV532DQVeh+91VGcZek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B1b04O86; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VXvsTWaB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B1b04O86";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VXvsTWaB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgdvN019692
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ZbmDyGdZ2KrdEpDavGyWZNk4FGH/gByBpjtX7zVJ9ZM=; b=
	B1b04O86mspcujLqLKOsYMxwlM/fyqaryGGJVFcpfSGHSH0TZPdSiBJWyr6yUOA3
	9u7tCutM92aUFG3qIXATK9s/ssD3WGnhl84ZUpRhr9giiXvI/mYn15Tdz1UH9p8L
	HJTWXcZNRK8C772kCN290ux37M0D1B+yf7CsbYz1UvI7e67Dq1agGQ82OSBk1+V+
	LNauRkaPD96AV2mwdlbZo1k7o/aTBkXJs0okdBUxGqBf58XmffovuHH/e8wy2C/t
	pDT0KX8lkpGel9cmjVuX4pBFeoQAfwc/kirOYqL8fXL5xjTXWUGUe4tjBmEXpozQ
	aLT04GBL7mYz6iXQA20yBw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgdfm321-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:19:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IM03Is010447
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:19:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9vf2j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:19:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtodESKzBkAlTM6zytQGqrXY1b2S4GFvrxnEKNc6TzRmp2BNiFmWLO3YTT+QkayoQrh585UX5BPdateWfK8RMHLRTi9CRJZQUpdwKpTv71Wd+1HiHtaOT6TCN/Wyh8F0Xa+5R5qHSU2ZC8kgxUraA6a51Q9z2i4vF18oM4yM22C1wgTcQauaiLeBnBvbilH+3dFZkZYZ23cd9Vrx8w/BYu0zESCgeEA6QEMCcS9kRp9SeCG5wzoCgw+S5Exv1m+sEByma0ZijiGTRpj/5ek6rew0EKVuVPV1bsm1YyP5D5pSnr437wz1EteweWOJgQ0snT7huqL8wQUDlQnWHyKb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbmDyGdZ2KrdEpDavGyWZNk4FGH/gByBpjtX7zVJ9ZM=;
 b=dujpvCI2rBwVg/TdzRoDptYC/71Tsu65UtnqnLms45wO2yS26iWQk1aSD3U5wP66LJw2HcDVjQeOFjrGAi5wtN7g/RyyCbYuA0+p6ytIqEe0uhvJF3NEK1uXGKl6xYZ+l2le0efK5NyMfKCXqsT+ctIJ32M8PcJzUJY+a7DyiniCPqq8L68FTcNEyhxQiJCyST9WVX4V84euJkMBwhgwLIO03qivBzKLWMtcJ3xPLwXlqT2K6HjqUaswxFKzgWWhUnWZjGF361eDYyHNkzBUwRUqOTnxdiJt0C/W4FCZ0kJroGRITP1b66RfDXZ5VgWlewfEGC6RK6BrvTgAds6/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbmDyGdZ2KrdEpDavGyWZNk4FGH/gByBpjtX7zVJ9ZM=;
 b=VXvsTWaBNHOZm6LzCmfXbErKbQqs9lVsRvblyDBOz1iCLgiWigIa5zLpU9qVIxr3330iEPKOCmvck4v7cJr0Tqj1P7HV2+HxahN1jsC8GCCVMpI+07pwpHQxrFtOIEnxYulYGOBLuQyd71vkLYaVg+dMlKn86A6GgdwrSeH0ySc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA6PR10MB8111.namprd10.prod.outlook.com (2603:10b6:806:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 18 Aug
 2025 22:19:55 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 22:19:55 +0000
Date: Mon, 18 Aug 2025 18:19:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] Refactor the versioning handling system (consolidate
 data)
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56724CACC51FD1E9D4D7D84CC231A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA6PR10MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd2ca7f-311b-4138-a490-08dddea55bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4tzoTUmIpDg1BwsdfwgSwYvqCbh7cRa9PE5qSc4pq40TciEMnadrX+rdpIj4?=
 =?us-ascii?Q?HFcZBFs1dM16dmMWnHFw3/T9WK7G1CPKKbOKzwLc1sy3pI863PhzzWAAgfar?=
 =?us-ascii?Q?RU1QhHn2eqVRkx6rJtmJr0qOmSXgIJIRAvhurdWfJfJMLc9kghwG5L0pUVya?=
 =?us-ascii?Q?yC2SndNH87trPAoAAYOobZMozpese6Y5IRdxjz2S/vTtn7k4WfdmXPJqj7Mk?=
 =?us-ascii?Q?trgCYgX8+x6LkdLxsCp8WJDOJTNq1/bfmYQYgQaNTeeCXhmVWXgqbNwUS8f4?=
 =?us-ascii?Q?AqJr1+0I9kcR1zO/75RAXVe4M/LRMve4bsBa68EoA2wgwGe0KkgSyreH8sWa?=
 =?us-ascii?Q?Xp1tZNn0TWMRhUpTeXY0DJi11KaeHEDi8/muTU4pXVaA3ExG9A0BL9/de671?=
 =?us-ascii?Q?dtyjbF6xxG5/QVW82vAy9loTH6V3ZpoXdjOtjjBwkGOcXo48K/WmLlL+E6jV?=
 =?us-ascii?Q?KcIdA/kml3R5zZQPRvzHOfMBL9Nc+DUT78J1FgYFyAufserrfL/q3XrIzUFc?=
 =?us-ascii?Q?at5DA0CaiUdGGVctIg9D72jp7zu+dM/35LMK8e5Hyc3xSeWT97g5Ztw63gyW?=
 =?us-ascii?Q?SOohCuG/vzX2G3HPJtsdTMX94yt7FX48srGrkK/KBitXE5L7PqpEkjzDWQMK?=
 =?us-ascii?Q?2xC0nMt7BiG5UnfBKzLVaRTPcWW3XINQ09X1IkrgGWLSDvTuNcgpznlKzwtk?=
 =?us-ascii?Q?UBCrElyA7X/c4i3cPan/BM9PCTlsnVgl4rDBmWZZjQTZzt90IpxvLZUqFWjC?=
 =?us-ascii?Q?RK9J3gYI6deR1W2jqEeaeYQz1NR2/U9KSj24Gv46Xj8ZhfRIigkva6BeFwJI?=
 =?us-ascii?Q?u1A+dojZYADkfMeTVcWmDI90XTxqvvx/t79TH8o5u18QNPbXHWZARCOhoE/Q?=
 =?us-ascii?Q?un6EIsixulxjHolkSQtO6bVM2J5eUXsDPdbMJSEdyKjjDjE74PQyqoaQsaC8?=
 =?us-ascii?Q?rJL2g4EtbVuAViMMYcxx8iD+qGa4V187Qo+JN+I6QcU7iqNdDHAfuk8KAOxs?=
 =?us-ascii?Q?YO4ouO7eJW0zRLejmA2L51qSrU2VsVM+37YbRAU9UzysQYU/zL/CyfxS/5Bt?=
 =?us-ascii?Q?82s8TBPqwqiEo9NnQYnOjCdP3X49bCCQfEZWhc0Ma6dTV8XXUemNNtRCD8Ai?=
 =?us-ascii?Q?SYLsOu6u75VcGK1WJMKlf1ZRcYSU5aVqE6JJ9Bj84GYLZHefCFsegeyES5ds?=
 =?us-ascii?Q?PHrGiTzsJ5jKeH43fA5qr4NdoXOdP6FRWa3SuRfMM3xdSKEaoASUssS+N7pr?=
 =?us-ascii?Q?5WcJukUnZzAtsgUe8rYySsMoVrXsJKtkbU4agyBTkezsyLyGqZXJaJ2oelOZ?=
 =?us-ascii?Q?nPsVFD+N/95eMi7G/CZvXmZQSfIChoL7t3IcBs1bslzqW7cSJqbxWP6bgS3I?=
 =?us-ascii?Q?/8djBDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YxMYK7BHTCeajM2G4iGNzFjxSofhejUzX62P5/LcM4VPlQzV1eEvh3o3RMIR?=
 =?us-ascii?Q?vRI6Q/YnxLzXrgoIyR6SgRWwdoPSdeABq942j9aNPXUevwtI1aLOcvtEd80q?=
 =?us-ascii?Q?WFaPpB7Te20fY8K4vqLbP4t5ELAcTMrgI1gAnDpndS/LGqgie8RCth81fSzb?=
 =?us-ascii?Q?HGAzxv2LVgDjV6udD4XkVkycwb3qNSr7+vPpc4zdWmB2guVwsnZaLC4Bo2oQ?=
 =?us-ascii?Q?p7Ab9msR9AxqAC2USR9YM2/fsGf4bmkAnXMDfGvH1LNGEkhGJUSW/im4P3eb?=
 =?us-ascii?Q?b2eGSjSsEOxwkTC2wnqWvQLetjIR3kNor3BOu5VhcGxBl36ljl/JvU0KBpgc?=
 =?us-ascii?Q?kZyGhjhJdDQPj1m90eLGhiWKthFAPqAfJ6RH2SutqlN2yOgoHmk+EFauyt2Z?=
 =?us-ascii?Q?L3b72ISd1fh3VbPrsUrpMk3k6ZW/4Jls5xNMRbb8URHLjxcGPiHoYZntQos/?=
 =?us-ascii?Q?7yoUZCLDQWovP0ZWx5MEVNU1fYQJ2Pc7WXA989pCNko8yARPahJDwOd/dMUz?=
 =?us-ascii?Q?BWC0KpWSKK9SjKjRXDI895AX/5krS6BZ/4LCeuHvCDsWXu0xOFeXIVJYmDqa?=
 =?us-ascii?Q?ByJzfgxvF9hGEa+1bCqU00tb0Vw6ElZea4ET4rS8Ea81mF+iKHUBoSr6QnUy?=
 =?us-ascii?Q?A0oqmilhbsTI0F9vw75bjY/PswSsXoOhRYtetMjkR+mwxVV1u9LpjkcYBkyn?=
 =?us-ascii?Q?zEBkeer+VPNPidH68AmDQ1CeSC/K3dR0XnXNcgDAPm7Cgc/+mJnh/dHtYKAo?=
 =?us-ascii?Q?y1tZ8Sx8IL3zkxdXabByoeF3vOlUcWChjYEuisMbxDT91XU919kRyl1Z4Pso?=
 =?us-ascii?Q?BvgVzv1uJaJyWyUBd7fv7upDiH0Bl/6mxRWqA62S7P0sBunqWv6EqrPuBLMk?=
 =?us-ascii?Q?48+lLL5PmISKgy3LjMLFTW7o7v6SfPK7DUtKvLXjwTQIRe2hN9uw9dfsxAMg?=
 =?us-ascii?Q?zq4klVm1Bz4zQqQHZJtilCzH4xAYNMVWtV5PpXZWtxxjVZHCb9qurh1QDKM4?=
 =?us-ascii?Q?yQviG7NnjAVCGo8bxmxTFDTepvFA90EYzwZ1P8Mpq6xyMbgMljntN8P/3LXI?=
 =?us-ascii?Q?hRT404IOuAbBkTC4AZ0xSsF6SE8IHq1RDt5hzu5pg90mXAdZocZ6pUOJHfvM?=
 =?us-ascii?Q?VKKouURkdku+LG1red+gxvuaVNmWnU/lFgykkaad0A9xCwvibmSAlfDFaP2u?=
 =?us-ascii?Q?pjrGvV3mBRPP7ZWGXMqeKTyRhLnLWmCmfKyvH/pqzkjenx94IU4Jb+qOGgHw?=
 =?us-ascii?Q?iibTUd0BgaWUL0hwctInkNZKaJBMw8ybqgR5FNFlz5Vs6ezUDkB2Rtfl9Ijy?=
 =?us-ascii?Q?jIhaAAgID6/nwBisrEsIBzp5CD1nbsv0YEE5AR7T6AGVVjnKwqYmzycNvy/Z?=
 =?us-ascii?Q?0YN8EnrIqaa2t3VxtXUuc5/TjeQci/ii+vAoXyq9TRABj+teWYWPK68rS9i6?=
 =?us-ascii?Q?R1nMpH9i49Gdl83Yl28P0eldM8LRHSEfB8rZnFcDDlDXuxZt+f/078lOvMf/?=
 =?us-ascii?Q?RzbKXzyGdV8ibkucjzokp/mh1RIzZk0xKUqf5PxWYigoj9wxSkoIX411YPbJ?=
 =?us-ascii?Q?5DhpNxloIeN/yGy+Nh6/ZqAsW59zEsBG1aVRR84ReUkovsZi0k34D5P4bf5u?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7Z52GsBNN6QTNauEGO7XfuIxHKSeBBxELjeVYZ9sD1EBSmJAF6HXnet7Iz8iHdbPDRYPFIw/kHHkZ0dMrGVN+gdY6E6STomGghcUI/W/JP/LSWXaNHK3LYxo9f2VZFtdO8YsTXDk/Vs1TgV1f01dUIg8cM9gbT3qqyOC180B32vrX/xD+z4lALKXYFpbgskVRYS7o7PurnnI2GyHCTCdH4R1o1LI57fk+uGeL+VMIKUN5ovwI/fgtumcwgfgkqKEwsQlysJjUOA7c8JF4OQ4GPxRxlkzn5Slz3Z838BYiPA8Vg46WtcgWgnmmNVSo4Vh/sEn3089qoeGpjX2/8uTB8MJl5AkJ9AGburVw8W/tmDAzD3rN3oIcp1C+rngawqhWmdKfDwln36O1e4ohSM6y39a14Dekg9HDU0YW/Rc6Cc5Jo78SgVS/krpt0HJ9PohJFsBIC/wpiw06GHDiXmWBjIZwy6TlKQh34Ojaz1aYkWjcgKMoxAAFWDuzQmgut087gGy4O4ySuI0V6mbz9rQ+YNe0CyJ6dnwLUs7U9W6jAAQonCtvz+OgxZqagU/vTAa9vmBzY6zXY0+GD5pxYHL3ORPVbF84aeaMQJLjkpm12Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd2ca7f-311b-4138-a490-08dddea55bf2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 22:19:55.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYA/V3mzNmBklFlX4Dp438uTNptLZmN1t2zApz3CLSEE3OsUot4do2jg5wC2RCWHTOBacqkF1ZGYNz0NkLpOZZydPIKsntUVQ1eCiJhSZgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508180209
X-Proofpoint-ORIG-GUID: OzYBuYod0HcwbkS_a9_GWimMCGP50FB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwOSBTYWx0ZWRfX1p4e6NJc8A5E
 lBZF+KW/dfegZqyZH97kL8oqgg97cL6/uD6vlLQRIYD+o+ZoPno+DG2FRUlIDYImVamMoinBGQ0
 wT+txojjbvBEez4CyuLqHi/+Tnfq2YOXjn4j1aRy4Tp7XEtmjoeupe0i76cBN/ZBkbVIWhWcTcE
 jZR0Gp4aBZpFaQ2US2SCLmY7+8H05TRR9GrX6hOcQHK7I+0rA9ZNttIWncGf5QstHam1cNeAd8B
 TngVzB3xVN/LLhEU5aUqpHZ2fkEtTnLLv8JYwL8W4W7f2s6JICpsX8edVEoKInptqVyyVBV9KuA
 DII0HzUC8Nybr5SeDrYAyhHYGouwdKdOHVmnzVRwYCxqb4H9DTP/6QxXUFFeNpN/bYZNojPXpGk
 gZVsAvNgbL2AkxQRjKlO1MT3bi610+aulKixvrxFRymjjNtUg/YXbLio2JGqEb0A/LiJHaI0
X-Proofpoint-GUID: OzYBuYod0HcwbkS_a9_GWimMCGP50FB2
X-Authority-Analysis: v=2.4 cv=OK4n3TaB c=1 sm=1 tr=0 ts=68a3a70e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=-X85fCDas1XSbrN0yvgA:9 cc=ntf
 awl=host:12070

Rather than having multiple data items that need to be updated whenever
a new version is released, a single entry in versions.list will now be
all that is needed.  The mkvers script generates the necessary defines,
and is also used to return the most recent release version to be used
in GNUmakefile.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile                                  |  2 +-
 libdtrace/.gitignore                         |  1 +
 libdtrace/Build                              |  8 +-
 libdtrace/dt_version.h                       | 82 +-------------------
 libdtrace/mkvers                             | 67 ++++++++++++++++
 libdtrace/versions.list                      | 67 ++++++++++++++++
 test/unittest/dtrace-util/tst.APIVersion.d   | 11 +--
 test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
 test/unittest/dtrace-util/tst.APIVersion.r.p | 12 +++
 test/unittest/options/tst.version.r          |  1 -
 test/unittest/options/tst.version.sh         |  3 +-
 11 files changed, 163 insertions(+), 93 deletions(-)
 create mode 100755 libdtrace/mkvers
 create mode 100644 libdtrace/versions.list
 create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p

diff --git a/GNUmakefile b/GNUmakefile
index 7ad857f88..38ae54236 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -14,7 +14,7 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.3
+VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
 
 # Verify supported hardware.
 
diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
index cf124ba1d..ebf6ac9b2 100644
--- a/libdtrace/.gitignore
+++ b/libdtrace/.gitignore
@@ -3,6 +3,7 @@ dt_errtags.c
 dt_grammar.[ch]
 dt_lex.c
 dt_names.c
+dt_versions_defs.h
 errno.d
 regs.d
 signal.d
diff --git a/libdtrace/Build b/libdtrace/Build
index 164023bbc..3540d1c12 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_work.c \
 			  dt_xlator.c
 
-libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
+libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
+			   $(objdir)/dt_git_version.h
 
 SHLIBS += libdtrace
 
@@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
 $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
 	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
 
+$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
+	$(call describe-target,MKVERS,$@)
+	$(libdtrace-build_DIR)mkvers $< > $@
+
 $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
 	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
 	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
@@ -279,6 +284,7 @@ clean::
 	rm -f $(libdtrace-build_DIR)dt_errtags.c
 	rm -f $(libdtrace-build_DIR)dt_grammar.h $(libdtrace-build_DIR)dt_grammar.c
 	rm -f $(libdtrace-build_DIR)dt_lex.c
+	rm -f $(libdtrace-build_DIR)dt_versions_defs.h
 	rm -f $(addprefix $(libdtrace-build_DIR),$(BUILD_DLIBS))
 
 install::
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 8dd252b08..527087db3 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -13,83 +13,7 @@ extern "C" {
 #endif
 
 #include <dt_ident.h>
-
-/*
- * Versioning definitions
- *
- * These #defines are used in identifier tables to fill in the version fields
- * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_LATEST must correspond
- * to the latest version value among all versions exported by the D compiler.
- * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
- * it along with any suffixes (e.g. Beta).
- *
- * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
- * explanation of these DTrace features and their values.
- *
- * When adding a new version:
- *  - Add a new DT_VERS_* macro
- *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
- *  - Set DT_VERS_LATEST to the new DT_VERS_*
- *  - Update DT_VERS_STRING to reflect the new version
- *
- * NOTE: Although the DTrace versioning scheme supports the labeling and
- *       introduction of incompatible changes (e.g. dropping an interface in a
- *       major release), the libdtrace code does not currently support this.
- *       All versions are assumed to strictly inherit from one another.  If
- *       we ever need to provide divergent interfaces, this will need work.
- *
- * The version number should be increased for every customer visible release
- * of DTrace.
- *  - The major number should be incremented when a fundamental change has been
- *    made that would affect all consumers, and would reflect sweeping changes
- *    to DTrace or the D language.
- *  - The minor number should be incremented when a change is introduced that
- *    could break scripts that had previously worked; for example, adding a new
- *    built-in variable could break a script which was already using that
- *    identifier.
- *  - The micro number should be changed when introducing functionality changes
- *    or major bug fixes that do not affect backward compatibility -- this is
- *    merely to make capabilities easily determined from the version number.
- *    Minor bugs do not require any modification to the version number.
- */
-#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
-#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
-#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
-#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
-#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
-#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
-#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
-#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
-#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
-#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
-#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
-#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
-#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
-#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
-#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
-#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
-
-#define DTRACE_VERSIONS	{ \
-	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
-	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
-	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
-	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
-	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
-	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
-	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
-	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
-	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
-	DT_VERS_1_6,	/* D API 1.6 */ \
-	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
-	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
-	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
-	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
-	DT_VERS_2_0,	/* D API 2.0 */ \
-}
-
-#define	DT_VERS_LATEST	DT_VERS_2_0_1
-#define	DT_VERS_STRING	"Oracle D 2.0"
+#include "dt_versions_defs.h"
 
 /*
  * Interfaces for parsing and handling DTrace version strings.  Version binding
@@ -112,8 +36,8 @@ extern "C" {
 
 typedef uint32_t dt_version_t;
 
-extern const dt_version_t _dtrace_versions[];
-extern const char *const _dtrace_version;
+extern const dt_version_t	_dtrace_versions[];
+extern const char *const	_dtrace_version;
 
 extern char *dt_version_num2str(dt_version_t, char *, size_t);
 extern int dt_version_str2num(const char *, dt_version_t *);
diff --git a/libdtrace/mkvers b/libdtrace/mkvers
new file mode 100755
index 000000000..82295b152
--- /dev/null
+++ b/libdtrace/mkvers
@@ -0,0 +1,67 @@
+#!/usr/bin/gawk -f
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+/^\s*#/ { next; }
+NF == 0 { next; }
+
+{
+	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
+		print "E: Invalid version string: " $1 >"/dev/stderr";
+		exit 1
+	}
+
+	n = split($1, arr, /\./);
+	if (n == 2)
+		arr[3] = 0;
+
+	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
+	versions[code] = arr[1] " " arr[2] " " arr[3];
+	next;
+}
+
+END {
+	n = asorti(versions, idx);
+
+	if (current) {
+		$0 = versions[idx[n]];
+		if ($3 == 0)
+			printf "%s.%s", $1, $2;
+		else
+			printf "%s.%s.%s", $1, $2, $3;
+
+		exit(0);
+	}
+
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
+			       $1, $2, $1, $2;
+		else
+			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
+			       $1, $2, $3, $1, $2, $3;
+	}
+
+	print "\n#define DTRACE_VERSIONS { \\";
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
+		else
+			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
+	}
+	print "}";
+
+	if ($3 == 0) {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
+	} else {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
+	}
+}
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
new file mode 100644
index 000000000..8986d2007
--- /dev/null
+++ b/libdtrace/versions.list
@@ -0,0 +1,67 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# Version definitions
+#
+# These definitions are used to generate dt_versions_defs.h.
+#
+# The generated file contains:
+#  - DT_VERS_* defines that are used in identifier tables to fill in the
+#    version fields associated with each identifier.
+#
+#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
+#    valid DTrace versions
+#
+#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
+#
+#  - DT_VERS_STRING which provides a string representation of the most recent
+#    DTrace version
+#
+# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
+# explanation of these DTrace features and their values.
+#
+# NOTE: Although the DTrace versioning scheme supports the labeling and
+#       introduction of incompatible changes (e.g. dropping an interface in a
+#       major release), the libdtrace code does not currently support this.
+#       All versions are assumed to strictly inherit from one another.  If
+#       we ever need to provide divergent interfaces, this will need work.
+#
+# The version number should be increased for every customer visible release
+# of DTrace.
+#  - The major number should be incremented when a fundamental change has been
+#    made that would affect all consumers, and would reflect sweeping changes
+#    to DTrace or the D language.
+#  - The minor number should be incremented when a change is introduced that
+#    could break scripts that had previously worked; for example, adding a new
+#    built-in variable could break a script which was already using that
+#    identifier.
+#  - The micro number should be changed when introducing functionality changes
+#    or major bug fixes that do not affect backward compatibility -- this is
+#    merely to make capabilities easily determined from the version number.
+#    Minor bugs do not require any modification to the version number.
+#
+
+# Ver	Description
+1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
+1.1	D API 1.1.0 Solaris Express 6/05
+1.2	D API 1.2.0 Solaris 10 Update 1
+1.2.1	D API 1.2.1 Solaris Express 4/06
+1.2.2	D API 1.2.2 Solaris Express 6/06
+1.3	D API 1.3 Solaris Express 10/06
+1.4	D API 1.4 Solaris Express 2/07
+1.4.1	D API 1.4.1 Solaris Express 4/07
+1.5	D API 1.5 Solaris Express 7/07
+1.6	D API 1.6
+1.6.1	D API 1.6.1
+1.6.2	D API 1.6.2
+1.6.3	D API 1.6.3
+1.6.4	D API 1.6.4
+2.0	D API 2.0 Linux (BPF)
+2.0.1	D API 2.0.1 Linux (BPF)
+2.0.2	D API 2.0.2 Linux (BPF)
+2.0.3	D API 2.0.3 Linux (BPF)
diff --git a/test/unittest/dtrace-util/tst.APIVersion.d b/test/unittest/dtrace-util/tst.APIVersion.d
index 85108c027..3b2baaa60 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.d
+++ b/test/unittest/dtrace-util/tst.APIVersion.d
@@ -1,18 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* Assertion:
- * Use the -V option to printout API version.
+/* ASSERTION: Use the -V option to printout API version.
  *
- * SECTION:
- *	dtrace Utility/-V Option
- *
- * NOTES:
- * Use /usr/sbin/dtrace -V on command line.
+ * SECTION: dtrace Utility/-V Option
  */
 
 /* @@runtest-opts: -V */
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
index 6bc7b9d72..0d88b694e 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.r
+++ b/test/unittest/dtrace-util/tst.APIVersion.r
@@ -1 +1 @@
-dtrace: Oracle D 2.0
+dtrace: Oracle D x.y.z
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r.p b/test/unittest/dtrace-util/tst.APIVersion.r.p
new file mode 100755
index 000000000..8da4f22c1
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.APIVersion.r.p
@@ -0,0 +1,12 @@
+#!/usr/bin/gawk -f
+
+# We do not care about the actual version number - we just want to ensure that
+# a version using the correct format is reported.
+/dtrace:/ {
+	sub(/[1-9][0-9]*\.[0-9]+\.[0-9]+/, "x.y.z");
+	sub(/[1-9][0-9]*\.[0-9]+/, "x.y.z");
+}
+
+{
+	print;
+}
diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
index 15010b3db..8b1378917 100644
--- a/test/unittest/options/tst.version.r
+++ b/test/unittest/options/tst.version.r
@@ -1,2 +1 @@
-version is 2.0
 
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
index ffffcdd8b..37fb6f752 100755
--- a/test/unittest/options/tst.version.sh
+++ b/test/unittest/options/tst.version.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025,Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,6 @@
 dtrace=$1
 
 myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
-echo version is $myversion
 
 $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
 exit $?
-- 
2.45.2

