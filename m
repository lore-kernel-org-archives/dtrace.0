Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE20D531
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825282; cv=fail; b=Zo1QowRy1Eoaa2yC+gDjGwNf6ZHDuPM8qQ0U+BLBImuXGkGoTcJWbmUP5A6WZP47rH8Wl3IplfKmyrOXJt7m13ipiexEOpTxUuA8JcU6hEX7FPuzIxGbLfrGtHvcE49/G30jV12S3KSbkSdESTrEIDqNkBAbuycdE4EV/F0WBec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825282; c=relaxed/simple;
	bh=drnpv9+uVOQl5Rs0bgsBXbHL0fgqvr1InnwQGbl+RQ0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X3XFFE/c6D6fMqVwGWWerqTXuEJXpJ0Uzy1lWjN7t0MjMyUIxNpci2yU+1r5V99L7gPNpBLAB5/H6+TJqEx40aEfwQ4bHDDESGSWxaKKw29FcHyBfcW7wkKIIVgDsu3Ixu7lCqTW2On8WZatjBilVEWgAEQ7HvCdhjM5htXC0Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TnqLhnVI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BYSP6R2V; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TnqLhnVI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BYSP6R2V"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiduJ018864
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AhfYyUDWXIYX15o9TM
	ZHF58CLQvYA2RaVyDApjBKbJ0=; b=TnqLhnVIJyf51QRh9yikr1Nq1+KiiY6eNX
	Zk0p4yXj17VMHCtt9Amqt+KpWkrlwCZI44kF+Xa4qbHAaVXgG7nooAKPPuRUtsTp
	yjcGrVtsK6MqMmXztQ+vyuTI5+jK25ZTWkiZLbmpIXG6a8CvsjgwIJGp5Zwvf9hz
	+W20vaxyE6p5dJxNRuB8SPkhesgC3bFdQjfiZDuB/3JxkjlLFMBi0k1C09ojVWBH
	1V4JQtpqlKaLE59/cfQGthqMKvs4CtBnWrhFd7YA5rptammSSMATSp26MBLPYgIW
	bebRAcPDPQanMTI2RNNsKrLvIj7mQtaRNOqUhJsDN02+VeBwVgog==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPo3007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG3NYoETrdQ1iF2RmpyIYHtr78V2HU6LCno87vh79EwEgYm7nL+4sUAqM+iAWfnGkCLdx3REbVapfWLFg4LxScVjXND1Sf0U4Xqr3NACznY8a7ch8FHCPNsgkGBHa1STWeUhlgKNFehs344tSDMMvXA5LD/Lj6KBqcwPTlXVzZ9y5V31ce0h2JrF3fdpi1Hj9VHq4qZLzOusi2kOY4kUKasv+4ynFTbNJpG57NHPEz2b1YL8cc56Xxl62XQgwHcziJF//GFzwOpusnEE4Kvmgwwq+TL3qc9ptAkbbm8ll63/FgXEsaHqrvo3DtPU8pXfsK4ik+mHw527wy8o5FEwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhfYyUDWXIYX15o9TMZHF58CLQvYA2RaVyDApjBKbJ0=;
 b=zJM7YbxxOrG6mk0nJ6wWYqUCn/reUn9vL9wDO3IUbfbRHwSbWLM7vU0rfrdHcma6lBjkv9gEOp3yf128qzuYg/mqp/I341vt+r1I154mWo1CK8mvB1/6RvUShgRJqFy9lfwmm4WXuSeVOKO1BXK7zu5a4epqeetK5EEAyZGy4pCjNXdFuXGVnwQ+xoMkqVZZGkpdqSBbLsMzxv9UM7tNZBFLiVmWOz/xnKKCBGelJJvTSmkmfzgAUishWoDHYqxg3aPdMh98FM83TuWT/skR6ft/36aGJC2rNTa2i75KvNaZ1170AJzxWFC+So0HwJ2CYtp9mWBn0Te0CL1hQWQ/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhfYyUDWXIYX15o9TMZHF58CLQvYA2RaVyDApjBKbJ0=;
 b=BYSP6R2VEjkUzgi+kXNWcoRGKC7Ys+9To5LAo0qz0Q7IPXXNHHeYZZudrgFCLAdfX0/Kj2wvWRwJX4ol/hTQsq7HxYFRPD7QuJbjP8yj35q0a0yTxWU2BhAYM10j5pcvPGJUryVi85/3abOPuEles6FKnigLWFdDSJ5ZcaMq9fs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 05/14] test: caller and stackdepth tests for dtrace provider
