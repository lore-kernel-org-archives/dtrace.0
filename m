Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9F1A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466755; cv=fail; b=TqPvEADXu97F90cZ8wEhgBm6qx6JaPHCk3Lkp7z7JSIe7Ngz/ePtsDs+MDSGeC2NHBve557UROT+YeDC8Zlqp9xYkNAKuSLZrJWsKyPUS0seOUbXSKWLZa7KHxt7wnCsNpvbVTG30aD+Rw/tNrw2ahT4ZLrovgUJiMgzQZj+VI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466755; c=relaxed/simple;
	bh=LJLk687pR9W/WKqfnFSpZIavF5EyDw9zKfGHC1lJ3n0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a0fqven1UrvCkhpvI8RkZCC/AYHB4p0mmZdrtwPmI43HTPpfmaxK5nmgpcWnfbyl1Rzsn9g6+YOjg9J8XoIwbj7YYC0QjPRbqIg5yfUbH4IAjr6vmtkWHQunVzHPgAtK9bsOOWKFxMBw1q/xC6HxHf0B9PV07nHZdjngzYGaOkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fTIkv5sf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nAxPw0IB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fTIkv5sf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nAxPw0IB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMW5s030890
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=NEoND5ebqoRZ4l
	xKPxHn4+Ps3/sDD3lBURZDOAKFpu0=; b=fTIkv5sf1cRKoBPVvoSfH1IH0UuLJa
	3wTjIh3HkuFIeJPtjNG12XSvUnGDDvx5dfXC4dpsqER/Q8ASHxa581mCw0OCqAAV
	koLIgAEnboK/gGoh59FEMZmet3vVQyBNOZQ6MvVdf5ueZ6i2oFsKVEjAe02Nkfo1
	ToWL63lka7IsfILj9/+oWhEHz2sLO5RZgnjz/NXz8Ov1Z6qBsbfDT3j/M0/tlPZy
	2P+PFOV8Ff3DsL4tjMT3rr1nIw2r/XEJHuKV9b5e/sIh4nKIklEcCwllzDy35dMW
	XQaQTMkwoUBiWE6KaYkls47Osc6F1v0TGH8fqBwLKdzGxiwTmZf5Xmug==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3BdqP021749
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yxys6uwdx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgE3d6UAocbRUAWTmAKQ1qsNsS/g1GHh46WpJdlm5KrOv548hMEDLVsf/ymobTAqUTry8qfAUWkGjtQIkLFg6nedTG4OdN+7tT/8yk18Z1gP1nRC24rE850sEzBGF6LefqlBUG375kqqg3Ou4QA6eHXaqOgSej39esZ5My/8/IKyhTmLbbwebqp1VqMz7wITlgrWsL5uf7WAZsql9baem/HDseHdIvQQZyou3qr6A1KC233XXCKKpcVrLUewjfcNIJSXxZ8p4XmEocobPJ9DyPAPMn047fFWWpFKjhLUrjvEEvHA+mzT0/j5/6Nv7SYlEw23mATTPYUXY4tD/dGT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEoND5ebqoRZ4lxKPxHn4+Ps3/sDD3lBURZDOAKFpu0=;
 b=J3WzMKh9UUtFAYe/bWaWx8Ufe5eo3doH0eLoBiFTtm2HZsEHWX3dnKE78L4AP+ZXCTpXERteIUt5xdMXRnHMuWDQ8t/SU+rp7tChXt3uNHf+S0ORZwXqCK/eXOAOgMEcLSD3SZWF3ysadBesoGzIvfKkOPjJDcfY/S/xYUWYNcXIXkK5CFeu0+KQDmtyctAoLtKK4aZGahkLfdSD6DJnZHuBfP9kWJsVWkUZlmz2NSDYnRsTG+ClZTpEdt0gdetg3C5Q80CxppIFsq2X/drVKUiAR0/ipaBA5UTdRmPCgv0D9JcV4lUuh88m0KDPX0dlVidiZNnbXeTHXY83C+xdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEoND5ebqoRZ4lxKPxHn4+Ps3/sDD3lBURZDOAKFpu0=;
 b=nAxPw0IBs4SdAvZzPdv5G6bN3+XpW+Rj6TAdqc7wiEZTbotWoFHhFM8dui3Hv2tli/dHYLYLH8/+A6fH+KjsVZd8mgxQrRIP6TVsxs74/T5PC7AlJFwPuiIjx17mkLBXO+e4Ws+TY2zM3XWLCQYrRj5/UGyHlzLuKhT2zmTgEjo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:39:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 21/38] Add some comments