Date: Wed, 25 Jun 2025 00:20:58 -0400
Message-Id: <20250625042107.13571-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dea6fbc-c09f-4ac4-13e6-08ddb39fba32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EPbaBZ6vwMzhPp7eDT0lxndumRmCObfQPUW4aC/RBPnJKCJIt+dErmx9RnJB?=
 =?us-ascii?Q?CHoZL9fNluWSM0rPBP/xrgliHw6p0G1G771y+n2cGVPrNmytT2cmlvBgq+pa?=
 =?us-ascii?Q?R8UvHec6Fugz566qlRs6owpUanEnbkrhZY8P+4B6VAXAFj/a11iIqg6NanrO?=
 =?us-ascii?Q?2lKkXEhclmpkNvAaCnkZc8BWWmMAG/fUvuiMfHvtRhZRVepgSX5L+S8JcRjx?=
 =?us-ascii?Q?nem6Iw5L56rG55qx5MAlrnE4nxrd16dD3nC3MIoxshnD8cS0iBLPZ/33q/M0?=
 =?us-ascii?Q?ajkCxJ9f+EOq7Ddw75MLJuJjjj9+Fsihgc7A0mV6del5Mqqc/KyryIvk4r/y?=
 =?us-ascii?Q?uzkcwG4h0mWYU7Ys7tj5dqsUJks586NkGFU8OBavxvwf/uK6QzhxVKjRLAVO?=
 =?us-ascii?Q?PZf+PaX/7DmmAM945r6wXA07BwmNmHi0BQPM9Y0ldpE63SMtb6t8eRnkFGtZ?=
 =?us-ascii?Q?2V3d+pVzkHPnmhRbw0gf0GfWyxHoHGav+gQwR/nuIq4Xu7j3abZ7TPREWYHQ?=
 =?us-ascii?Q?tTl2ZdhEIom2+1KrCnBK6QAK3OwSRf9GbewIi7t3CTHNxHXiBWQU65VKFd0n?=
 =?us-ascii?Q?8iVz2MW3bWtvi1tj5mRnXOvCYWmP9Uv5IGHPtO0f7jYBnd36BIJMMEY5hUZs?=
 =?us-ascii?Q?PxsbW3zAFm/QGmmHAkzkWY6t+ssMC/w4MU7arRlcG0tQcXtcfXVFisTNlofY?=
 =?us-ascii?Q?Qov49QIWHwUpoyw+ng1rkJpFlqmJgOJ+vGvrVY5J0DT1nZ64LjVdZ1VyuVHV?=
 =?us-ascii?Q?++9z2u/+TasirCRZhsB63q+/HtRnfpqInettj2QJAKPDkdlou9IeN1yZ39/H?=
 =?us-ascii?Q?j1YmT61dm95E5gxRCy9Qj+WbSNlMJbRfvVZ9BWsWd4WSYl5EdVjRgkRQb3Qf?=
 =?us-ascii?Q?D1SDRNWYUsPOMuseKdlJu2A34P645o2qqkl4bK6B6bA5VLz/jy93o/MTu/hh?=
 =?us-ascii?Q?xfpOtwjQLEoSRt/hN2B6I9oTj1UF2rNPQo/VAOMyXDBRO1eagbhc2WOxn0rp?=
 =?us-ascii?Q?r8p02gTwY+f+zPv9u3/rTyLEiy8r8LXGQAjIh0o1bfqOnaP29VFOUJBcDyhi?=
 =?us-ascii?Q?cQxPnRR0wlc1c1+eFzWfc46vw1D9XhTMvSrHrWevPn0H2jCkdxNHK5U8Iy0J?=
 =?us-ascii?Q?Csz9yaKYdb0fIqWsUdmeW0jg2YM5M+yl+1+S2yt9Zp6rFTZpOu6F+5IKRDYv?=
 =?us-ascii?Q?hnuV0UMXQK0LCDRQiZ6swE88/W7+N1qit9eyBlzT5gqYJQuJiiEncWWCOIga?=
 =?us-ascii?Q?NYensurwbV42Jv3hV1zb1J1zqDP8/lPg+HPoWm4h32es4k3ScA81yypyZ21T?=
 =?us-ascii?Q?nn2NS/j6AyH/zb8XhCJyAntiMFlbnOqb9hk6QDTwcW4S0eSVBY3NkFF9pDAA?=
 =?us-ascii?Q?6InAOjjMldy1GU3+xXrvD0LcQ3rw5gjKPIF7c9PFCHLXOwTIYbQJ+5F56vp3?=
 =?us-ascii?Q?tkyA12ePKao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AbnV1RP2QhATgqQ22toIBodaYoqqQVWlbRmTilN0+r1tii2lKsEbjqDHYl6b?=
 =?us-ascii?Q?MsZYyX7amsnDlsDOaaNUtq/YDGHb3KYHVDDX9YAVGXTAxfvyAU10/zZcxkhj?=
 =?us-ascii?Q?555dfiSRsRmU2qD4guduEOihYOdYvyOhYWAvkPXGlJyC5HHpB4mWJRh1NAIZ?=
 =?us-ascii?Q?5V1LqrhJCrtSJilgpGqPTq0qYRQ8MT3fs4CN7sajiALIu25dO3YtplYGvikc?=
 =?us-ascii?Q?442xJINxmsmP/OHAwQ7Ue4YCk+16LejNPftJEzETADQN85j/Ukv1NxNIXbff?=
 =?us-ascii?Q?tFYgIqa56TGj3U06GLR0NXNFlfywAkVmgm9YX0Ap8qHPK4A6LmtAqxEYKBgU?=
 =?us-ascii?Q?LxAVPhT4jTDCnjOQeehe7S+TT1csuR8mUC8nH5lS3W/rrYJT91sZGer+HR3e?=
 =?us-ascii?Q?x3+gnPfsiNvQJ5ccNNLDe/kNoa8LxJJEmz6Bx/myuXzkH81UgbOg9h8l4b6E?=
 =?us-ascii?Q?oeiD7DyOWnaxAsM3Sswq+fC1Xeid7XvSZZGEnzNYU0h+NauMCmZaUPgoDx0W?=
 =?us-ascii?Q?fkGytI8oDeciEMs8agSuvGIQ7nYW4LrhwjtwHj/u4OUnOMySnn9BAb6DPA58?=
 =?us-ascii?Q?EnQC2uUPhQxxrv3VmW5aSPhNHGYnc0wj4oF/CHboesC1ccHVRLGFNg8RZM5A?=
 =?us-ascii?Q?PEi3RVNkPgbVM4Mpsg3Rgja1KheuIrcoX57zqKpmiJC5mcKwTJKLtBg5lksX?=
 =?us-ascii?Q?VzNRpdlZzfXrAx1JJVsin0qxt2FIGs5tIYlbU6dBFFGof3X49aweb7R55HDt?=
 =?us-ascii?Q?+bF1O4j/C/meZwmFl+EfAMvPQyhLXYS59xeBjLv2Cft81G7kTunz7mepXsR1?=
 =?us-ascii?Q?PPwG0qlBz3Rmy8BkUDFbtlfwFfH3Ni0xh/xxuowCLzAhjd371A0O5yTzoCdX?=
 =?us-ascii?Q?3TG5EGBbRlKHcw2t+PlrLc6oCFNVauFYLOBpxIXTLTC3NyW0e8P50VngboB4?=
 =?us-ascii?Q?lM6lvCTFwmdS8Vz7HfKfC1bspI1r8bNCplTEtLXCcW6I3MNuLyKxj1Uijv0l?=
 =?us-ascii?Q?UeRzzoWHB9KmCcFmkNG26aT1Z2AzdmT6GVY/3VDO/6HEmG2Vl/s6w6mCxBKG?=
 =?us-ascii?Q?8FVmXCKhIjNdxvQSpBFT4LGrD5xBKb861YfYRgpPX+3Ke71cGt/ejD2vcv3O?=
 =?us-ascii?Q?kUaRcX2i0rFyYWVFJps29sHndrrDuHLKYk2lIntV8733sMex6PqTihxgmYzx?=
 =?us-ascii?Q?/zcFPedowpv7v7CB819tKl/4RbUuE9h7u+HPFH8RgRCzANjP2/LX8ERAxHeO?=
 =?us-ascii?Q?kf2bFOFbejzrd+dDhNLBMe89ev+zc+0x55Dew4fvU29NSoWSmILE1dIBsGVG?=
 =?us-ascii?Q?Odh7WwVw2Dm/qLbZjCtzyjp4HL8DxfEuso4FfaOnlHzAzTaq6Uu3vqVwcSz6?=
 =?us-ascii?Q?yiZBGp2VN8yL8pHIW9c30cf/m5unYM8KouBHmRET/77o6j2d5G1eJ2/XJhdZ?=
 =?us-ascii?Q?SYeNyWCqMtExn2wqXep4qkqk7vPoCpgE9QJQ1nNKdGVp5jeVCaO4l7HGguUg?=
 =?us-ascii?Q?WiwLzWkD1pdYiFs5mgwxAhU5zEii/OuIGiRL8woWpP11q29yMtdJzxvb6V9L?=
 =?us-ascii?Q?eopPRrlSzFMHM7M6niwqGDZNDEWJJuyIUsLDO9tz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dgL+t8iih3To/qQOnZn3JLP4i1jgABic4iyUjnryBcXtHITQhZMV7PAjEysEzqRq4pVf+U0V9EF2eY5f5mETzEJ9o+5IDHcrT1T31AZEZDMBhMllh1fDkJ86NrCJ4S/gMx4oLmTSoSnI3f+ifJmUNPsFC8A6SHJaTMZYDpraK0/ME9IhF5p7EoetbRfWzL5TyIG9tNw0+1m/V34nlXVFXyd3KHOqnfZzK9bOPdYlnkmERqqI3P/c4g+immF+1IBD0A5JxyOza11xfFpOtHW+/szo+5yQdtMkAx1EwmWoJDaJI7mUnuXNa9o/SRX272zeWyFUPmcNHOuMHNCx8i3sXfWvZSYbPFqe4Dd0/pzEotn4WQMGT92PpdKEgBQJuiVIIp7XX6qP/CACdC300uOm9bdCAnb7dNRj5LAHxyWiVlFlWCUt+mTXdrkZ9VNw/UY3NCzHoG9xdBZqkZLqK3450zVSsPj9Fpawce9tXI0lDakKsd3t5yuTufKgLnhEpINqxgjPTAAHWzuX7BJwAgPv3sBsO6r3t2e+NSVTjwoxPbr1REe3nNfb/e2zlJCBaDesPHl5lBXOc0qo6C9VMiOVuQaTiVned2swYnasylPjpXk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dea6fbc-c09f-4ac4-13e6-08ddb39fba32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:16.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRl123DdsTBotAtChNJzc4XcCW8xxhpkjbyYUH2craSTM32C7qhlpWjYBdUV8TCkS8h2q68FNHy/grVwGcfsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: 8OsCwpUgTkAm4niteBHWxIQn_QydqIFx
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b793f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ucXKd3twMO7rDMujzR8A:9
X-Proofpoint-ORIG-GUID: 8OsCwpUgTkAm4niteBHWxIQn_QydqIFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX/FvgQBaVMsey Mir1xnGT0WpJSKgDWEpnsaEWfe3nNwwKMhgesyCptXTEYmub2PmQHHlp1GCk2SxiRJluwe5MIXk 1iLaE+KXVBFxWTZ5tMdegezm2zAgxj/89pS1RbqvxA5AGAzwEdox9ySV1eEnxSNdVRkQpaDNDOc
 /fdg8q9SGwjfXSNSG1Sq5V+1g7tYoIrWbQpBNKToorG+FYLUyPZ47jvFzGZByzEIFXj7bNvfiBX kes96uYPB68OloafmSEtqm37ZOpRGDpzWZ75EeSBUtnKJ8o01Sa3We+RR/F6+9eMfLXND36rHh9 3lR2Jw27xHthXibwiSM6KPYqJqsw5nGtTr9Imfs4X7jr8xhE6TK3vzKGKlXS6yWYUFemoZTBDX9
 OAwJQePPdrxqbv/OvFvrtuxTJBdxqUDr/i3oE76wQsiQH/RXi4oCyfmnOAgCgTy4Th9WXGeu

From: Eugene Loh <eugene.loh@oracle.com>

Also, a few old tests, which tested caller and stackdepth using the
dtrace provider, are now superfluous given the new, provider-named
tests.  The old tests were extremely lenient -- e.g., simply
checking that these built-in variables were not -1, even though
both variables are unsigned anyhow!

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/builtinvar/tst.caller.d         | 25 -------------------
 .../variables/bvar/tst.caller-dtrace.d        | 20 +++++++++++++++
 .../variables/bvar/tst.caller-dtrace.r        |  1 +
 test/unittest/variables/bvar/tst.caller.d     | 23 -----------------
 .../variables/bvar/tst.stackdepth-dtrace.d    | 23 +++++++++++++++++
 .../variables/bvar/tst.stackdepth-dtrace.r    |  5 ++++
 test/unittest/variables/bvar/tst.stackdepth.d | 23 -----------------
 7 files changed, 49 insertions(+), 71 deletions(-)
 delete mode 100644 test/unittest/builtinvar/tst.caller.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-dtrace.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-dtrace.r
 delete mode 100644 test/unittest/variables/bvar/tst.caller.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-dtrace.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-dtrace.r
 delete mode 100644 test/unittest/variables/bvar/tst.stackdepth.d

diff --git a/test/unittest/builtinvar/tst.caller.d b/test/unittest/builtinvar/tst.caller.d
deleted file mode 100644
index 19a4bab9e..000000000
--- a/test/unittest/builtinvar/tst.caller.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: print 'caller' and make sure it succeeds.
- *
- * SECTION: Variables/Built-in Variables
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-	printf("The caller is %u\n", caller);
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller-dtrace.d b/test/unittest/variables/bvar/tst.caller-dtrace.d
new file mode 100644
index 000000000..d726f38ac
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-dtrace.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check 'caller'. */
+
+#pragma D option quiet
+
+BEGIN {
+	trace(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-dtrace.r b/test/unittest/variables/bvar/tst.caller-dtrace.r
new file mode 100644
index 000000000..573541ac9
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-dtrace.r
@@ -0,0 +1 @@
+0
diff --git a/test/unittest/variables/bvar/tst.caller.d b/test/unittest/variables/bvar/tst.caller.d
deleted file mode 100644
index 3d64fa98c..000000000
--- a/test/unittest/variables/bvar/tst.caller.d
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2020, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'caller' variable can be accessed and is not -1.
- *
- * SECTION: Variables/Built-in Variables/caller
- */
-
-#pragma D option quiet
-
-BEGIN {
-	trace(caller);
-	exit(caller != -1 ? 0 : 1);
-}
-
-ERROR {
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-dtrace.d b/test/unittest/variables/bvar/tst.stackdepth-dtrace.d
new file mode 100644
index 000000000..1026006eb
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-dtrace.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check 'stackdepth'. */
+
+#pragma D option quiet
+
+BEGIN {
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack();
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-dtrace.r b/test/unittest/variables/bvar/tst.stackdepth-dtrace.r
new file mode 100644
index 000000000..1afb1f057
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-dtrace.r
@@ -0,0 +1,5 @@
+DEPTH 0
+TRACE BEGIN
+
+TRACE END
+
diff --git a/test/unittest/variables/bvar/tst.stackdepth.d b/test/unittest/variables/bvar/tst.stackdepth.d
deleted file mode 100644
index ad728fd85..000000000
--- a/test/unittest/variables/bvar/tst.stackdepth.d
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2020, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'stackdepth' variable can be accessed and is not -1.
- *
- * SECTION: Variables/Built-in Variables/stackdepth
- */
-
-#pragma D option quiet
-
-BEGIN {
-	trace(stackdepth);
-	exit(stackdepth != -1 ? 0 : 1);
-}
-
-ERROR {
-	exit(1);
-}
-- 
2.43.5