Date: Thu, 27 Jun 2024 01:38:47 -0400
Message-Id: <20240627053904.21996-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf987a0-f802-44c0-deb5-08dc966b774a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XQO5Mv5UVTtEf1rrTanrC4LI40uKtZAyBTSF7hzqTs611rG/AIkoINlsEkaD?=
 =?us-ascii?Q?cMY1Oq2zE72jDglubAsAxb33mkbwlvhRhcDcX+NapYX9rGGCdWdroddvnYVy?=
 =?us-ascii?Q?gABgBe15Km/yCnXxWnXIiDLVGX1dRTskMHBbRCdrOPfuqJjPb0kTRUdj1N0H?=
 =?us-ascii?Q?xXscn4xhU+7mG2EEMvhCDgMYfkFVkpWvTeGpqMCQB/PGb6Z1KvqV4T0Yju2r?=
 =?us-ascii?Q?QXnhqBpu2IiUQuVFkHhJME4imgzq7gLppYUKqgZRC4nFB6NDXDRg21Ev9NQJ?=
 =?us-ascii?Q?7sPaWt5IqmPZZRdVfB2ZDnzjGJm0fMbKFmwpG8LfEOPnGCPRgWXQsFtZhsph?=
 =?us-ascii?Q?AHArsBWq2wqvlD2cgRw397mhNBc0N3WGt5RMrZ1QUyAm5LHYxLr+bFtQnobt?=
 =?us-ascii?Q?7MAvPUm3WJZUVxer6WwmOn886bfkMMGHlR9xe5wjdvUaIAEMmwuknzjCJ4d1?=
 =?us-ascii?Q?Ola5jrFNkFdXYTbvrkRwaU9JoLvtSFogpxeL+ZpE0RUrlhjFKisVxX3KkLm9?=
 =?us-ascii?Q?Cs6QGkeZbk+qpg9wHm0/mZISC0NLK+VVGNA23NwaHhKDwO4UBIgpAFXckqxp?=
 =?us-ascii?Q?+TO3tVRKH24Oi1c1THhwEqfIY0eoGRrCaTzCKocsjGXP1Irvb4q1mhDR8fMj?=
 =?us-ascii?Q?LyzMrR+BM4W5GB0M7MOWW9JEJVXc5nWvDRWh73jmALjaG+UTdz26sNvr3N/D?=
 =?us-ascii?Q?CuoMfqOg7vWEKA13bMLbqw5HwegMxft+5DwHZCbC1jn3n4SOeaeyZ+lwYsWT?=
 =?us-ascii?Q?sQl55RoYmaCBxH7IUJhHEsAFIV24c8zDotziWS1r9GgCwvoCFZ1BI29Np6LS?=
 =?us-ascii?Q?mUdcDCmqMRLsSp+KVm8Fao0OB7CS/UYWfnuFCBzAtJgU5QKBdWxrL0SOssZw?=
 =?us-ascii?Q?r51DrIbeHYVY/chLb6pC9GYrVBeutJ6ZL1dp4sP2KzWNqNXA5ZUEv14nzKhv?=
 =?us-ascii?Q?eGRibzW/NUiXNzf5xJFjkRIA2fRXbFin5oD9fd/GOayFTfwt/xp9YH8qGMfU?=
 =?us-ascii?Q?7VvmqEjcPNCCJJTfojYS13pg8ryekecglDtDSJgn8W4A76721+nu10ho7g4d?=
 =?us-ascii?Q?Jqj9+N91edNmM86QnacTcrvGIsttKDUTgDeuI8CUK8AyLe5QSKeKxx02IAAg?=
 =?us-ascii?Q?P9gzXQ8dTK7fxUhnOci45hdY3Es6zM4HeZvIMpO7+E3nXFTeUTuJChOetz9p?=
 =?us-ascii?Q?FkbXWfcwXsxMwMXMbXiMGwMGW5MWz/wH34XZunVN7+SafAwTRJel1aOlWvpv?=
 =?us-ascii?Q?MtPWQXUiPom8dTUPZwJ3wzW2ZMmCJdTNFTcOfiTiNKfizTaXi/jFsZStFyuX?=
 =?us-ascii?Q?AUMoaRIZZQu1hIb4DhymT4bgaWR9S+bNaabgladZRCMsqw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ECNhAU6JMEkgE8XEpzDxxg4zns7+hPMwFfWNMYK7ZbKp1DgrjHdh6jH5avvS?=
 =?us-ascii?Q?f9nDcedIHRj23/3LpyavEPkEaTBeVwc1mnz+k1kzHUUVDmpJWuMtR/tLOjuh?=
 =?us-ascii?Q?hOBBBbFmMd9lHy1WZ10UZ4LMNPbVgxwoYJWdNEJSf4CqPvXCKRk14/hCCXeU?=
 =?us-ascii?Q?H92F9YXPbJ8XFGVuSxSmG7GtgQBjN9hlfbMDeOl35Pc3N5R7cwukcrAppHjy?=
 =?us-ascii?Q?FNqzUXoGNW9WuGz02Rf1tm1fvP+h3kAo0bG/2sS15vpiJ9DVL+kMie1iJtr3?=
 =?us-ascii?Q?e/SCUNxhFuSCb7yKH/Fs8fipW4LvVAcPFHxxBDLa5w8Bir4/DJtNWpsM+xL2?=
 =?us-ascii?Q?cInmsGluo3t51oNeg1tOHh8qYx3o5OTQeh+9+FJpfhbH/MMTOFmDhYJKApxz?=
 =?us-ascii?Q?1eiFcHAkLoz63YWF/cGwcrjZtsSyVmcZ2NoI53bgFwvv8FXt0M1eJqj2tuK5?=
 =?us-ascii?Q?gCvh/crrnOVn+Zm2wMf2WVuqsCz68SI6XPxuGTKXlP25haC+aJeN1txCDZMZ?=
 =?us-ascii?Q?gm29d1BzgZcJXPzUQGT4VTwJRpprW0rtlmbmS5J77Q8AWQGZvKPSV8oGmSqw?=
 =?us-ascii?Q?ldNe58xD6EBDsqnY4+GXUC8nyA346Dz2qQjTy6bcOdYrD/Gjn1GVHcgzIUgd?=
 =?us-ascii?Q?Kz66+9UoB7TrHFruEQbRwvB9b+xXNYr9phabFqntn/DAPYWfEjGnu/doi3/I?=
 =?us-ascii?Q?qsJUZIvQA8ShexCJvBxuIFLPlQOZiMRZ24fIBYu0bEPpvJFOwKMvp2RUUE2Z?=
 =?us-ascii?Q?S33a41yze8mWiC5buT4qPtQ2Fw/6CCYKrkLCbVNiVQVjexH5aD4GX0lQ9LI4?=
 =?us-ascii?Q?7uZN2eVGsyvDoTI/Qeb/uH66lxRPiCf7fXrNPRdC/mzbddOqVuSYw8s+DmY8?=
 =?us-ascii?Q?s4VWNwTdJgONf5b1xtrz6CPhhONW1faqYKXU7W2ZNUGm7stQdRelYA0bUS//?=
 =?us-ascii?Q?rtyij/EV1BrtL/9rzw7GgUiGS2fdDS/FCB9taq8g6S0JC4Du4SOZm7KDM50q?=
 =?us-ascii?Q?4bZgUpBgLEWc6tk657LnLXMPKu0NfmcSKIetb6EcSg9remmvlH2q2dOGtRw0?=
 =?us-ascii?Q?3cTLpjRBVI+OEpgTyPb3YrKM7682m2BWxdUY/yeafmAu37B1X5qKt9QR+oVb?=
 =?us-ascii?Q?vo+/BsAlU5nWPGs/jgJrAUQjB69KbwMlRKzxhn4QWbQ4OPwC6CUmcdUqU7dr?=
 =?us-ascii?Q?eS9e0scYtXJw7mQR8vCKf1o/bxraaKuda+18zc1dW7Gp9zyOLBsV7EsSaBHa?=
 =?us-ascii?Q?5K21W2E5G0W6bAukTZsCTAj697cUqjXMyPRa8ZmIl9xCjhPpuV+qe0kY5PvX?=
 =?us-ascii?Q?/ZIRvHo2S4znGjTOJpMAv71h1h76jYPXiVBPeOyWoumD32jQk0az9NYFszPG?=
 =?us-ascii?Q?keeLeYXAZRmOa5Pzvs0CV0LFuWkNF5BCxdKy50B5rLJ90PdHYiBFvKusfOQR?=
 =?us-ascii?Q?kOvNqA4wLCfzXcWRbkAmIdXfSf7cCUugTc0xWtxaMNM9M11BsUp9ke2GgZXK?=
 =?us-ascii?Q?UK/XkwpfJp+kkzSpvyqn3hdRRQDTk2o+SVGB27j6VpHJ7njPItYxE5tKctHA?=
 =?us-ascii?Q?VOL/ckXK61AM1y4iTQoPdFi6eOs3ciVZiZjQP907?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vR1vmNbJND1jhJZdGwA8cj9lqzU6VKqN0QJper7PvaUt/aTd2mNPD8pLYCOj8V5NZ9cMkUN0XJQnD0EIfSHQ/oWPoPjArbAHbclJ3rciygtHo9Y6zEhOx2nrmNtml1G+56E+jyPX8rAB9H6yDo2ZWKHerPztZnJfC6hfX5swOByq/Z+ptiNGE17Ks4BXxKo+KRKXOLANT4298WHcDxmLItlS4N1JalFp1w9L+XKlmOPK51HrnImjFCy3gySD0Yk9osRV1CGE9ba+O0aFw+KAcSid9kQ9NSQ7gx2/Um6bNX2tK0J2qLsy8i/2IrkmoT6koIUc1O4ZKtHI7wmJZBKpfe9vyp8zt+Xyr1y0FsFqp4gSiNK7/CQhFzGi+d6lja2k1hdiw8osMr3La6/U9LCJv8OU04KdvE6GPd1Z/ZVEE9cbJpN8blZYkNMiF1whmxtlgasHZMtxXoOX4xENEoJDBTezu/o0hKs9Ks29kjE+uMdsW1iiBR6ChR7iM5es4Ur3leeXy2slWV3pDGJE7N0OxmyGR3DrKWKMhfP08akx0tViKtY3Lsn0LuGILvaIgUINzlz1I4RNBsKsArBGx2qPUvxAqmzcJ5xIq43qkNqr/XU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf987a0-f802-44c0-deb5-08dc966b774a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:09.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++2XlCJnheryK+awahOF77zAwFGQzO+T/VSWUNYkxX7ecFqAWZK+VPSKRQGGWjHHUj5/yWpFa/j2jXS7Wm0mig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: 6PvWmVl2QfbyAZ9_ZDqrohVxgXncVU06
X-Proofpoint-ORIG-GUID: 6PvWmVl2QfbyAZ9_ZDqrohVxgXncVU06

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 5dbd75e3..5f0c56db 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -295,6 +295,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	/* Mark the provider as a PID-based provider. */
 	pvp->pv_flags |= DT_PROVIDER_PID;
 
+	/* Look up or create the underlying probe. */
 	uprp = create_underlying(dtp, psp);
 	if (uprp == NULL)
 		return -1;
@@ -302,6 +303,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	upp = uprp->prv_data;
 	upp->flags |= flags;
 
+	/* Look up the overlying probe. */
 	prp = dt_probe_lookup(dtp, &pd);
 	if (prp != NULL) {
 		/*
-- 
2.18.4

